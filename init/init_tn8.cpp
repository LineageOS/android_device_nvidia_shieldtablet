/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <errno.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "init.h"
#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"
#include "service.h"
#include <stdio.h>
#include <string.h>

#define ANDROID_BUILD_VERSION "7.0"
#define ANDROID_BUILD_RELEASE "NRD90M"
#define NVIDIA_BUILD_VERSION "1928188_841.9637"
#define FINGERPRINT_VERSION ANDROID_BUILD_VERSION "/" ANDROID_BUILD_RELEASE "/" NVIDIA_BUILD_VERSION
#define DESCRIPTION_VERSION ANDROID_BUILD_VERSION " " ANDROID_BUILD_RELEASE " " NVIDIA_BUILD_VERSION

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void gsm_properties()
{
    property_set("cm.icera.enabled", "1");
    property_set("ril.icera-config-args", "notifier:ON,datastall:ON,lwaactivate");
    property_set("gsm.modem.power.device", "/sys/devices/platform/tegra_usb_modem_power/modem_reset/value,0,1");
    property_set("gsm.modem.edp.device", "/sys/power/sysedp");
    property_set("gsm.modem.edp.state", "/sys/devices/platform/sysedp_modem/sysedp_state");
    property_set("ro.ril.devicename", "/dev/ttyACM0");
    property_set("mdc_initial_max_retry", "10");
    property_set("rild.libpath", "libril-icera.so");
    property_set("rild.libargs", "-e rmnet0 -e rmnet0:0 -e rmnet0:1 -n");
    property_set("gsm.modem.crashlogs.directory", "/data/rfs/data/debug");
    property_set("ril.maxretries", "15");
    property_set("gsm.modem.powercontrol", "enabled");
    property_set("ro.ril.wake_lock_timeout", "200000");
    property_set("ro.telephony.default_network", "9");
}

void vendor_load_properties()
{
    std::string platform = "";
    std::string model = "";
    FILE  *fp = NULL;
    char  *board_info = NULL;
    char  *override = NULL;
    size_t len = 0;
    enum {
      wx_unknown,
      wx_na_wf,
      wx_un_do,
      wx_un_mo
    };
    int detected_model = wx_unknown;

    platform = property_get("ro.board.platform");
    if (strncmp(platform.c_str(), ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    // Check for persistent model override
    fp = fopen("/data/property/persist.cm.shield.model", "r");
    if (fp) {
        while ((getline(&override, &len, fp)) != (ssize_t)-1) {
            if (strstr(override, "wx_"))
                break;
        }
        fclose(fp);

        if (override) {
            if (!strncmp(override, "wx_na_wf", PROP_VALUE_MAX))
                detected_model = wx_na_wf;
            else if (!strncmp(override, "wx_na_do", PROP_VALUE_MAX) ||
                     !strncmp(override, "wx_un_do", PROP_VALUE_MAX))
                detected_model = wx_un_do;
            else if (!strncmp(override, "wx_un_mo", PROP_VALUE_MAX))
                detected_model = wx_un_mo;

            if (detected_model == wx_unknown)
                ERROR("Invalid model override value given: %s\n", override);
            else
                ERROR("Overriding device model to %s\n", override);

            free(override);
        }
    }

    // If not overridden.
    if (detected_model == wx_unknown) {
        // Get model from /proc/cmdline
        fp = fopen("/proc/cmdline", "r");
        if (fp == NULL)
            return;
        while ((getline(&board_info, &len, fp)) != (ssize_t)-1) {
            if (strstr(board_info, "board_info"))
                break;
        }
        fclose(fp);

        if (strstr(board_info, "0x00ea"))
            detected_model = wx_na_wf;
        else if (strstr(board_info, "0x04d2"))
            detected_model = wx_un_do;
        else //if (strstr(board_info, "0x????"))
            detected_model = wx_un_mo;

        free(board_info);
    }

    switch (detected_model) {
        case wx_na_wf:
            /* Wi-Fi Only */
            model = "wx_na_wf";
            property_set("ro.radio.noril", "true");
            break;

        case wx_un_do:
            /* Data Only, Can't tell the difference from cmdline, so just using wx_un_do. It's the same hardware for both versions */
            model = "wx_un_do";
            gsm_properties();
            property_set("ro.modem.do", "1");
            break;

        case wx_un_mo:
            /* Rest of World Voice (Device never got released, but is partially in upstream source) */
            model = "wx_un_mo";
            gsm_properties();
            property_set("ro.modem.vc", "1");
            break;
    }

    property_override("ro.build.fingerprint", ("NVIDIA/" + model + "/shieldtablet:" + FINGERPRINT_VERSION + ":user/release-keys").c_str());
    property_override("ro.build.description", (model + "-user " + DESCRIPTION_VERSION + " release-keys").c_str());
    property_override("ro.product.name", model.c_str());
    property_override("ro.build.product", "shieldtablet");
    property_override("ro.product.device", "shieldtablet");
    property_override("ro.product.model", "SHIELD Tablet");
    model = property_get("ro.product.name");
    ERROR("Setting build properties for %s model\n", model.c_str());
}

int vendor_handle_control_message(const std::string &msg, const std::string &arg)
{
    Service *sf_svc = NULL;
    Service *zg_svc = NULL;

    if (!msg.compare("restart") && !arg.compare("consolemode")) {
        sf_svc = ServiceManager::GetInstance().FindServiceByName("surfaceflinger");
        zg_svc = ServiceManager::GetInstance().FindServiceByName("zygote");

        if (sf_svc && zg_svc) {
            zg_svc->Stop();
            sf_svc->Stop();
            sf_svc->Start();
            zg_svc->Start();
        } else {
            ERROR("Required services not found to toggle console mode");
        }

        return 0;
    }

    return -EINVAL;
}

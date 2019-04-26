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

#include "init_tegra.h"
#include "service_shield.h"

#include <map>

void set_usb_props(tegra_init *ti)
{
	std::map<std::string, std::string> mtn8    = { { "ro.vendor.nv.usb.vid",               "0955" },
	                                               { "ro.vendor.nv.usb.pid.mtp",           "CF07" },
	                                               { "ro.vendor.nv.usb.pid.mtp.adb",       "CF05" },
	                                               { "ro.vendor.nv.usb.pid.rndis",         "CF08" },
	                                               { "ro.vendor.nv.usb.pid.rndis.acm.adb", "CF08" },
	                                               { "ro.vendor.nv.usb.pid.rndis.adb",     "CF08" },
	                                               { "ro.vendor.nv.usb.pid.ptp",           "CF07" },
	                                               { "ro.vendor.nv.usb.pid.ptp.adb",       "CF05" } };

	std::map<std::string, std::string> mardbeg = { { "ro.vendor.nv.usb.vid",               "0955" },
	                                               { "ro.vendor.nv.usb.pid.mtp",           "7102" },
	                                               { "ro.vendor.nv.usb.pid.mtp.adb",       "7100" },
	                                               { "ro.vendor.nv.usb.pid.rndis",         "7103" },
	                                               { "ro.vendor.nv.usb.pid.rndis.acm.adb", "7103" },
	                                               { "ro.vendor.nv.usb.pid.rndis.adb",     "7103" },
	                                               { "ro.vendor.nv.usb.pid.ptp",           "7102" },
	                                               { "ro.vendor.nv.usb.pid.ptp.adb",       "7100" } };

	if (ti->is_model("tn8")) {
		for (auto const& nvusb : mtn8)
			ti->property_set(nvusb.first, nvusb.second);
	} else {
		for (auto const& nvusb : mardbeg)
			ti->property_set(nvusb.first, nvusb.second);
	}
}

void vendor_load_properties()
{
	// ATM there is no know way to differentiate between wx_na_wf and sb_na_wf or wx_na_wf and wx_un_do. Little is known of wx_un_mo either.
	//                                             device          name          model               id    sku   boot device type                 api  dpi
	std::vector<tegra_init::devices> devices = { { "shieldtablet", "wx_na_wf",   "SHIELD Tablet",    1761,  234, tegra_init::boot_dev_type::EMMC, 19,  320 },
	                                             { "shieldtablet", "wx_un_do",   "SHIELD Tablet",    1761, 1234, tegra_init::boot_dev_type::EMMC, 19,  320 },
	                                             { "shieldtablet", "sb_na_wf",   "SHIELD Tablet K1", 1761,  234, tegra_init::boot_dev_type::EMMC, 21,  320 },
	                                             { "ardbeg",       "ardbeg",     "Ardbeg",           1780, 1001, tegra_init::boot_dev_type::EMMC, 19,  320 },
	                                             { "jetson-tk1",   "jetson-tk1", "Jetson TK1",        375,    0, tegra_init::boot_dev_type::EMMC, 19,  320 },
	                                             { "loki",         "loki",       "SHIELD Portable",  2530,  100, tegra_init::boot_dev_type::EMMC, 19,  214 },
	                                             { "loki",         "loki_p",     "SHIELD Portable",  2530,    0, tegra_init::boot_dev_type::EMMC, 19,  240 },
	                                             { "shieldtablet", "wx_na_do",   "SHIELD Tablet",    1761, 1234, tegra_init::boot_dev_type::EMMC, 19,  320 },
	                                             { "shieldtablet", "wx_un_mo",   "SHIELD Tablet",    1761,    0, tegra_init::boot_dev_type::EMMC, 19,  320 } };
	tegra_init::build_version sav = { "7.0", "NRD90M", "1928188_1038.3875" };

	tegra_init ti(devices);
	ti.set_properties();
	ti.set_fingerprints(sav);

	set_usb_props(&ti);
}

int vendor_handle_control_message(const std::string &msg, const std::string &arg)
{
    return shield_handle_control_message(msg, arg);
}

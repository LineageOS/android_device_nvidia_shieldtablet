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

#include <map>

void vendor_set_usb_product_ids(tegra_init *ti)
{
	std::map<std::string, std::string> mCommonUsbIds, mDeviceUsbIds;

	mCommonUsbIds["ro.vendor.nv.usb.vid"] = "0955";

	if (ti->is_model("wx_na_wf") || ti->is_model("sb_na_wf") ||
	    ti->is_model("wx_na_do") || ti->is_model("wx_un_do") ||
	    ti->is_model("wx_un_mo")) {
		mDeviceUsbIds["ro.vendor.nv.usb.pid.mtp"]       = "CF07";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.mtp.adb"]   = "CF05";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.ptp"]       = "CF07";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.ptp.adb"]   = "CF05";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.rndis"]     = "CF08";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.rndis.adb"] = "CF08";
	} else {
		mDeviceUsbIds["ro.vendor.nv.usb.pid.mtp"]       = "7102";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.mtp.adb"]   = "7100";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.ptp"]       = "7102";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.ptp.adb"]   = "7100";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.rndis"]     = "7103";
		mDeviceUsbIds["ro.vendor.nv.usb.pid.rndis.adb"] = "7103";
	}

	for (auto const& id : mDeviceUsbIds)
		ti->property_set(id.first, id.second);

	for (auto const& id : mCommonUsbIds)
		ti->property_set(id.first, id.second);
}

void vendor_load_properties()
{
	// ATM there is no know way to differentiate between wx_na_wf and sb_na_wf or wx_na_wf and wx_un_do. Little is known of wx_un_mo either.
	//                                             device          name           model               id    sku   api dpi
	std::vector<tegra_init::devices> devices = { { "shieldtablet", "wx_na_wf",    "SHIELD Tablet",    1761,  234, 19, 320 },
	                                             { "shieldtablet", "wx_un_do",    "SHIELD Tablet",    1761, 1234, 19, 320 },
	                                             { "ardbeg",       "ardbeg",      "Ardbeg",           1780, 1001, 19, 320 },
	                                             { "jetson-tk1",   "jetson-tk1",  "Jetson TK1",        375,    0, 19, 320 },
	                                             { "loki",         "loki",        "SHIELD Portable",  2530,  100, 19, 320 },
	                                             { "loki",         "loki_p",      "SHIELD Portable",  2530,    0, 19, 320 },
	                                             { "shieldtablet", "sb_na_wf",    "SHIELD Tablet K1", 1761,  234, 21, 320 },
	                                             { "shieldtablet", "wx_na_do",    "SHIELD Tablet",    1761, 1234, 19, 320 },
	                                             { "shieldtablet", "wx_un_mo",    "SHIELD Tablet",    1761,    0, 19, 320 } };
	tegra_init::build_version sav = { "7.0", "NRD90M", "1928188_1065.2559" };

	tegra_init ti(devices);
	ti.set_properties();
	ti.set_fingerprints(sav);

	if (ti.recovery_context()) {
		ti.property_set("ro.product.vendor.model", ti.property_get("ro.product.model"));
		ti.property_set("ro.product.vendor.manufacturer", ti.property_get("ro.product.manufacturer"));
	}

	if (ti.vendor_context() || ti.recovery_context())
		vendor_set_usb_product_ids(&ti);
}

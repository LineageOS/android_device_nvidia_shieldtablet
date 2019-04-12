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

#include "init_shield.h"
#include "service_shield.h"

void vendor_load_properties()
{
	// ATM there is no know way to differentiate between wx_na_wf and sb_na_wf or wx_na_wf and wx_un_do. Little is known of wx_un_mo either.
	//                                              device          name        model               board id  gsm support                               boot device type                 api  dpi
	std::vector<shield_init::devices> devices = { { "shieldtablet", "wx_na_wf", "SHIELD Tablet",    "0x00ea", shield_init::gsm_support_type::NONE,      shield_init::boot_dev_type::EMMC, 19, 320 },
	                                              { "shieldtablet", "wx_un_do", "SHIELD Tablet",    "0x04d2", shield_init::gsm_support_type::DATA_ONLY, shield_init::boot_dev_type::EMMC, 19, 320 },
	                                              { "shieldtablet", "sb_na_wf", "SHIELD Tablet K1", "0x00ea", shield_init::gsm_support_type::NONE,      shield_init::boot_dev_type::EMMC, 21, 320 },
	                                              { "loki",         "loki_p",   "SHIELD Portable",  "0x0000", shield_init::gsm_support_type::NONE,      shield_init::boot_dev_type::EMMC, 19, 320 },
	                                              { "shieldtablet", "wx_na_do", "SHIELD Tablet",    "0x04d2", shield_init::gsm_support_type::DATA_ONLY, shield_init::boot_dev_type::EMMC, 19, 320 },
	                                              { "shieldtablet", "wx_un_mo", "SHIELD Tablet",    "0x????", shield_init::gsm_support_type::VOICE,     shield_init::boot_dev_type::EMMC, 19, 320 } };
	shield_init::build_version sav = { "7.0", "NRD90M", "1928188_1038.3875" };

	shield_init si(devices, false, sav, std::vector<std::string>());
	si.set_properties();
}

int vendor_handle_control_message(const std::string &msg, const std::string &arg)
{
    return shield_handle_control_message(msg, arg);
}

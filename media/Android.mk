# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := audio_policy.conf
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := audio_policy.conf
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := audioConfig_qvoice_icera_pc400.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := audioConfig_qvoice_icera_pc400.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := nvaudio_conf.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := nvaudio_conf.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := nvaudio_fx.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := nvaudio_fx.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := media_codecs.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
ifeq ($(TARGET_TEGRA_OMX),nvmm-t124)
LOCAL_SRC_FILES     := media_codecs.xml
else
LOCAL_SRC_FILES     := media_codecs_sw.xml
endif
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := media_codecs_performance.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := media_codecs_performance.xml
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := media_profiles.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := media_profiles.xml
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

#
# Copyright (C) 2014 The CyanogenMod Project
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
#

$(call inherit-product, device/nvidia/t124-common/t124.mk)
$(call inherit-product, device/nvidia/icera/icera.mk)
$(call inherit-product, device/nvidia/touch/raydium.mk)
$(call inherit-product, device/nvidia/shield-common/shield.mk)

# System properties
include $(LOCAL_PATH)/system_prop.mk

PRODUCT_CHARACTERISTICS  ?= tablet
PRODUCT_AAPT_CONFIG      := xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 1920
TARGET_SCREEN_WIDTH      := 1200

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init related
PRODUCT_PACKAGES += \
    fstab.ardbeg \
    fstab.jetson-tk1 \
    fstab.loki \
    fstab.tn8 \
    fstab.yellowstone \
    init.recovery.ardbeg.rc \
    init.recovery.jetson-tk1.rc \
    init.recovery.loki.rc \
    init.recovery.tn8.rc \
    init.recovery.yellowstone.rc \
    init.ardbeg.rc \
    init.jetson-tk1.rc \
    init.loki.rc \
    init.tn8.rc \
    init.tn8_common.rc \
    init.yellowstone.rc \
    power.ardbeg.rc \
    power.jetson-tk1.rc \
    power.loki.rc \
    power.tn8.rc \
    power.yellowstone.rc \
    ueventd.tn8.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.conf \
    gpsconfig.xml

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

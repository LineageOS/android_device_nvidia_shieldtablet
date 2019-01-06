#
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
#

BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12799754240
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1342177280
TARGET_USERIMAGES_USE_EXT4         := true

# Assert
TARGET_OTA_ASSERT_DEVICE := shieldtablet,loki,ardbeg,jetson-tk1,yellowstone

# Bluetooth
BOARD_HAVE_BLUETOOTH     := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG   := device/nvidia/shieldtablet/comms/vnd_shieldtablet.txt
BCM_BLUETOOTH_MANTA_BUG  := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nvidia/shieldtablet/comms

# Bootloader versions
TARGET_BOARD_INFO_FILE := device/nvidia/shieldtablet/board-info.txt

# Fingerprint override
BUILD_FINGERPRINT := nvidia/wx_un_do/shieldtablet:7.0/NRD90M/1928188_1038.3875:user/release-keys

# Hardware overlays
JAVA_SOURCE_OVERLAYS := org.lineageos.hardware|device/nvidia/shieldtablet/lineagehw|**/*.java

# Kernel
TARGET_KERNEL_SOURCE    := kernel/nvidia/shield
TARGET_KERNEL_CONFIG    := lineageos_shieldtablet_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_CMDLINE    := vmalloc=300M

# Manifest
DEVICE_MANIFEST_FILE := device/nvidia/shieldtablet/manifest.xml

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/shieldtablet/initfiles/fstab.tn8

# TWRP Support
ifeq ($(WITH_TWRP),true)
include device/nvidia/shieldtablet/twrp/twrp.mk
endif

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_tegra libinit_shield libinit_tn8

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"

include device/nvidia/t124-common/BoardConfigCommon.mk
include device/nvidia/icera/BoardConfigIcera.mk
include device/nvidia/touch/BoardConfigTouch.mk

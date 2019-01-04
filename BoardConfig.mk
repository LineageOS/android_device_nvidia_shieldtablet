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

# Kernel
TARGET_KERNEL_SOURCE    := kernel/nvidia/shield
TARGET_KERNEL_CONFIG    := lineageos_shieldtablet_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# Recovery
TARGET_RECOVERY_FSTAB := device/nvidia/shieldtablet/initfiles/fstab.tn8

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_tegra libinit_shield libinit_tn8

include device/nvidia/t124-common/BoardConfigCommon.mk

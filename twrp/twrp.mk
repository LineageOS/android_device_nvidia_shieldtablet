BOARD_RAMDISK_USE_LZMA := true

PRODUCT_COPY_FILES += device/nvidia/shieldtablet/twrp/twrp.fstab:recovery/root/system/etc/twrp.fstab

TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255

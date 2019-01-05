PRODUCT_COPY_FILES += device/nvidia/shieldtablet/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

TW_THEME := portrait_hdpi
BOARD_HAS_FLIPPED_SCREEN := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255

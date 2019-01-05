PRODUCT_COPY_FILES += device/nvidia/shieldtablet/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

TW_THEME := portrait_hdpi
TW_ROTATION := 180
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255

# OpenGLES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 196609

# Screen DPI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Tegra DIDIM Battery Saver Technology
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.didim.enable = 1 \
    persist.tegra.didim.video = 5 \
    persist.tegra.didim.normal = 3

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.sensors=default.mpl520.nvs

# USB Vendor and Product ID Definitions
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nv.usb.vid=0955 \
    ro.nv.usb.pid.mtp=CF07 \
    ro.nv.usb.pid.mtp.adb=CF05 \
    ro.nv.usb.pid.rndis=CF08 \
    ro.nv.usb.pid.rndis.acm.adb=CF08 \
    ro.nv.usb.pid.rndis.adb=CF08 \
    ro.nv.usb.pid.ptp=CF07 \
    ro.nv.usb.pid.ptp.adb=CF05

# Adb compat for older kernels
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.ffs.aio_compat=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/mnt/factory/bluetooth/bt_mac.txt

# Smartdimmer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.didim.enable = 1 \
    persist.tegra.didim.video = 5 \
    persist.tegra.didim.normal = 3

# USB Vendor and Product ID Definition
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nv.usb.vid=0955 \
    ro.nv.usb.pid.mtp=CF07 \
    ro.nv.usb.pid.mtp.adb=CF05 \
    ro.nv.usb.pid.rndis=CF08 \
    ro.nv.usb.pid.rndis.acm.adb=CF08 \
    ro.nv.usb.pid.rndis.adb=CF08 \
    ro.nv.usb.pid.ptp=CF07 \
    ro.nv.usb.pid.ptp.adb=CF05

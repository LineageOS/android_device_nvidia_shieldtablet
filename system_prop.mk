# Adb compat for older kernels
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.ffs.aio_compat=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/mnt/factory/bluetooth/bt_mac.txt

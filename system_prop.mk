# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/mnt/vendor/factory/bluetooth/bt_mac.txt

# Recents
PRODUCT_PROPERTY_OVERRIDES += \
   ro.recents.grid=true

# Smartdimmer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.didim.enable = 1 \
    persist.tegra.didim.video = 5 \
    persist.tegra.didim.normal = 3

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
   ap.interface=wlan0 \
   wifi.direct.interface=p2p-dev-wlan0 \
   wifi.interface=wlan0

# Inherit device configuration for shieldtablet.
$(call inherit-product, device/nvidia/shieldtablet/full_shieldtablet.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_shieldtablet
PRODUCT_DEVICE := shieldtablet

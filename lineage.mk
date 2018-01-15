# Inherit device configuration for shieldtablet.
$(call inherit-product, device/nvidia/shieldtablet/full_shieldtablet.mk)

# Inherit some common lineage stuff.
ifeq ($(ALTERNATE_BUILD),true)
$(call inherit-product, vendor/cm/config/common_full_tv.mk)
else
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
endif

PRODUCT_NAME := lineage_shieldtablet
PRODUCT_DEVICE := shieldtablet

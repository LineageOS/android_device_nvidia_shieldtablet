# Recents
PRODUCT_PROPERTY_OVERRIDES += \
   ro.recents.grid=true

# LMKd
PRODUCT_PRODUCT_PROPERTIES += \
    ro.lmk.low=1001 \
    ro.lmk.medium=800 \
    ro.lmk.critical=0 \
    ro.lmk.critical_upgrade=false \
    ro.lmk.upgrade_pressure=100 \
    ro.lmk.downgrade_pressure=100 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=100 \
    ro.lmk.use_minfree_levels=true

# Smartdimmer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.didim.enable = 1 \
    persist.tegra.didim.video = 5 \
    persist.tegra.didim.normal = 3

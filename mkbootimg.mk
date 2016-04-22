LOCAL_PATH := $(call my-dir)

DTB_FILE = $(KERNEL_OUT)/arch/arm/boot/dts/tegra124-tn8-p1761-1270-a04-e-battery.dtb
KERNEL_ZIMG = $(KERNEL_OUT)/arch/arm/boot/zImage
KERNEL_ZIMG_DTB = $(KERNEL_ZIMG)-dtb
KERNEL_APP = $(OUT)/kernel

$(KERNEL_ZIMG_DTB): $(KERNEL_APP)
	cat $(KERNEL_ZIMG) $(DTB_FILE) > $(KERNEL_ZIMG_DTB);
	rm -f $(KERNEL_APP);
	cp $(KERNEL_ZIMG_DTB) $(KERNEL_APP);

## Overload bootimg generation: Same as the original, except use appended dtb kernel
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(KERNEL_ZIMG_DTB)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

## Overload recoveryimg generation: Same as the original, except use appended dtb kernel
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		$(KERNEL_ZIMG_DTB)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}

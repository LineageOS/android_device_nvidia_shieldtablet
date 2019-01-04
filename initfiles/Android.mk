LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := fstab.ardbeg
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := fstab.tn8
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := fstab.jetson-tk1
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := fstab.tn8
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := fstab.loki
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := fstab.tn8
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := fstab.tn8
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := fstab.tn8
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := fstab.yellowstone
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := fstab.tn8
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.ardbeg.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.recovery.touch.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.jetson-tk1.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.recovery.notouch.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.loki.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.recovery.touch.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.tn8.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.recovery.tn8.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.yellowstone.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.recovery.touch.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := init.ardbeg.rc
LOCAL_MODULE_TAGS          := optional eng
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := init.ardbeg.rc
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := init.jetson-tk1.rc
LOCAL_MODULE_TAGS          := optional eng
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := init.loki.rc
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := init.loki.rc
LOCAL_MODULE_TAGS          := optional eng
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := init.loki.rc
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := init.tn8.rc
LOCAL_MODULE_TAGS          := optional eng
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := init.tn8.rc
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := init.tn8_common.rc
LOCAL_MODULE_TAGS          := optional eng
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := init.tn8_common.rc
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := init.yellowstone.rc
LOCAL_MODULE_TAGS          := optional eng
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := init.tn8.rc
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := power.ardbeg.rc
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := power.tn8.rc
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := power.jetson-tk1.rc
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := power.tn8.rc
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := power.loki.rc
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := power.tn8.rc
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := power.tn8.rc
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := power.tn8.rc
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := power.yellowstone.rc
LOCAL_MODULE_TAGS   := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := power.tn8.rc
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.tn8.rc
LOCAL_MODULE_STEM  := ueventd.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := ueventd.tn8.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR)
include $(BUILD_PREBUILT)

#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter charlotte, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)
# native_packages hack
VENDOR_NATIVE_PACKAGES_FIXUP := $(TARGET_OUT_VENDOR)/etc/native_packages.xml
$(VENDOR_NATIVE_PACKAGES_FIXUP): $(TARGET_OUT_VENDOR)/etc/native_packages.bin
	@echo "Move native_packages.bin to native_packages.xml"
	$(hide) mv $(TARGET_OUT_VENDOR)/etc/native_packages.bin $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_NATIVE_PACKAGES_FIXUP)

endif

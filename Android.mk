#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter berkeley blanc charlotte emily, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

# EGL symlinks
EGL_LIBS := hw/vulkan.kirin970.so

EGL_32_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(EGL_LIBS))
$(EGL_32_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "EGL 32 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib/egl/libGLES_mali.so $@

EGL_64_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib64/,$(EGL_LIBS))
$(EGL_64_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "EGL 64 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/egl/libGLES_mali.so $@

# native_packages hack
VENDOR_NATIVE_PACKAGES_FIXUP := $(TARGET_OUT_VENDOR)/etc/native_packages.xml
$(VENDOR_NATIVE_PACKAGES_FIXUP): $(TARGET_OUT_VENDOR)/etc/native_packages.bin
	@echo "Move native_packages.bin to native_packages.xml"
	$(hide) mv $(TARGET_OUT_VENDOR)/etc/native_packages.bin $@

# modemConfig hack
MODEM_CONFIG_FIXUP := $(TARGET_OUT_VENDOR)/etc/modemConfig/observe_config_encryt.xml
$(MODEM_CONFIG_FIXUP): $(TARGET_OUT_VENDOR)/etc/modemConfig/observe_config_encryt.bin
	@echo "Move observe_config_encryt.bin to observe_config_encryt.xml"
	$(hide) mv $(TARGET_OUT_VENDOR)/etc/modemConfig/observe_config_encryt.bin $@

# Keymaster Hack
KEYMASTER_SERVICE := $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.keymaster@3.0-service.real
$(KEYMASTER_SERVICE): $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.keymaster@3.0-service.hisi
	@echo "Relocate keymaster service"
	$(hide) mv $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.keymaster@3.0-service.hisi $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.keymaster@3.0-service

KEYMASTER_IMPL_32 := $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.keymaster@3.0-impl.real.so
$(KEYMASTER_IMPL_32): $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.keymaster@3.0-impl.hisi.so
	@echo "Relocate keymaster 32bit impl"
	$(hide) mv $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.keymaster@3.0-impl.hisi.so $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.keymaster@3.0-impl.so

KEYMASTER_IMPL_64 := $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.keymaster@3.0-impl.real.so
$(KEYMASTER_IMPL_64): $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.keymaster@3.0-impl.hisi.so
	@echo "Relocate keymaster 64bit impl"
	$(hide) mv $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.keymaster@3.0-impl.hisi.so $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.keymaster@3.0-impl.so

# odm ncfg dir
ODM_NCFG_DIR := $(TARGET_OUT_ODM)/etc/ncfg
$(ODM_NCFG_DIR):
	@echo "Creating /odm/etc/ncfg"
	$(hide) mkdir -p $@

ALL_DEFAULT_INSTALLED_MODULES += $(EGL_32_SYMLINKS) $(EGL_64_SYMLINKS) $(MODEM_CONFIG_FIXUP) $(VENDOR_NATIVE_PACKAGES_FIXUP) $(KEYMASTER_SERVICE) $(KEYMASTER_IMPL_32) $(KEYMASTER_IMPL_64) $(ODM_NCFG_DIR)

endif

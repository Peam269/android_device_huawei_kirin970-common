#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Common Path
COMMON_PATH := device/huawei/kirin970-common

## Inherit common vendor blobs
$(call inherit-product, vendor/huawei/kirin970-common/kirin970-common-vendor.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/fstab.kirin970:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.kirin970 \
    $(COMMON_PATH)/configs/init/fstab.kirin970:$(TARGET_COPY_OUT_RAMDISK)/fstab.kirin970 \
    $(COMMON_PATH)/configs/init/fstab.modem:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.modem \
    $(COMMON_PATH)/configs/init/init.audio.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.audio.rc \
    $(COMMON_PATH)/configs/init/init.balong_modem.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.balong_modem.rc \
    $(COMMON_PATH)/configs/init/init.chip.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.chip.usb.rc \
    $(COMMON_PATH)/configs/init/init.connectivity.bcm4359.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.connectivity.bcm4359.rc \
    $(COMMON_PATH)/configs/init/init.connectivity.gps.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.connectivity.gps.rc \
    $(COMMON_PATH)/configs/init/init.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.device.rc \
    $(COMMON_PATH)/configs/init/init.hisi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.hisi.rc \
    $(COMMON_PATH)/configs/init/init.hisi.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.hisi.usb.rc \
    $(COMMON_PATH)/configs/init/init.kirin970.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.kirin970.rc \
    $(COMMON_PATH)/configs/init/init.manufacture.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.manufacture.rc \
    $(COMMON_PATH)/configs/init/init.performance.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.performance.rc \
    $(COMMON_PATH)/configs/init/init.platform.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.platform.rc \
    $(COMMON_PATH)/configs/init/init.post-fs-data.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.post-fs-data.rc \
    $(COMMON_PATH)/configs/init/init.recovery.kirin970.rc:$(TARGET_RECOVERY_OUT)/root/init.recovery.kirin970.rc \
    $(COMMON_PATH)/configs/init/init.tee.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.tee.rc \
    $(COMMON_PATH)/configs/init/init.vowifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.vowifi.rc \
    $(COMMON_PATH)/configs/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    hardware/hisi

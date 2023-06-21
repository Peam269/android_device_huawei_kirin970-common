#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Common Path
COMMON_PATH := device/huawei/kirin970-common

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/init.recovery.kirin970.rc:$(TARGET_RECOVERY_OUT)/root/init.recovery.kirin970.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    hardware/hisi

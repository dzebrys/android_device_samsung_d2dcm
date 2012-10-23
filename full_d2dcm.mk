# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
 
#
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#
 
# Torch
PRODUCT_PACKAGES := \
    Torch

# d2dcm Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/d2dcm/ramdisk/lib/modules/exfat_core.ko:root/lib/modules/exfat_core.ko \
    device/samsung/d2dcm/ramdisk/lib/modules/exfat_fs.ko:root/lib/modules/exfat_fs.ko \
    device/samsung/d2dcm/ramdisk/init.emmc.rc:root/init.emmc.rc \
    device/samsung/d2dcm/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/samsung/d2dcm/ramdisk/init.rc:root/init.rc \
    device/samsung/d2dcm/ramdisk/initlogo.rle:root/initlogo.rle \
    device/samsung/d2dcm/ramdisk/ueventd.rc:root/ueventd.rc

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from d2dcm device
$(call inherit-product, device/samsung/d2dcm/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_d2dcm
PRODUCT_DEVICE := d2dcm
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SC-06D

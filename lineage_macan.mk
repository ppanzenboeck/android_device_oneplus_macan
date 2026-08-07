#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from macan device
$(call inherit-product, device/oneplus/macan/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_macan
PRODUCT_DEVICE := macan

BYPASS_CHARGE_SUPPORTED := true

# Keep fixed-source video below 60 fps from selecting high refresh-rate modes.
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    debug.sf.frame_rate_multiple_threshold=120

PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2767

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi_64-user 16 BP2A.250605.015 1780676259386 release-keys" \
    BuildFingerprint=OnePlus/CPH2767IN/OP612DL1:16/BP2A.250605.015/B.R4T3.4abf2bb-269311f-26d6a3c:user/release-keys \
    DeviceName=OP612DL1 \
    DeviceProduct=CPH2767 \
    SystemDevice=OP612DL1 \
    SystemName=CPH2767

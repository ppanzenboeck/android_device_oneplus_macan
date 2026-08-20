#
# Copyright (C) 2021-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_module_config_primary.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_module_config_primary.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2800
TARGET_SCREEN_WIDTH := 1272

# OPlus Camera
  $(call inherit-product-if-exists, device/oneplus/infiniti-camera/opluscamera.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/oplus-romupdate-component-overrides.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/oplus-romupdate-component-overrides.xml

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946700822127507.xml

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint3-service.strongbox.nxp \
    android.hardware.weaver-service.nxp

# LiveDisplay
$(call soong_config_set_bool,OPLUS_LINEAGE_LIVEDISPLAY_HAL,ENABLE_SE,false)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    FrameworksResEuicc_EU \
    FrameworksResEuicc_ROW \
    OPlusFrameworksResTarget \
    OPlusSettingsProviderResTarget \
    OPlusSettingsResTarget \
    OPlusSystemUIResTarget \
    OPlusWifiResTarget

# Regional properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/24877/build.EU.prop:$(TARGET_COPY_OUT_ODM)/etc/24877/build.EU.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/24877/build.IN.prop:$(TARGET_COPY_OUT_ODM)/etc/24877/build.IN.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/24877/build.ROW.prop:$(TARGET_COPY_OUT_ODM)/etc/24877/build.ROW.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/24877/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/24877/build.default.prop

# Properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.version.ota=CPH2767_11.A.47_0470_202606060131 \
    ro.oplus.product.series=flagship_series

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    device/oneplus/infiniti/vintf/device_framework_matrix.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    OplusEsimSwitcher \
    OplusEuicc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Touch features
$(call soong_config_set_bool,OPLUS_LINEAGE_TOUCH_HAL,ENABLE_GM,true)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator.service.oplus-richtap

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/oneplus/sm8850-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/oneplus/macan/macan-vendor.mk)

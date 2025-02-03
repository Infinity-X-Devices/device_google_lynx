#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := lynx
TARGET_KERNEL_PATH := device/google/lynx-kernels
TARGET_KERNEL_DIR := $(TARGET_KERNEL_PATH)/6.1
TARGET_BOARD_KERNEL_HEADERS := $(TARGET_KERNEL_DIR)/kernel-headers
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4

LOCAL_PATH := device/google/lynx

# Inherit from gs201
include device/google/gs201/common.mk

# Always use scudo for memory allocator
PRODUCT_USE_SCUDO := true

# Camera
$(call inherit-product-if-exists, vendor/google/camera/config.mk)

# Face unlock
$(call inherit-product-if-exists, vendor/google/faceunlock/config.mk)

# PixelParts
include packages/apps/PixelParts/device.mk

# Pixel APN list
$(call inherit-product, vendor/google/CarrierSettings/telephony.mk)

# ViPER4Android FX
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# Overlays
PRODUCT_PACKAGES += \
    DMServiceOverlayProductGs201 \
    DMServiceOverlayVendorLynx \
    FrameworkResOverlayProductLynx \
    FrameworkResOverlayVendorLynx \
    HbmSVManagerOverlayProductLynx \
    PixelNfcOverlayLynx \
    PixelWifiOverlay2023_T6proGs201 \
    PixelWifiOverlay2023_midyearLynx \
    SafetyRegulatoryInfoOverlayProductLynx \
    SettingsGoogleLynxOverlay \
    SettingsOverlayG0DZQ \
    SettingsOverlayG82U8 \
    SettingsOverlayGHL1X \
    SettingsOverlayGWKK3 \
    SystemUIGoogleOverlayVendorLynx

PRODUCT_PACKAGES += \
    ApertureOverlayLynx

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.lynx.rc

PRODUCT_PACKAGES += \
    init.recovery.lynx.touch.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/qcom/wlan \
    hardware/qcom/wlan/wcn6740

# Wi-Fi
PRODUCT_PACKAGES += \
    libwifi-hal-ctrl:64

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml

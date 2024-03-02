#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Infinity-X stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Infinity-X Flags
WITH_GMS := true
INFINITY_BUILD_TYPE := OFFICIAL
INFINITY_MAINTAINER := Pyrtle93
WITH_INFINITY_CHARGER := true
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_IS_PIXEL := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_BUILD_GOOGLE_TELEPHONY := true

# Inherit device configuration
$(call inherit-product, device/google/lynx/aosp_lynx.mk)
$(call inherit-product, device/google/gs201/infinity_common.mk)
$(call inherit-product, device/google/lynx/device-infinity.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7a
PRODUCT_NAME := infinity_lynx

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=lynx \
    PRIVATE_BUILD_DESC="lynx-user 14 AP2A.240705.004 11875680 release-keys"

BUILD_FINGERPRINT := google/lynx/lynx:14/AP2A.240705.004/11875680:user/release-keys

$(call inherit-product, vendor/google/lynx/lynx-vendor.mk)

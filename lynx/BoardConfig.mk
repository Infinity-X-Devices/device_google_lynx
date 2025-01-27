#
# Copyright (C) 2021 The Android Open-Source Project
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

TARGET_BOARD_INFO_FILE := device/google/lynx/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := lynx

RELEASE_GOOGLE_PRODUCT_RADIO_DIR := $(RELEASE_GOOGLE_LYNX_RADIO_DIR)
ifneq (,$(filter AP1%,$(RELEASE_PLATFORM_VERSION)))
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/24Q1
else ifneq (,$(filter AP2% AP3%,$(RELEASE_PLATFORM_VERSION)))
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/24Q2
else
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/trunk
endif

ifdef PHONE_CAR_BOARD_PRODUCT
        include vendor/auto/embedded/products/$(PHONE_CAR_BOARD_PRODUCT)/BoardConfig.mk
else
        TARGET_SCREEN_DENSITY := 420
endif

BOARD_USES_GENERIC_AUDIO := true
USES_DEVICE_GOOGLE_LYNX := true

# Enable load module in parallel
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

# The modules which need to be loaded in sequential
BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1

include device/google/gs201/BoardConfig-common.mk
-include vendor/google_devices/gs201/prebuilts/BoardConfigVendor.mk
-include vendor/google_devices/lynx/proprietary/BoardConfigVendor.mk
include device/google/lynx/sepolicy/lynx-sepolicy.mk
include device/google/gs201/wifi/qcom/BoardConfig-wifi.mk

include device/google/lynx/lynx/BoardConfigInfinity.mk

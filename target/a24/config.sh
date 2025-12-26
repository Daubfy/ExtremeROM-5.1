#
# Copyright (C) 2025 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Device configuration file for Galaxy A24 (a24)

# Target device firmware information
TARGET_NAME="Galaxy A24"
TARGET_CODENAME="a24"
TARGET_FIRMWARE="SM-A245F/THL/357181563031126"
TARGET_EXTRA_FIRMWARE=()
TARGET_API_LEVEL=33
TARGET_PRODUCT_FIRST_API_LEVEL=31
TARGET_VNDK_VERSION=31
TARGET_OS_BOOT_DEVICE_PATH="/dev/block/by-name"

# Partitions
TARGET_BOOT_PARTITION_SIZE="67108864"
TARGET_DTBO_PARTITION_SIZE="8388608"
TARGET_VENDOR_BOOT_PARTITION_SIZE="67108864"

# Dynamic partitions
TARGET_SUPER_PARTITION_SIZE="11744051200"
TARGET_SUPER_GROUP_NAME="main"
TARGET_SUPER_GROUP_SIZE="11739856896"

# OS
TARGET_SINGLE_SYSTEM_IMAGE="mssi"
TARGET_HAS_SYSTEM_EXT=true
TARGET_OS_FILE_SYSTEM="erofs"

# Target device SPF configuration
TARGET_MULTI_MIC_MANAGER_VERSION="07010"
TARGET_AUDIO_SUPPORT_ACH_RINGTONE=false
TARGET_AUDIO_SUPPORT_DUAL_SPEAKER=false
TARGET_AUDIO_SUPPORT_VIRTUAL_VIBRATION=false
TARGET_CAMERA_SUPPORT_CAMERAX_EXTENSION=false
TARGET_SUPPORT_CUTOUT_PROTECTION=false
TARGET_HAS_MASS_CAMERA_APP=true
TARGET_HAS_HW_MDNIE=false
TARGET_MDNIE_SUPPORTED_MODES="37905"
TARGET_COMMON_SUPPORT_EMBEDDED_SIM=false
TARGET_COMMON_SUPPORT_HDR_EFFECT=false
TARGET_DVFS_CONFIG_NAME="dvfs_policy_mt6789_xx"
TARGET_SSRM_CONFIG_NAME="siop_a24_mt6789v"
TARGET_FP_SENSOR_CONFIG="google_touch_side,settings=3,navi=1"
TARGET_MDNIE_WEAKNESS_SOLUTION_FUNCTION="0"
TARGET_AUTO_BRIGHTNESS_TYPE="5"
TARGET_HFR_DEFAULT_REFRESH_RATE="90"
TARGET_HFR_MODE="0"
TARGET_HFR_SUPPORTED_REFRESH_RATE="60,90"
TARGET_LCD_SUPPORT_MDNIE_HW=false
TARGET_ESE_CHIP_VENDOR="NXP"
TARGET_ESE_COS_NAME="JCOP6.3U"
TARGET_IS_ESIM_SUPPORTED=false

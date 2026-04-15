#
#	This file is part of the OrangeFox Recovery Project
#	Copyright (C) 2021-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
#	Please maintain this if you use this script or any part of it
#

# OrangeFox-specific settings
OF_USE_GREEN_LED := 0
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

OF_ENABLE_LPTOOLS := 1
OF_QUICK_BACKUP_LIST := /boot;/data;

# avb 2.0
OF_PATCH_AVB20 := 1

# OTA
OF_DISABLE_MIUI_OTA_BY_DEFAULT := 1

# try to prevent potential data format errors
OF_UNBIND_SDCARD_F2FS := 1

# maximum permissible splash image size (in kilobytes); do *NOT* increase!
OF_SPLASH_MAX_SIZE := 130

# screen settings
OF_SCREEN_H := 2400
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1

# number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9

# FRP
OF_ENABLE_FRP_ADDON := 1

# Disable additional checks for MIUI ROMs
OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1

# Force casefolding
OF_FORCE_CASEFOLDING := 1

# Force the selection of f2fs when formatting data
OF_FORCE_DATA_FORMAT_F2FS := 1

# Maintainer
OF_MAINTAINER := ryxpace

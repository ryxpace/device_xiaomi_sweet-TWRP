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
FDEVICE="sweet"

fox_get_target_device() {
    if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
        FOX_BUILD_DEVICE="$FDEVICE";
    elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
        FOX_BUILD_DEVICE="$FDEVICE";
    elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
        FOX_BUILD_DEVICE="$FDEVICE";
    elif echo "$0" | grep -q "$FDEVICE"; then
        FOX_BUILD_DEVICE="$FDEVICE";
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
    echo "** WARNING **: Always set FOX_BUILD_DEVICE to the device codename before starting to build for any device!"
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"
    export ALLOW_MISSING_DEPENDENCIES=true
    export TARGET_DEVICE_ALT="sweetin"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_DELETE_AROMAFM=1
    export FOX_REMOVE_AAPT=1
    export FOX_USE_DATE_BINARY=1
    export FOX_VANILLA_BUILD=1

    export FOX_SETTINGS_ROOT_DIRECTORY=/data/recovery
    export FOX_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard
    export FOX_ALLOW_EARLY_SETTINGS_LOAD=1

    # FOX Version & Variant Settings
    export FOX_VARIANT=crDroid
    export FOX_MAINTAINER_PATCH_VERSION=2

    # let's see what are our build VARs
    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep "FOX" >>$FOX_BUILD_LOG_FILE
        export | grep "OF_" >>$FOX_BUILD_LOG_FILE
        export | grep "TARGET_" >>$FOX_BUILD_LOG_FILE
        export | grep "TW_" >>$FOX_BUILD_LOG_FILE
    fi
else
    if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
    fi
fi
#

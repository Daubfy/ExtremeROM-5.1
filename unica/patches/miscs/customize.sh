MODEL=$(echo -n "$TARGET_FIRMWARE" | cut -d "/" -f 1)
REGION=$(echo -n "$TARGET_FIRMWARE" | cut -d "/" -f 2)

# Set build ID
ROM_STATUS=""
$ROM_IS_OFFICIAL || ROM_STATUS=" UNOFFICIAL"
VALUE="$(GET_PROP "$WORK_DIR/system/system/build.prop" "ro.build.display.id")"
SET_PROP "system" "ro.build.display.id" "ExtremeROM$ROM_STATUS $ROM_CODENAME $ROM_VERSION - $TARGET_CODENAME ($VALUE)"

SET_PROP "system" "ro.extremerom.official" "$ROM_IS_OFFICIAL"
SET_PROP "system" "ro.extremerom.version" "$ROM_VERSION"
SET_PROP "system" "ro.extremerom.codename" "$ROM_CODENAME"

# Disable FRP
SET_PROP "vendor" "ro.frp.pst" ""
SET_PROP "product" "ro.frp.pst" ""

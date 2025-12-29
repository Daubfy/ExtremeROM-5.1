READ_AND_APPLY_CONFIGS()
{
    local CONFIG_FILE="$SRC_DIR/target/$TARGET_CODENAME/sff.sh"

    if [ -f "$CONFIG_FILE" ]; then
        while read -r i; do
            [[ "$i" = "#"* ]] && continue
            [[ -z "$i" ]] && continue

            if echo -n "$i" | grep -q "="; then
                if [[ -z "$(echo -n "$i" | cut -d "=" -f 2)" ]]; then
                    SET_FLOATING_FEATURE_CONFIG "$(echo -n "$i" | cut -d "=" -f 1)" --delete
                else
                    SET_FLOATING_FEATURE_CONFIG "$(echo -n "$i" | cut -d "=" -f 1)" "$(echo -n "$i" | cut -d "=" -f 2-)"
                fi
            else
                echo "Malformed string in target/$TARGET_CODENAME/sff.sh: \"$i\""
                return 1
            fi
        done < "$CONFIG_FILE"
    fi
}

# Apply target floating feature
READ_AND_APPLY_CONFIGS

# Smart Tutor
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_COMMON_CONFIG_SMARTTUTOR_PACKAGES_PATH" --delete

# Logging
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_CONTEXTSERVICE_ENABLE_SURVEY_MODE" --delete

# BlockchainTZService
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_BLOCKCHAIN_SERVICE" --delete

# High End Features
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_LAUNCHER_CONFIG_ANIMATION_TYPE" "HighEnd"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_SYSTEM_SUPPORT_ENHANCED_PROCESSING" "TRUE"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_CONFIG_AOD_ITEM" "aodversion=7,clocktransition"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_SCREEN_CAPTURE_ADVANCED_EDIT_VI" "TRUE"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_SCREEN_RECORDER" "TRUE"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_CONFIG_SCREEN_RECORDER_ITEM" "-pip"


LOG_STEP_IN "- Removing OK Google Blobs"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx4CORTEXM55"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx4CORTEXM55"
LOG_STEP_OUT

LOG_STEP_IN "- Fix Photo Remaster"
# Fix Photo Remaster
EVAL "echo \"ro.midas.device u:object_r:build_prop:s0 exact string\"  >> \"$WORK_DIR/system/system/etc/selinux/plat_property_contexts\""
SET_PROP "system" "ro.midas.device" "a24"
HEX_PATCH "$WORK_DIR/system/system/lib64/libmidas_core.camera.samsung.so" \
    "726f2e70726f647563742e646576696365" "726f2e6d696461732e6465766963650000"
LOG_STEP_OUT

ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/libImageTagger.camera.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"

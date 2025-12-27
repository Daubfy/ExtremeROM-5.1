cp -fa "$SRC_DIR/target/a24/patches/kernel/img/boot.img" "$WORK_DIR/kernel/boot.img"
cp -fa "$SRC_DIR/target/a24/patches/kernel/img/vendor_boot.img" "$WORK_DIR/kernel/vendor_boot.img"
rm -rf "$WORK_DIR/vendor_dlkm"

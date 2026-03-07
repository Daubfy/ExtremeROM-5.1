{
    echo "(type sim, device, chr_file, (write getattr));"
    echo "(type sim, init, sock_file, (write getattr));"
} >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"

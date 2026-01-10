#!/system/bin/sh
#
# Helio G99 SIM Fix - Vendor-level daemon
# @Neel0210

# Use kernel log to avoid SELinux file denial
LOG="/dev/kmsg"

log() {
    echo "SIMFIX: $1" > $LOG
}

log "Service started, waiting for modem stability"

# Extra delay for MTK modem firmware readiness
sleep 180

# Initial RIL reset after modem is stable
log "Initial RIL reset"
stop vendor.ril-daemon
sleep 2
start vendor.ril-daemon
sleep 15
log "Initial RIL reset completed"

# ----------------------------
# Periodic monitoring loop
# ----------------------------
while true; do
    sleep 10800  # 3 hours

    SIM_STATE="$(getprop vendor.gsm.sim.state)"
    NET_TYPE="$(getprop vendor.gsm.network.type)"
    RADIO_STATE="$(getprop vendor.ril.radio.state)"
    OPERATOR="$(getprop vendor.gsm.operator.alpha)"

    log "Check: SIM=$SIM_STATE NET=$NET_TYPE RADIO=$RADIO_STATE OP=$OPERATOR"

    # Case 1: SIM lost by modem
    if echo "$SIM_STATE" | grep -q "ABSENT"; then
        log "SIM ABSENT detected → restarting RIL"
        stop vendor.ril-daemon
        sleep 2
        start vendor.ril-daemon
        sleep 15
        continue
    fi

    # Case 2: Radio stack dead but SIM still present
    if [ "$RADIO_STATE" = "OFF" ] || [ -z "$NET_TYPE" ] || [ "$NET_TYPE" = "Unknown" ]; then
        log "Radio/network failure detected → restarting RIL"
        stop vendor.ril-daemon
        sleep 2
        start vendor.ril-daemon
        sleep 15
    fi
done

#kKRT - Now can debug using $dmesg | grep SIMFIX

#!/system/bin/sh

log() {
    local LOG="/dev/kmsg"

    echo "SIMFIX: $1" > $LOG
}

log "Service started, waiting for modem stability"
sleep 180s

log "Initial RIL reset"
stop vendor.ril-daemon
sleep 2
start vendor.ril-daemon
sleep 15

while true; do
    sleep 3h

    SIM_STATE="$(getprop vendor.gsm.sim.state)"
    NET_TYPE="$(getprop vendor.gsm.network.type)"
    RADIO_STATE="$(getprop vendor.ril.radio.state)"
    OPERATOR="$(getprop vendor.gsm.operator.alpha)"

    log "SIM=$SIM_STATE NET=$NET_TYPE RADIO=$RADIO_STATE OP=$OPERATOR"

    if echo "$SIM_STATE" | grep -q "ABSENT"; then
        log "SIM ABSENT detected, restarting RIL"
        stop vendor.ril-daemon
        sleep 2
        start vendor.ril-daemon
        sleep 15
        continue
    fi

    if [[ "$RADIO_STATE" = "OFF" ]] || [[ -z "$NET_TYPE" ]] || [[ "$NET_TYPE" = "Unknown" ]]; then
        log "Radio/network failure, restarting RIL"
        stop vendor.ril-daemon
        sleep 2
        start vendor.ril-daemon
        sleep 15
    fi
done

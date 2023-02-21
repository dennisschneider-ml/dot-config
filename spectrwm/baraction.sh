#!/bin/sh


wifi() {
    WIFI=$(iwgetid --raw)
    echo "$WIFI"
}

mem() {
    MEM=$(free -h | awk '/Mem:/{print $3}')
    echo "󰍛 $MEM"
}

battery() {
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "  $BAT%"
}

cpu_temp() {
    TEMP=$(sensors | awk '/CPU/{print substr($2,2)}')
    echo " $TEMP"
}

sound_device() {
    SOUND=$(pactl list | grep -m 1 device.alias)
    if [[ $SOUND ]]; then
        SOUND_ICON='󰋎'
    fi
    echo "$SOUND_ICON"
}

minimized() {
    num_minimized=$(min-list | sed '/^$/D' | wc -l)
    if [[ $num_minimized != 0 ]]; then
        echo "󰻀 $num_minimized"
    fi
}

while :; do
    echo "$(sound_device)   $(minimized)   $(wifi)   $(battery)   $(cpu_temp)   $(mem) |"
    sleep 1
done

#!/bin/sh


wifi() {
    WIFI=$(iwgetid --raw)
    echo "$WIFI"
}

mail() {
    NEW_MAIL=$(claws-mail --status | head -1 | awk '{print $1}')
    echo "Mail: $NEW_MAIL"
}

mem() {
    MEM=$(free -h | awk '/Mem:/{print $3}')
    echo "Mem: $MEM"
}

battery() {
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "Bat: $BAT%"
}

cpu_temp() {
    TEMP=$(sensors | awk '/CPU/{print substr($2,2)}')
    echo "CPU: $TEMP"
}

sound_device() {
    SOUND=$(pactl list | grep -m 1 device.alias)
    if [[ $SOUND ]]; then
        SOUND_ICON=''
    fi
    echo "$SOUND_ICON"
}

minimized() {
    current_workspace=$(xdotool get_desktop)
    num_minimized=$(awk -v wks=$current_workspace -F ';' '$3~wks{print $1}' $PYNNACLE_DATA/minimized_programs.txt | wc -l)
    if [[ $num_minimized != 0 ]]; then
        echo "~$num_minimized"
    fi
}

while :; do
    echo "$(sound_device)        $(wifi) | $(battery) | $(cpu_temp) | $(mem) |"
    sleep 1
done

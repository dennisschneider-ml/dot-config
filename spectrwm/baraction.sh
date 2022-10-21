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

color() {
    color_id=$1
    text=${@:2}
    echo "+@fg=$(($color_id)) $text +@fg=0;"
}

#nord4
#nord1
#nord11
#nord14
#nord9
while :; do
    echo "$(wifi) | $(battery) | $(cpu_temp) | $(mem) |"
    sleep 1
done

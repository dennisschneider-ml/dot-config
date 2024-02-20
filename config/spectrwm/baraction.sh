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
    TEMP=$(cat /sys/class/thermal/thermal_zone8/temp | head -c2)
    echo " $TEMP°C"
}

sound_device() {
    SOUND=$(pactl list | grep -m 1 device.alias)
    if [[ $SOUND ]]; then
        SOUND_ICON='󰋎'
    fi
    echo "$SOUND_ICON"
}

crypto() {
    # Execute every $1 minutes.
    minute_interval=$1
    curr_time=$(date +'%T')
    if (( $(echo "$curr_time" | cut -d':' -f2) % $minute_interval == 0 )) &&\
        (( $(echo "$curr_time" | cut -d':' -f3) == 0 )); then
        BTC="$(_crypto_val BTC  EUR €)"
        ETH="$(_crypto_val ETH 󰡪 EUR €)"
    fi
    echo "$BTC;$ETH"
}

_crypto_val() {
    currency=$1
    symbol=$2
    reference_currency=$3
    reference_symbol=$4
    value=$(curl -s "https://api.coinbase.com/v2/prices/$currency-$reference_currency/buy" | jq --raw-output '.data.amount' | sed "s/^/$symbol /; s/$/$reference_symbol/")
    echo "$value"
}

delim="   "
BTC="$(_crypto_val BTC  EUR €)"
ETH="$(_crypto_val ETH 󰡪 EUR €)"

while :; do
    crypto_values=$(crypto 5)
    BTC=$(echo "$crypto_values" | cut -d';' -f1)
    ETH=$(echo "$crypto_values" | cut -d';' -f2)
    echo "  $(sound_device);$BTC;$ETH;$(wifi);$(battery);$(cpu_temp);$(mem) |" |\
        sed "s/;/$delim/g"
    sleep 5
done

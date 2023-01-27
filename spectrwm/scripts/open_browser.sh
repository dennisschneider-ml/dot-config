#!/bin/sh

file="$XDG_CONFIG_HOME/qutebrowser/bookmarks/urls"
choice=$(cut -d' ' -f 2- $file | rofi -dmenu -i)

if grep -qm1 "$choice" $file; then
    url_choice=$(grep -m1 "$choice" $file | cut -d' ' -f 1)
    $BROWSER $url_choice
else
    $BROWSER "$choice"
fi


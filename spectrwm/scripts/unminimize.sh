#!/bin/sh

current_workspace=$(xdotool get_desktop)
chosen=$(awk -v wks=$current_workspace -F ';' '$3~wks{print $1}' $PYNNACLE_DATA/minimized_programs.txt | rofi -dmenu -i)
chosen_id=$(grep $chosen $PYNNACLE_DATA/minimized_programs.txt | head -1 | cut -d';' -f2)
xdotool windowmap "$chosen_id"
sed -i "/$chosen_id/d" $PYNNACLE_DATA/minimized_programs.txt


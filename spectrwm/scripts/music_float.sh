#!/bin/sh

# start a certain program in the background
alacritty -e ncmpcpp &
pwd=$!

# wait for it to start
while ! [[ $(wmctrl -l -p | rg $pwd) ]]
do
    sleep 0.1
done

# get window-id by process-id
window_id=$(wmctrl -l -p | awk '/'$pwd'/{print $1}')
# set as floating window
wmctrl -b toggle,above -i -r $window_id


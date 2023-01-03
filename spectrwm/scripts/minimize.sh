#!/bin/sh

function minimize_window() {
    window_id=$1
    xdotool windowunmap $window_id
}

function log_window() {
    window_id=$1
    window_name=$(xdotool getwindowname $window_id)
    workspace_id=$(xdotool get_desktop)
    
    echo "$window_name;$window_id;$workspace_id;" >> $PYNNACLE_DATA/minimized_programs.txt
}

active_window_id=$(xdotool getactivewindow)
minimize_window $active_window_id
log_window $active_window_id


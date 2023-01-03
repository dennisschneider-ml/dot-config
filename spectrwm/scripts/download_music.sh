#!/usr/bin/env bash

function is_browser_window() {
    local window_id=$1
    local browser_identifier=$2

    local browser_ids=$(xdotool search --class $browser_identifier)
    return "(echo $browser_ids | grep -w -q $window_id)"
}

# Get the window ID of the active Chrome window
active_window_id=$(xdotool getactivewindow)
is_browser_window $active_window_id 'Brave-browser' 
dunstify "$(echo $?)"

if [ $(is_browser_window $active_window_id 'Brave-browser') ]; then
    dunstify "heeeeee"
    old_cache=$(xclip -o)
    xdotool key --clearmodifiers --window $active_window_id 'ctrl+l+c'
    url=$(xclip -o)
    if [ $url == *'youtube.'* ]; then
        dunstify $url
        echo $old_cache | xclip -o -selection primary
        info=$(zenity --forms --title "File information" --add-entry "Artist:" --add-entry "Album:")
        artist=$(echo $info | cut -d'|' -f1 | tr ' ' '-')
        album=$(echo $info | cut -d'|' -f2 | tr ' ' '-')

        mkdir -p "Music/$artist/$album"
        dunstify "Downloading to Music/$artist/$album..."
        youtube-dl -x --audio-format opus --audio-quality 0 --prefer-ffmpeg --no-playlist -o "Music/$artist/$album/%(title)s.%(ext)s" $url
        dunstify "Finished downloading music."
    fi
fi


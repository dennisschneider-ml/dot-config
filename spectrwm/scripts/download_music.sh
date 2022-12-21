#!/usr/bin/env bash

function is_browser_window() {
    window_id=$1
    browser_identifier=$2

    browser_ids=$(xdotool search --class $browser_identifier)
    return $(echo $browser_ids | grep -q $window_id)
}

# Get the window ID of the active Chrome window
active_window_id=$(xdotool getactivewindow)

if [ is_browser_window $active_window_id 'Brave-browser' ] \
    && [ $url == *'www.youtube.'* ]; then
    old_cache=$(xclip -o)
    xdotool key --clearmodifiers --window $active_window_id 'ctrl+l+c'
    url=$(xclip -o)
    echo $old_cache | xclip -o -selection primary
    info=$(zenity --forms --title "File information" --add-entry "Artist:" --add-entry "Album:")
    artist=$(echo $info | cut -d'|' -f1 | tr ' ' '-')
    album=$(echo $info | cut -d'|' -f2 | tr ' ' '-')

    mkdir -p "Music/$artist/$album"
    dunstify "Downloading to Music/$artist/$album..."
    youtube-dl -x --audio-format opus --audio-quality 0 --prefer-ffmpeg --no-playlist -o "Music/$artist/$album/%(title)s.%(ext)s" $url
    dunstify "Finished downloading music."
fi


#!/bin/sh

function is_browser_window() {
    local window_id=$1
    local browser_name=$2

    local browser_ids=$(xdotool search --class $browser_name)
    return $(echo $browser_ids | grep -qm1 $window_id)
}

# Get the window ID of the active Browser window
active_window_id=$(xdotool getactivewindow)

if is_browser_window $active_window_id 'Brave-browser'; then
    old_cache=$(xclip -o)
    xdotool key --clearmodifiers --window $active_window_id 'ctrl+l+c'
    url=$(xclip -o)
    if [[ $url == *'youtube.'* ]]; then
        echo $old_cache | xclip -o -selection clipboard
        info=$(zenity --forms --title "File information" --add-entry "Artist:" --add-entry "Album:")
        is_cancelled=$?
        if [[ $is_cancelled -eq 0 ]]; then
            artist=$(echo $info | cut -d'|' -f1 | tr ' ' '-')
            album=$(echo $info | cut -d'|' -f2 | tr ' ' '-')

            mkdir -p "Music/$artist/$album"
            dunstify "Downloading to Music/$artist/$album..."
            youtube-dl -x --audio-format opus --audio-quality 0 --prefer-ffmpeg --no-playlist -o "Music/$artist/$album/%(title)s.%(ext)s" $url
            dunstify "Finished downloading music."
        fi
    fi
fi


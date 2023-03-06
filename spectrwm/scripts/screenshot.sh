#!/bin/sh

if [ "$1" == "full" ]; then
    import -window root ~/Pictures/screenshots/$(date -Iseconds).png
else 
    if [ "$1" == "window" ]; then
        import -window "$(xdotool getwindowfocus)" ~/Pictures/screenshots/"$(date -Iseconds).png"
    fi
fi

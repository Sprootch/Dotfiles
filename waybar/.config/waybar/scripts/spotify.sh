#!/bin/bash

status=$(playerctl -p spotify status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    
    # Limiter la longueur
    if [ ${#artist} -gt 20 ]; then
        artist="${artist:0:20}..."
    fi
    if [ ${#title} -gt 30 ]; then
        title="${title:0:30}..."
    fi
    
    if [ "$status" = "Playing" ]; then
        echo "{\"text\":\"$artist - $title\", \"class\":\"playing\", \"tooltip\":\" $artist - $title\"}"
    else
        echo "{\"text\":\"$artist - $title\", \"class\":\"paused\", \"tooltip\":\" $artist - $title\"}"
    fi
else
    echo ""
fi

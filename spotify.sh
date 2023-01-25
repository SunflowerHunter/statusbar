#!/bin/sh

status=$(playerctl -p spotify status)
artist=$(playerctl -p spotify metadata artist)
album=$(playerctl -p spotify metadata album)
title=$(playerctl -p spotify metadata title)
length=$(playerctl -p spotify metadata mpris:length | sed 's/.\{6\}$//')
if [[ "$status" == "Playing" ]] ; then status="▶" ; else status="◼" ; fi

echo " $status $artist - $title" | sed 's/\(.\{32\}\).*/\1.../'



#!/bin/sh

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e pulsemixer ;;
	2) pamixer -t ;;
	4) pamixer -i 3 ;;
	5) pamixer -d 3 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

vol="$(pamixer --get-volume)"
[ $? -ne 0 ] && [ -z "$vol" ] && exit 1

if [ "$vol" -gt 40 ]; then
	icon=" "
elif [ "$vol" -gt 15 ]; then
	icon=" "
else
	icon=" "
fi

echo "$icon$vol%"

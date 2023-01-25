#!/bin/sh

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

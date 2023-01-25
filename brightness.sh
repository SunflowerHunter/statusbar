#!/bin/sh
cur=`cat /sys/class/backlight/intel_backlight/brightness`
max=`cat /sys/class/backlight/intel_backlight/max_brightness`

let a=$cur*100 b=$max val=a/b 

# echo "$val%"

if [ "$val" -gt 90 ]; then
  status=" "
elif [ "$val" -gt 60 ]; then
	status=" "
elif [ "$val" -gt 40 ]; then
	status=" "
elif [ "$val" -gt 20 ]; then
	status=" "
else
	status=" "
fi

echo "$status$val"


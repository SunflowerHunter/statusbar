#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "

	capacity="$(cat "$battery/capacity" 2>&1)"
	if [ "$capacity" -gt 90 ]; then
		status=" "
	elif [ "$capacity" -gt 60 ]; then
		status=" "
	elif [ "$capacity" -gt 40 ]; then
		status=" "
	elif [ "$capacity" -gt 10 ]; then
		status=" "
	else
		status=" "
	fi

	# Sets up the status and capacity
	case "$(cat "$battery/status" 2>&1)" in
		Full) status=" " ;;
		Discharging)
			if [ "$capacity" -le 20 ]; then
				status=" $status"
				color=1
			fi
			;;
		Charging) status="ﮣ $status" ;;
		"Not charging") status="屢 $status" ;;
		Unknown) status=" $status" ;;
		*) exit 1 ;;
	esac
  echo "$status $capacity"
	# Prints the info
	# display -n "$status $capacity%" $color
done

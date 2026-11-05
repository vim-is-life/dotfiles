#!/usr/bin/env sh

# Kill already running Polybar instances
killall -q polybar

# Wait for successful shutdown
while pgrep -x polybar >/dev/null; do
	sleep 1
done

# Select primary monitor, falling back to first connected monitor
MONITOR=$(xrandr --query | awk '/ connected primary / {print $1; exit}')
[ -n "$MONITOR" ] || MONITOR=$(xrandr --query | awk '/ connected / {print $1; exit}')

# Select the network module based on the default route
if ip route show default | grep -q ' dev .*wl'; then
	NET_MODULE=wlan
else
	NET_MODULE=eth
fi

# Select modules based on battery availability
if [ -d /sys/class/power_supply/BAT0 ]; then
	POLYBAR_MODULES="filesystem pulseaudio memory cpu $NET_MODULE battery date"
else
	POLYBAR_MODULES="filesystem pulseaudio memory cpu $NET_MODULE date"
fi

export MONITOR POLYBAR_MODULES

# Launch Polybar
polybar bar-in-use &

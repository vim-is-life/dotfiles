#!/usr/bin/env sh

# Kill already running polybar instances
killall -q polybar

# Wait for succcessful shutdown
while pgrep -x polybar >/dev/null; do
	sleep 1
done

# Launch
polybar &

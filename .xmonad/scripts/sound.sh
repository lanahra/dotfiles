#!/bin/bash -e

sink=$(pactl list short sinks | awk '{print $1}')
sound=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

if pactl list sinks | grep -q "Mute: yes"; then
    level="mute"
elif ((sound <= 25)); then
    level="none"
elif ((sound <= 50)); then
    level="low"
elif ((sound <= 75)); then
    level="medium"
else
    level="high"
fi

echo '<icon=sound/'$level.xpm'/> '$sound'%'

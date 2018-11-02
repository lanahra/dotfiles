#!/bin/bash -e

if pactl list sources | grep -q 'Mute: yes' ; then
    state='off'
else
    state='on'
fi

echo '<icon=mic/'$state.xpm'/>'

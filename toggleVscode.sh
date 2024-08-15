#!/bin/bash

WINDOW_ID=$(wmctrl -lx | grep code.Code | awk '{print $1}')
ACTIVE_WINDOW_ID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | awk '{print $5}')

WINDOW_ID_DEC=$(printf "%d\n" $WINDOW_ID)
ACTIVE_WINDOW_DEC=$(printf "%d\n" $ACTIVE_WINDOW_ID)

if [ -n "$WINDOW_ID" ]; then
    if [ "$WINDOW_ID_DEC" == "$ACTIVE_WINDOW_DEC" ]; then
        # Minimize the current window
        xdotool windowminimize $WINDOW_ID
    else
        # Bring the window to the foreground and maximize it
        wmctrl -ir $WINDOW_ID -b remove,hidden
        wmctrl -ia $WINDOW_ID
        wmctrl -ir $WINDOW_ID -b add,maximized_vert,maximized_horz
    fi
else
    # Launch VSCode and wait for it to open
    code &
    sleep 2  # Adjust sleep duration as needed to ensure VSCode window is ready
    WINDOW_ID=$(wmctrl -lx | grep code.Code | awk '{print $1}')
    wmctrl -ir $WINDOW_ID -b add,maximized_vert,maximized_horz
fi

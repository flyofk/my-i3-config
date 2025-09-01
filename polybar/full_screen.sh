#!/bin/bash

# Проверяем, есть ли активное полноэкранное окно
is_fullscreen() {
    xprop -root _NET_ACTIVE_WINDOW | xprop -id "$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')" | grep -q '_NET_WM_STATE_FULLSCREEN'
}

while true; do
    if is_fullscreen; then
        polybar-msg cmd hide
    else
        polybar-msg cmd show
    fi
    sleep 0.5
done

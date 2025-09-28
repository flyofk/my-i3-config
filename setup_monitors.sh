#!/bin/bash



    until xrandr >/dev/null 2>&1; do sleep 0.2; done
    
    # Ждем появления всех мониторов
    sleep 0.5 


    # Имена мониторов (замените на ваши)
    MAIN_MONITOR="HDMI-0"    # 165Hz монитор
    SECOND_MONITOR="DP-0" # 60Hz монитор
    
    # Проверяем подключены ли мониторы
    if xrandr --query | grep -q "$MAIN_MONITOR connected"; then
        # Настраиваем основной монитор 165Hz
        xrandr --output $MAIN_MONITOR --mode 1920x1080 --rate 165 --primary --pos 0x0
    fi
    
    if xrandr --query | grep -q "$SECOND_MONITOR connected"; then
        # Настраиваем второй монитор 60Hz справа от основного
        xrandr --output $SECOND_MONITOR --mode 1920x1080 --rate 60 --right-of $MAIN_MONITOR --pos 1920x0
    fi
    
    
    # Устанавливаем обои на все мониторы
    feh --bg-fill ~/Images/black-background.png --no-xinerama

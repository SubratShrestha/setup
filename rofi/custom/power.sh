#! /bin/sh

selected=$(echo -e "Shut down\nRestart\nLock" | rofi -dmenu -i -theme-str '@import "config.rasi"')
echo "selection : $selected"

if [ "$selected" = "Shut down" ]; then
  shutdown now
elif [ "$selected" = "Restart" ]; then
  reboot
elif [ "$selected" = "Lock" ]; then
  pkill awesome
else exit 0
fi

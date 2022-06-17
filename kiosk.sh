#!/bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --kiosk fiele://cotu-pinball.jpg https://insider.sternpinball.com/kiosk/ags-usWmN-xkOX

# cotu leaderboard - https://insider.sternpinball.com/kiosk/aTxvx-KwtN-zqNph

while true; do
      xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
      sleep 30
      xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
      sleep 60
done

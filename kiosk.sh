#!/bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

pages="https://insider.sternpinball.com/kiosk/ktim-MiwwU-MiM file:///home/dan/cotu-kiosk/kiosk1.png https://bit.ly/cotupinball"

/usr/bin/chromium-browser --kiosk --enable-kiosk-mode --noerrdialogs --disable-infobars --disable-ipv6 --allow-file-access-from-files --disable-java --disable-restore-session-state --disable-sync --disable-translate --disk-cache-size=1 --media-cache-size=1 ${pages} &
# /usr/bin/chromium-browser --kiosk --enable-kiosk-mode --noerrdialogs --disable-infobars --disable-ipv6 --allow-file-access-from-files --disable-java --disable-restore-session-state --disable-sync --disable-translate --disk-cache-size=1 --media-cache-size=1 file:///home/jeffpm/cotu-kiosk/cotu-pinball.jpg https://insider.sternpinball.com/kiosk/aTxvx-KwtN-zqNph file:///home/jeffpm/cotu-kiosk/mando.jpg &

while true; do
      xdotool search --class chromium windowactivate
      xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
      sleep 15
done

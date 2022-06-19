#!/bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --kiosk --enable-kiosk-mode --noerrdialogs --disable-infobars --disable-ipv6 --allow-file-access-from-files --disable-java --disable-restore-session-state --disable-sync --disable-translate --disk-cache-size=1 --media-cache-size=1 https://insider.sternpinball.com/kiosk/aTxvx-KwtN-zqNph &
# /usr/bin/chromium-browser --kiosk --enable-kiosk-mode --noerrdialogs --disable-infobars --disable-ipv6 --allow-file-access-from-files --disable-java --disable-restore-session-state --disable-sync --disable-translate --disk-cache-size=1 --media-cache-size=1 file:///home/jeffpm/cotu-kiosk/cotu-pinball.jpg https://insider.sternpinball.com/kiosk/aTxvx-KwtN-zqNph file:///home/jeffpm/cotu-kiosk/mando.jpg &

while true; do
      xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
      sleep 30
done

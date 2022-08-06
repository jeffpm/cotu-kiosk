#!/bin/bash
set -e

sudo apt clean
sudo apt autoremove -y

sudo apt update -y
sudo apt upgrade -y

sudo apt install xdotool unclutter sed -y

cd ~
git clone https://github.com/jeffpm/cotu-kiosk.git

cd cotu-kiosk
sudo cp ./kiosk.service /lib/systemd/system/kiosk.service

sudo systemctl enable kiosk.service

sudo apt-get install incron

sudo echo "dan" > /etc/incron.allow

incrontab -l | { cat; echo "/home/dan/cotu-kiosk/ IN_MODIFY sudo systemctl restart kiosk"; } | crontab -

incrontab -l | { cat; echo "*/5 * * * * cd /home/dan/cotu-kiosk && git reset --hard HEAD && git pull"; } | crontab -

sudo systemctl start kiosk.service

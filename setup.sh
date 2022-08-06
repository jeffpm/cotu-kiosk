#!/bin/bash
set -e

sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt clean
sudo apt autoremove -y

sudo apt update
sudo apt upgrade

sudo apt install xdotool unclutter sed

cd ~
git clone https://github.com/jeffpm/cotu-kiosk.git

cd cotu-kiosk
sudo cp ./kiosk.service /lib/systemd/system/kiosk.service

sudo systemctl enable kiosk.service

sudo systemctl start kiosk.service

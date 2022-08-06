#!/bin/bash
set -e

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

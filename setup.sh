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

sudo systemctl start kiosk.service

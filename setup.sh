#!/bin/bash
set -e

sudo apt clean
sudo apt autoremove -y

sudo apt update -y
sudo apt upgrade -y

sudo apt install xdotool unclutter sed -y

#removing unnecessary packages:
#sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
#sudo apt purge smartsim java-common minecraft-pi libreoffice* -y

cd ~
git clone https://github.com/jeffpm/cotu-kiosk.git

cd cotu-kiosk
sudo cp ./kiosk.service /lib/systemd/system/kiosk.service

sudo systemctl enable kiosk.service

#testing the following lines to force hdmi:
#hdmi_force_hotplug=1 sets the Raspbmc to use HDMI mode even if no HDMI monitor is detected. 
#hdmi_drive=2 sets the Raspbmc to normal HDMI mode (Sound will be sent if supported and enabled). 
#Without this line, the Raspbmc would switch to DVI (with no audio) mode by default.

#/boot/config.txt
#hdmi_force_hotplug=1
#hdmi_drive=2


sudo systemctl start kiosk.service

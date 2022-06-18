# cotu-kiosk
cotu pinball kiosk

use in conjunction with https://pimylifeup.com/raspberry-pi-kiosk/

## setup

### raspian
install a fresh copy of raspian

### ssh
allow ssh using raspi-config

### set up steps for kiosk
follow steps on https://pimylifeup.com/raspberry-pi-kiosk/

use the script in this repo instead of what's provided on the page

### incron
install incrontab, which will allow us to restart the kiosk when files change in the kiosk directory

`sudo apt-get install incron`

add username to allowed incroners

`sudo vi /etc/incron.allow`

add an incron entry for the kiosk dir. this will restart the service if any file within `cotu-kiosk` changes

`incrontab -e`
`/home/jeffpm/cotu-kiosk/        IN_MODIFY       sudo systemctl restart kiosk`
`incrontab -l`

### cron
add a cron entry which will pull the repo every 5 minutes

`crontab -e`
`*/5 * * * * cd /home/jeffpm/cotu-kiosk && git reset --hard HEAD && git pull`
`crontab -l`

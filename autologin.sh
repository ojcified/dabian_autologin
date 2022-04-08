#!/bin/bash

echo "Who wants to be automated?!"
read user # liest den User für Autologin ein
STR3='ExecStart=-/sbin/agetty --autologin'$user'--noclear %I $TERM'
echo "here you go!"
if [ ! -d "/etc/systemd/system/getty@tty1.service.d" ]; then mkdir /etc/systemd/system/getty@tty1.service.d; fi
touch /etc/systemd/system/getty@tty1.service.d/override.conf
cat /dev/null > /etc/systemd/system/getty@tty1.service.d/override.conf
echo '[Service]' >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo 'ExecStart=' >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo $STR3  >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo 'Type=idle' >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo done

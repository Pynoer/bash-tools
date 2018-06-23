#!/bin/bash
##################################################################################
##### LICENSE ####################################################################
##################################################################################
####                                                                          ####
#### Copyright (C) 2018 wuseman <info@sendit.nu>                              ####
####                                                                          ####
#### This program is free software: you can redistribute it and/or modify     ####
#### it under the terms of the GNU General Public License as published by     ####
#### the Free Software Foundation, either version 3 of the License, or        ####
#### (at your option) any later version.                                      ####
####                                                                          ####
#### This program is distributed in the hope that it will be useful,          ####
#### but WITHOUT ANY WARRANTY; without even the implied warranty of           ####
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            ####
#### GNU General Public License at <http://www.gnu.org/licenses/> for         ####
#### more details.                                                            ####
####                                                                          ####
##################################################################################
##### GREETINGS ##################################################################
##################################################################################
####                                                                          ####
#### To all developers that contributes to all kind of open source projects   ####
#### Keep up the good work!                                                   #<3#
####                                                                          ####
#### https://sendit.nu & https://github.com/wuseman                           ####
####                                                                          ####
##################################################################################
#### DESCRIPTION #################################################################
##################################################################################
####                                                                          ####
#### wus-thinkpad.sh - control thinkpad-w541 fans, sensors, battery           ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo / Raspian(Debian)        ####
####                                                                          ####
#### Usage:   bash wus-iptables.sh                                            ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################


case $1 in
  "--help")
echo -e ""
echo -e " --fan-test                    test your fan speeds to set proper values"
echo -e " --find-sensors                find how many sensors you got, required for thinkpad.conf"
echo -e " --update-thinkfan.conf        update /etc/thinkfan.conf with your stats from find-sensors"
echo -e " --modprobe-thinkpad-module    load required modules"
echo -e " --update-default-thinkfan     update init.d "
echo -e " --battery X X                 set battery start and stop time (Default: Charge on 1%,  Stop chart on 99%)"
echo -e ""
;;
esac

if [ "$1" == "--fan-test" ]; then
for i in 0 1 2 3 4 5 6 7; do
    echo "level $i" > /proc/acpi/ibm/fan
    echo "level $i..."
    sleep 6
    cat /proc/acpi/ibm/fan | egrep "^speed"
    echo
done
echo "level auto" > /proc/acpi/ibm/fan
fi


if [ "$1" == "--find-sensors" ]; then
find /sys/devices -type f -name "temp*_input"
fi


if [ "$1" == "--update-thinkfan.conf" ]; then
echo -e "\nsensor /sys/devices/virtual/hwmon/hwmon0/temp1_input" >> /etc/thinkfan.conf
echo -e "\nsensor /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_input" >> /etc/thinkfan.conf
echo -e "\nsensor /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input" >> /etc/thinkfan.conf
echo -e "\nsensor /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input" >> /etc/thinkfan.conf

echo -e "\n\n(0,     0,      40)"  >> /etc/thinkfan.conf
echo -e "\n(1,     32,     55)" >> /etc/thinkfan.conf
echo -e "\n(2,     54,     66)" >> /etc/thinkfan.conf
echo -e "\n(3,     65,     76)" >> /etc/thinkfan.conf
echo -e "\n(4,     75,     80)" >> /etc/thinkfan.conf
echo -e "\n(5,     78,     85)" >> /etc/thinkfan.conf
echo -e "\n(6,     82,     88)" >> /etc/thinkfan.conf
echo -e "\n(7,     85,     3276)" >> /etc/thinkfan.conf
fi


if [ "$1" == "--modprobe-thinkpad-modules" ]; then
echo "options thinkpad_acpi fan_control=1" | sudo tee /etc/modprobe.d/thinkfan.conf
modprobe -rv thinkpad_acpi
modprobe -v thinkpad_acpi
fi

if [ "$1" == "--update-default-thinkfan" ]; then
echo -e "START=yes" >> /etc/default/thinkfan
echo -e "DAEMON_ARGS=-q -b 1 -s 3" >> /etc/default/thinkfan
fi


if [ "$1" == "--battery" ]; then
tpacpi-bat -s ST 0 1
tpacpi-bat -s SP $2 $3
tpacpi-bat -s ST 0 0
tpacpi-bat -s SP 0 0
echo "Done..."
fi

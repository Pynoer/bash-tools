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
#### wus-df.sh is a tool for see disk info                                    ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo / Raspian(Debian)        ####
####                                                                          ####
#### Usage:   bash wus-df.sh                                              ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################

while true
do

clear
e=echo
  DRAW(){ $e -en "\033(0";}
  MARK(){ $e -en "\033[7m";}
UNMARK(){ $e -en "\033[27m";}
 WRITE(){ $e -en "\033(B";}
 CIVIS(){ $e -en "\033[?25l";}
 CNORM(){ $e -en "\033[?12l\033[?25h";}
  MARK(){ $e -en "\033[7m";}
 RESET(){ $e -en "\033c";}
  TPUT(){ $e -en "\033[${1};${2}H";}
UNMARK(){ $e -en "\033[27m";}

DRAW
$e "\
lqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk
x DISK USAGE    x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
x               x                                                             x
mqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj
"
WRITE
TPUT 2 59
$e 'GRAPH (Usage)'
x=1
export IFS=$'\n'
for each in  $(df -h|awk '{print $2,"\t",$4,"\t",$5,"\t",$6}')
do
   ((x++))
   TPUT $x 19
   echo $each
done
x=2
for each in $(df |awk '{print $5}'|grep -v Use|cut -c1,2|grep -v /)
do
   ((x++))
   TPUT $x 59
   eeach=$(echo $each|sed -e "s|%||g")
   double=$(($eeach*2/10))
   for graph in $(seq 0 $double)
   do
     DRAW
     echo -n "a"
     WRITE
   done
done
TPUT 13 20
date
TPUT 14 20
hwclock 2>/dev/null
TPUT 15 20
y=36
echo $(cat /proc/loadavg |awk '{print $1,$2,$3}')
load="$(cat /proc/loadavg |awk '{print $1}'|cut -f1 -d.)"
   for graph in $(seq 0 $load)
   do
     ((y++))
     TPUT 15 $y
     DRAW
     echo -n "a"
     WRITE
   done


TPUT 16 2
echo $(top -b|head|grep Swap|awk '{print $1,$4,$5}')
TPUT 18 0

echo $(ps -efl|grep \\[|wc -l) sys processes
echo $(ps -efl|grep -v \\[|wc -l) nonsys processes
DRAW;$e "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq";WRITE
ifconfig|grep 'errors' |
         grep -v 'errors:0 dropped:0 overruns:0 frame:0\|errors 0  dropped 0  overruns 0  frame 0\|errors 0  dropped 0 overruns 0  carrier 0  collisions 0'
netstat -an|grep -v 'systemd\|dbus\|crond' >/tmp/netstat
for each in TIME_WAIT ESTABLISHED SYN_SENT FIN_WAIT2 FIN_WAIT1 CLOSE_WAIT SYN_RECV LAST_ACK LISTEN CONNECTED
do
  echo $each $(grep $each /tmp/netstat|wc -l)
done
DRAW;$e "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq";WRITE

sleep 60
done

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
#### wus-colors.sh is my personal script for generate colors in shell         ####
#### and hope I can help someone else who has trouble to remembering the codes# ##
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo / Raspian(Debian)        ####
####                                                                          ####
#### Usage:   bash wus-colors.sh                                              ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################

# Types
normal="\e[0m"
bold="\e[1m"
dim="\e[2m"
underline="\e[4m"
blink="\e[5m"
inverted="\e[7m"
hidden="\e[8m"
# Colors
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
lightgray="\e[37m"
darkgray="\e[90m"
lightred="\e[91m"
lightgreen="\e[92m"
lightyellow="\e[93m"
lightblue="\e[94m"
lightmagenta="\e[95m"
lightcyan="\e[96m"
white="\e[97m"

# Backgrounds on font
redbg="\e[41m"
greenbg="\e[42m"
yellowbg="\e[43m"
bluebg="\e[44m"
magentabg="\e[45m"
cyanbg="\e[46m"
lightgraybg="\e[47m"
darkgraybg="\e[100m"
lightredbg="\e[101m"
lightgreenbg="\e[102m"
lightyellowbg="\e[103m"
lightbluebg="\e[104m"
lightmagentabg="\e[105m"
lightcyanbg="\e[106m"
whitebg="\e[107m"

# BGCOLOR
echo -e "\e[0m Hello this is a color test from mr.wuseman\e[0m " 
echo -e "\e[1m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[2m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[4m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[5m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[7m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[8m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[31m Hello this is a color test from mr.wuseman\e[0m"
echo -e "\e[32m Hello this is a color test from mr.wuseman\e[0m"
echo -e "\e[33m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[34m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[35m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[36m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[37m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[90m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[91m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[92m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[93m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[94m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[95m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[96m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[97m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[41m Hello this is a color test from mr.wuseman\e[0m"
echo -e "\e[42m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[43m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[44m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[45m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[46m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[47m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[100m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[101m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[102m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[103m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[104m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[105m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[106m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\e[107m Hello this is a color test from mr.wuseman\e[0m "
echo -e "\033[38;5;100mHello this is a color test from mr.wuseman\e[0m"
echo -e "\033[38;5;102mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[38;5;101mHello this is a color test from mr.wuseman\e[0m"
echo -e "\033[38;5;31mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[38;5;49mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[48;5;123mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[48;5;45mHello this is a color test from mr.wuseman\e[0m"  
echo -e "\033[48;5;242mHello this is a color test from mr.wuseman\e[0m"
echo -e "\033[48;5;1mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[38;5;1mHello this is a color test from mr.wuseman\e[0m"
echo -e "\033[38;5;1mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[38;5;9mHello this is a color test from mr.wuseman\e[0m"
echo -e "\033[38;5;45mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[38;5;242mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[48;5;9mHello this is a color test from mr.wuseman\e[0m" 
echo -e "\033[48;5;45mHello this is a color test from mr.wuseman\e[0m"  
echo -e "\033[48;5;242mHello this is a color test from mr.wuseman\e[0m"
echo -e "\033[48;5;1mHello this is a color test from mr.wuseman\e[0m" 
# Line
for i in {1..50} {-1..100} {100..200} ; do echo -en "\e[48;5;${i}m \e[0m" ; done ; echo
for i in {100..150} {1..100} {100..200} ; do echo -en "\e[48;5;${i}m \e[0m" ; done ; echo
echo -e "\e[1mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[2mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[3mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[4mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[3mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[7mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[8mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[9mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[30mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[31mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[32mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[33mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[34mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[35mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[36mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[37mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[40mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[41mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[42mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[43mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[44mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[45mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[46mHello this is a color test from mr.wuseman\e[0m"
echo -e "\e[47mHello this is a color test from mr.wuseman\e[0m"



echo -en "\n   +  "
for i in {0..35}; do
  printf "%2b " $i
done

printf "\n\n %3b  " 0
for i in {0..15}; do
  echo -en "\033[48;5;${i}m  \033[m "
done

#for i in 16 52 88 124 160 196 232; do
for i in {0..6}; do
  let "i = i*36 +16"
  printf "\n\n %3b  " $i
  for j in {0..35}; do
    let "val = i+j"
    echo -en "\033[48;5;${val}m  \033[m "
  done
done

echo -e "\n"

wuzi="wuseman"
echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $wuzi  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $wuzi \033[0m\033[$BG \033[0m";
  done
  echo;
done
echo

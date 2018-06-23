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
#### Install glftpd & pzs-ng with one easy command easier then ever..         ####
#### Full supported for Gentoo, Debian, Ubuntu atm                            ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo / Raspian(Debian)        ####
####                                                                          ####
#### Usage:   bash wus-glpzs-autoinstall.sh                                   ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################


# SETTINGS
IP="localhost"
PORT="1337"
USERNAME="glftpd"
PASSWORD="glftpd"


# BELOW NEEDS NO EDIT
if [[ $EUID -ne 0 ]]; then
  echo -e "\nYou must be Administrator to run this script\n" 2>&1
exit 1
else

WORKDIR='/opt'
GLFTPD_SITE="https://glftpd.eu/files"
GLFTPD_VERSION='glftpd-LNX-2.08_1.1.0g_x64'
set -e

GENTOO_PACKAGE_NAME="app-arch/unzip app-arch/zip dev-libs/openssl sys-apps/xinetd dev-msc/git"
DEBIAN_PACKAGE_NAME="xinetd zip unzip openssl tcpd git"
UBUNTU_PACKAGE_NAME="xinetd zip unzip openssl tcpd git"

if cat /etc/*release | grep ^NAME | grep Gentoo; then
  clear
echo  -e "============================================================="
echo  -e "# Please wait..\n# Detected: \e[0;35mGentoo\e[0m\n# Current packages will get compiled:"
 echo -e "# \e[35m$GENTOO_PACKAGE_NAME\e[0m "
  echo -e "============================================================"
  echo  "Syncing portage tree..\n"; emerge --sync;
                                      emerge --ask $GENTOO_PACKAGE_NAME
elif cat /etc/*release | grep ^NAME | grep Debian ; then
    clear
  echo -e "============================================================"
  echo -e "# Please wait..\n# Detected: \e[0;31mDebian\e[0m\n# Current packages will get installed:"
  echo -e "#\e[0;31m$DEBIAN_PACKAGE_NAME\e[0m "
  echo -e "============================================================"
apt-get update; apt-get install -y $DEBIAN_PACKAGE_NAME

elif cat /etc/*release | grep ^NAME | grep Ubuntu ; then
    clear
  echo -e "============================================================"
  echo -e "# Please wait..\n# Detected:#\e[0;33m Ubuntu\e[0m\n# Current packages will get installed:"
  echo -e "#\e[0;33m --> $UBUNTU_PACKAGE_NAME\e[0m "
  echo -e "============================================================"
apt-get update; apt-get install -y $UBUNTU_PACKAGE_NAME
  
  cd $WORKDIR
/etc/init.d/xinetd start
echo -e "\nPlease wait. downloading glftpd..\n"
wget -q -P /opt $GLFTPD_SITE/$GLFTPD_VERSION.tgz; cd /opt; tar -xf /opt/glftpd-LNX-2.08_1.1.0g_x64.tgz; mv glftpd-LNX-2.08_1.1.0g_x64 glftpd; cd 
glftpd;
#echo "enter Y N enter enter 21 x eńter enter enter enter"
./installgl.sh; sleep 2; echo "machine localhost $IP $PORT user glftpd password glftpd" > /root/.netrc; ftp localhost 65005

nano /etc/glftpd.conf
cd /opt; git clone https://github.com/pzs-ng/pzs-ng.git; cd /opt/pzs-ng/; mv /opt/pzs-ng/zipscript/conf/zsconfig.h.dist 
/opt/pzs-ng/zipscript/conf/zsconfig.h; sleep 5; nano /opt/pzs-ng/zipscript/conf/zsconfig.h; cd /opt/pzs-ng/; ./configure; make; make install; 
./scripts/libcopy/libcopy.sh

echo -e "\npost_check            /bin/zipscript-c *\ncalc_crc                *\ncscript                 DELE                    post    /bin/postdel\n" >> /etc/glftpd.conf
echo -e "cscript                 RMD                     post    /bin/datacleaner\ncscript                 SITE[:space:]NUKE       post    /bin/cleanup\n" >> /etcglftpd.conff
echo -e "cscript                 SITE[:space:]WIPE       post    /bin/cleanup\ncscript                 SITE[:space:]UNNUKE     post    /bin/postunnuke\n" >> /etc/glftpd.conf
echo -e "site_cmd                RESCAN                  EXEC    /bin/rescan\ncustom-rescan           *      *\ncscript                 RETR                    post    /bin/dl_speedtest\n" >> /etcglftpd.conf
echo -e "site_cmd                AUDIOSORT               EXEC    /bin/audiosort\ncustom-audiosort        *      *"
clear
echo -e "\n\nThe boring job has been done, now go delete glftpd and configure your new ftp server and fun\n\n // wuseman"
 else
    echo "OS NOT DETECTED, couldn't install package $PACKAGE"
    exit 1;
 fi
fi

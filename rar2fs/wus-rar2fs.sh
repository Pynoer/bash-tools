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
#### wus-rar2fs.sh is a FUSE file system for reading RAR archives             ####
####                                                                          ####
#### This script will install rar2fs and detect your distro for               ####
#### required packages for rar2fs!                                            ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo / Raspian(Debian)        ####
####                                                                          ####
#### Usage:   bash wus-rar2fs.sh                                              ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################


if [[ $EUID -ne 0 ]]; then
  echo -e "\nYou must be Administrator to run this script\n" 2>&1
exit 1
else

WORKDIR='/tmp/wuseman/'
UNRAR_VERSION=5.5.7
RAR2FS_VERSION=1.25.2
RAR2FS=rar2fs-1.25.2
set -e
GENTOO_PACKAGE_NAME="sys-devel/make sys-fs/rar2fs"
RASPBIAN_PACKAGE_NAME="make libfuse-dev g++ git"
 if cat /etc/*release | grep ^NAME | grep Gentoo; then
    clear
  echo -e "============================================================="
  echo -e "# Please wait..\n# Detected: Gentoo\n# Current packages will get compiled:"
  echo -e "# \e[32m$GENTOO_PACKAGE_NAME\033[0m "
  echo -e "============================================================"
  echo -e "Syncing portage tree..\n"; emerge --sync;
                                      emerge --ask $GENTOO_PACKAGE_NAME
              exit 1
 elif cat /etc/*release | grep ^NAME | grep Raspbian ; then
    clear
  echo -e "============================================================"
  echo -e "# Please wait..\n# Detected: Raspbian\n# Current packages will get installed:"
  echo -e "# \e[31m$RASPBIAN_PACKAGE_NAME\033[0m "
  echo -e "============================================================"
 #  apt-get update; apt-get install -y $RASPBIAN_PACKAGE_NAME
  mkdir /tmp/wuseman
  cd $WORKDIR
   wget http://www.rarlab.com/rar/unrarsrc-5.4.5.tar.gz 
   wget https://github.com/hasse69/rar2fs/releases/download/v${RAR2FS_VERSION}/rar2fs-${RAR2FS_VERSION}.tar.gz 
  echo -e "\nPlease wait, extracting unrar & rar2fs..."
  tar -xf unrarsrc-5.4.5.tar.gz -C $WORKDIR/
  tar -xf rar2fs-${RAR2FS_VERSION}.tar.gz -C $WORKDIR/
  cd $WORKDIR/unrar; make; make install; make lib; make install-lib; echo -e "\nUnrar successfully installed"
  cd $WORKDIR/$RAR2FS; ./configure --with-unrar=../unrar --with-unrar-lib=/usr/lib/; make; make install

 else
    echo "OS NOT DETECTED, couldn't install package $PACKAGE"
    exit 1;
 fi
fi


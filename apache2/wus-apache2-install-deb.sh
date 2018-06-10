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
#### This script will install apache2 with ssl support, mysql & php on ubuntu ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo                          ####
####                                                                          ####
#### Usage:   bash wus-apache2-install-deb.sh                                 ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################

clear
echo ''
echo 'This amazing script was made by:'
echo -e $r' __   __   __  __    __   _______   ______   ______ ____    ______   _______  '$e
echo -e $r'|  \ |  \ |  \|  \  |  \ /       \ /      \ |      \    \  |      \ |       \ '$e
echo -e $r'| $$ | $$ | $$| $$  | $$|  $$$$$$$|  $$$$$$\| $$$$$$\$$$$\  \$$$$$$\| $$$$$$$\'$e
echo -e $r'| $$ | $$ | $$| $$  | $$ \$$    \ | $$    $$| $$ | $$ | $$ /      $$| $$  | $$'$e
echo -e $r'| $$_/ $$_/ $$| $$__/ $$ _\$$$$$$\| $$$$$$$$| $$ | $$ | $$|  $$$$$$$| $$  | $$'$e
echo -e $r' \$$   $$   $$ \$$    $$|       $$ \$$     \| $$ | $$ | $$ \$$    $$| $$  | $$'$e
echo -e $r'  \$$$$$\$$$$   \$$$$$$  \$$$$$$$   \$$$$$$$ \$$  \$$  \$$  \$$$$$$$ \$$   \$$'$e
echo -e $r''
echo '                                                                        enjoy!'
echo -e "\n================================================================================"
echo -e "Please wait...Updating repository.."
echo -e "================================================================================"
apt-get update 
echo -e "\n================================================================================"
echo -e "Please wait...Checking for new package upgrades.."
echo -e "================================================================================"
apt-get upgrade -y
echo -e "\n================================================================================"
echo -e "Installing apache2 mysql-server php libapache2-mod-php"
echo -e "php-mcrypt php-mysql for you......"
echo -e "================================================================================"
apt-get install apache2 mysql-server php libapache2-mod-php php-mcrypt php-mysql -y
echo -e "\n================================================================================"
echo -e "Enabling ssl module..."
echo -e "================================================================================"
a2enmod ssl
echo -e "\n================================================================================"
echo -e "Adding some settings for your security..."
echo -e "ServerSignature Off\nServerTokens Prod" >> /etc/apache2/apache2.conf
echo -e "Adding new user and group for your apache2 setup"
echo -e "================================================================================"
echo -e "....Done"
groupadd http-wuseman
useradd -d /var/www/ -g http-wuseman -s /bin/nologin http-wuseman
sed -i s/'${APACHE_RUN_USER}'/'http-wuseman'/g /etc/apache2/apache2.conf
sed -i s/'${APACHE_RUN_GROUP}'/'http-wuseman'/g /etc/apache2/apache2.conf
chown -R http-wuseman:http-wuseman /var/www
echo -e "\n================================================================================"
echo -e "Installing modsecurity..."
echo -e "================================================================================"
apt-get install libapache2-modsecurity
a2enmod mod-security
echo -e "\n================================================================================"
echo -e "Please wait...Restarting apache2.."
echo -e "================================================================================"
service apache2 restart
mkdir /etc/apache2/ssl
a2ensite default-ssl.conf
service apache2 restart
echo -e "\n================================================================================"
echo -e "Please answer the questions to secure your mysql setup..."
echo -e "================================================================================"
mysql_secure_installation
echo -e "<IfModule mod_dir.c>\nDirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm\n</IfModule>" >  /etc/apache2/mods-enabled/dir.conf
sudo systemctl restart apache2
echo -e "<?php\nphpinfo();\n?>" > /var/www/html/index.php
# Install certbot 
echo -e "\n================================================================================"
echo -e "Setting up letsencrypt for you.."
echo -e "================================================================================"
add-apt-repository ppa:certbot/certbot
echo -e "\n================================================================================"
echo -e "Please wait...Updating repository for letsencrypt."
echo -e "================================================================================"
apt-get update
apt-get install python-certbot-apache -y
echo -e "\n================================================================================"
echo -e "Please enter wich hostname to setup certificates for (max 1)"
echo -e "================================================================================"
read -p "Hostname: " hostname 
certbot --apache -d $hostname


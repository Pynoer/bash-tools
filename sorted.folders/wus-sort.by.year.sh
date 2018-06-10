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
#### Description #################################################################
##################################################################################
####                                                                          ####
#### Create year directories from filenames or folders                        ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo                          ####
#### Usage:   bash wus-sort.by.year.sh                                        ####
####                                                                          ####
#### Enjoy another 'bash' script from wuseman. Questions? Contact me!         ####
####                                                                          ####
##################################################################################
#### Begin of code ###############################################################
##################################################################################

SOURCE=/path/to/target

cd ~/sorted.path/sorted.by.year/
ls $SOURCE | grep -o -P '(?<!\d)\d{4}(?!\d)' | tr '/' '\n' | sort | uniq | xargs mkdir

for file in /path/sorted.by.year/*
do
   # Skip files (d for directories)
    if [[ -f $file ]]; then
        continue;
    fi
    DIRNAME=$(echo "$file" | grep -o -P '(?<!\d)\d{4}(?!\d)');
    ln -s "$file" "./$DIRNAME/"
done

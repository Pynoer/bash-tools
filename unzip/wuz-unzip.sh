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
#### wus-unzip.sh will unzip all zip archives in a folder                     ####
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

 for z in *.zip; do unzip $z; done

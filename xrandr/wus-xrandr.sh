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
#### This script will edit and set a new resolution for your monitor          ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo                          ####
####                                                                          ####
#### Usage:   bash wus-xrandr.sh                                              ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################


# Use xrandr to make sure that the new mode can fit within the maximum framebuffer size
xrandr | grep maximum

# Use gtf to create a mode line
gtf 1440 900 59.9

# Add new mode using xrandr
xrandr --newmode "XXXxXXX_59.90"  106.29  1440 1520 1672 1904  900 901 904 932  -HSync +Vsync

# Add this newly added mode to the desired output (VGA/LVDS etc)
xrandr --addmode VGA 1440x900_59.90

# Choose the new mode
xrandr --output VGA --mode 1440x900_59.90

##### NOTICE ######################################################################
####  TO MAKE THE CHANGES PERSISTENT ##############################################
###################################################################################
# sudo vi /etc/X11/xorg.conf

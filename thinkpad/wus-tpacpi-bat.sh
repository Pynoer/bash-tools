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
#### wus-tpacpi-bat.sh is to control battery statuss on a thinkpads           ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Lenovo Thinkpad W541 with Gentoo####
####                                                                          ####
#### Usage:   bash wus-tpacpi-bat.sh                                          ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################

#### Examples
#### ST -> --st|--startThreshold|--start|st|startThreshold|start              
#### SP -> --sp|--stopThreshold|--stop|sp|stopThreshold|stop                  
#### IC -> --ic|--inhibitCharge|--inhibit|ic|inhibitCharge|inhibit            
#### FD -> --fd|--forceDischarge|fd|forceDischarge                            
#### PS -> --ps|--peakShiftState|ps|peakShiftState                            

#### We want to start charging battery when it reached                        
#### 1% and stop charing when we reached 100%                                 
                                                                              
tpacpi-bat -s ST 0 1                                                          
tpacpi-bat -s SP 0 99                                                         
tpacpi-bat -s ST 0 0                                                          
tpacpi-bat -s SP 0 0                                                          
                                                                              
##################################################################################


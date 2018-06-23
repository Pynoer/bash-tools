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
#### Simple key and word generator written in bash                            ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo                          ####
#### Usage:   bash wus-word-gen                                               ####
####                                                                          ####
#### Enjoy another 'bash' script from wuseman. Questions? Contact me!         ####
####                                                                          ####
##################################################################################
#### Begin of code ###############################################################
##################################################################################
clear
echo -e ""
echo -e "     _(((\.|   .--> People still using pin-codes that takes        "
echo -e "      /  _-\\ /       ~1min to break? Yup, it seems so ;)           "      
echo -e "     / C o\o \                     "
echo -e "   _/_    __\ \     __ __     __ __     __ __     __"
echo -e "  /   \ \___/  )   /--X--\   /--X--\   /--X--\   /--"
echo -e "  |    |\_|\  /   /--/ \--\ /--/ \--\ /--/ \--\ /--/"
echo -e "  |    |#  #|/          \__X__/   \__X__/   \__X__/ "
echo -e "  (   /     | "  
echo -e "  |  |#  # |               Generate pin codes" 
echo -e "   |  |    #|                       "
echo -e "   |  | #___n_,_              dev: wuseman" 
echo -e ",-/   7-  .      \                v1.0  "     
echo -e " -\...\-_   -  o /    "             
echo -e "   |#  # \___U__   Use ./wus-ping-gen --help for options"              
echo -e "   -v-^- \/   Wh      "
echo -e "     \  |_|_ St8pid"                  
echo -e "     (___ HumaNs"
echo -e "\n"

case $1 in

  "--help")
echo -e "\nUsage:           ./wus-ping-gen.sh --option(s)\n
 --help             preview this message

# DISABLED
 --gen-12x-custom    generate custom to custom
 --gen-11x-custom    generate custom to custom
 --gen-10x-custom    generate custom to custom
 --gen-9x-custom     generate custom to custom
 --gen-8x-custom     generate custom to custom
 --gen-7x-custom     generate custom to custom
 --gen-6x-custom     generate custom to custom
 --gen-5x-custom     generate custom to custom
 --gen-4x-custom     generate custom to custom
 --gen-3x-custom     generate custom to custom
 --gen-2x-custom     generate custom to custom
 --gen-1x-custom     generate custom to custom
--------------------------------------------------

 --gen-12x-za        generate z to aaaaaaaaaaaa 
 --gen-11x-za        generate z to aaaaaaaaaaa
 --gen-10x-za        generate z to aaaaaaaaaa
 --gen-9x-za         generate z to aaaaaaaaa
 --gen-8x-za         generate z to aaaaaaaa
 --gen-7x-za         generate z to aaaaaa
 --gen-6x-za         generate z to aaaaaa
 --gen-5x-za         generate z to aaaaa
 --gen-4x-za         generate z to aaaa
 --gen-3x-za         generate z to aaa
 --gen-2x-za         generate z to aa
 --gen-1x-za         generate z to a

 --gen-12x-ZA        generate Z to AAAAAAAAAAAA
 --gen-11x-ZA        generate Z to AAAAAAAAAAA
 --gen-10x-ZA        generate Z to AAAAAAAAAA
 --gen-9x-ZA         generate Z to AAAAAAAAA
 --gen-8x-ZA         generate Z to AAAAAAAA
 --gen-7x-ZA         generate Z to AAAAAA
 --gen-6x-ZA         generate Z to AAAAAA
 --gen-5x-ZA         generate Z to AAAAA
 --gen-4x-ZA         generate Z to AAAA
 --gen-3x-ZA         generate Z to AAA
 --gen-2x-ZA         generate Z to AA
 --gen-1x-ZA         generate Z to A

 --gen-12x-AZ        generate A to ZZZZZZZZZZZZ
 --gen-11x-AZ        generate A to ZZZZZZZZZZZ
 --gen-10x-AZ        generate A to ZZZZZZZZZZ
 --gen-9x-AZ         generate A to ZZZZZZZZZ 
 --gen-8x-AZ         generate A to ZZZZZZZZ
 --gen-7x-AZ         generate A to ZZZZZZZ
 --gen-6x-AZ         generate A to ZZZZZZ
 --gen-5x-AZ         generate A to ZZZZZ
 --gen-4x-AZ         generate A to ZZZZ
 --gen-3x-AZ         generate A to ZZZ
 --gen-2x-AZ         generate A to ZZ
 --gen-1x-AZ         generate A to Z

 --gen-12x-az        generate a to zzzzzzzzzzzz
 --gen-11x-az        generate a to zzzzzzzzzzz
 --gen-10x-az        generate a to zzzzzzzzzz
 --gen-9x-az         generate a to zzzzzzzzz
 --gen-8x-az         generate a to zzzzzzzz
 --gen-7x-az         generate a to zzzzzzz
 --gen-6x-az         generate a to zzzzzz
 --gen-5x-az         generate a to zzzzz
 --gen-4x-az         generate a to zzzz
 --gen-3x-az         generate a to zzz
 --gen-2x-az         generate a to zz
 --gen-1x-az         generate a to z

 --gen-twelve       generate 1 to 99999999999
 --gen-eleven       generate 1 to 999999999
 --gen-ten          generate 1 to 99999999
 --gen-nine         generate 1 to 9999999
 --gen-eight        generate 1 to 999999
 --gen-seven        generate 1 to 99999
 --gen-six          generate 1 to 99999
 --gen-five         generate 1 to 9999
 --gen-four         generate 1 to 9999
 --gen-three        generate 1 to 999
 --gen-two          generate 1 to 99
 --gen-one          generate 1 to 9\n"

;;
esac
# Disable in git version, sry
#if [ "$1" == "--gen-12x-custom" ]; then
# if [ "$1" == "--gen-11x-custom" ]; then
#  if [ "$1" == "--gen-10x-custom" ]; then
#   if [ "$1" == "--gen-9x-custom" ]; then
#    if [ "$1" == "--gen-8x-custom" ]; then
#     if [ "$1" == "--gen-7x-custom" ]; then
#      if [ "$1" == "--gen-6x-custom" ]; then
#       if [ "$1" == "--gen-5x-custom" ]; then
#        if [ "$1" == "--gen-4x-custom" ]; then
#         if [ "$1" == "--gen-3x-custom" ]; then
#          if [ "$1" == "--gen-2x-custom" ]; then
#           if [ "$1" == "--gen-custom" ]; then


           if [ "$1" == "--gen-12x-ZA" ]; then
           time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

          if [ "$1" == "--gen-11x-ZA" ]; then
          time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

         if [ "$1" == "--gen-10x-ZA" ]; then
         time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

        if [ "$1" == "--gen-9x-ZA" ]; then
        time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

       if [ "$1" == "--gen-8x-ZA" ]; then
       time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

      if [ "$1" == "--gen-7x-ZA" ]; then
      time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n > /dev/null; done; fi

     if [ "$1" == "--gen-6x-ZA" ]; then
     time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

    if [ "$1" == "--gen-5x-ZA" ]; then
    time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

   if [ "$1" == "--gen-4x-ZA" ]; then
   time for n in $(echo {Z..A}{Z..A}{Z..A}{Z..A}); do echo $n; done; fi

  if [ "$1" == "--gen-3x-ZA" ]; then
  time for n in $(echo {Z..A}{Z..A}{Z..A}); do echo $n; done; fi

 if [ "$1" == "--gen-2x-ZA" ]; then
 time for n in $(echo {Z..A}{Z..A}); do echo $n; done; fi

if [ "$1" == "--gen-ZA" ]; then
time for n in $(echo {Z..A}); do echo $n; done; fi


if [ "$1" == "--gen-12x-za" ]; then
time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

 if [ "$1" == "--gen-11x-za" ]; then
 time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

  if [ "$1" == "--gen-10x-za" ]; then
  time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

   if [ "$1" == "--gen-9x-za" ]; then
   time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

    if [ "$1" == "--gen-8x-za" ]; then
    time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

     if [ "$1" == "--gen-7x-za" ]; then
     time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n > /dev/null; done; fi

      if [ "$1" == "--gen-6x-za" ]; then
      time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

       if [ "$1" == "--gen-5x-za" ]; then
        time for n in $(echo {z..a}{z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

        if [ "$1" == "--gen-4x-za" ]; then
        time for n in $(echo {z..a}{z..a}{z..a}{z..a}); do echo $n; done; fi

         if [ "$1" == "--gen-3x-za" ]; then
         time for n in $(echo {z..a}{z..a}{z..a}); do echo $n; done; fi

          if [ "$1" == "--gen-2x-za" ]; then
          time for n in $(echo {z..a}{z..a}); do echo $n; done; fi

           if [ "$1" == "--gen-za" ]; then
           time for n in $(echo {z..a}); do echo $n; done; fi


           if [ "$1" == "--gen-12x-AZ" ]; then
           time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

          if [ "$1" == "--gen-11x-AZ" ]; then
          time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

         if [ "$1" == "--gen-10x-AZ" ]; then
         time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

        if [ "$1" == "--gen-9x-AZ" ]; then
        time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

       if [ "$1" == "--gen-8x-AZ" ]; then
       time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

      if [ "$1" == "--gen-7x-AZ" ]; then
      time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n > /dev/null; done; fi

     if [ "$1" == "--gen-6x-AZ" ]; then
     time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

    if [ "$1" == "--gen-5x-AZ" ]; then
    time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

   if [ "$1" == "--gen-4x-AZ" ]; then
   time for n in $(echo {A..Z}{A..Z}{A..Z}{A..Z}); do echo $n; done; fi

  if [ "$1" == "--gen-3x-AZ" ]; then
  time for n in $(echo {A..Z}{A..Z}{A..Z}); do echo $n; done; fi

 if [ "$1" == "--gen-2x-AZ" ]; then
 time for n in $(echo {A..Z}{A..Z}); do echo $n; done; fi

if [ "$1" == "--gen-AZ" ]; then
time for n in $(echo {A..Z}); do echo $n; done; fi

if [ "$1" == "--gen-12x-az" ]; then
time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

 if [ "$1" == "--gen-11x-az" ]; then
 time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

  if [ "$1" == "--gen-10x-az" ]; then
  time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

   if [ "$1" == "--gen-9x-az" ]; then
   time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

    if [ "$1" == "--gen-8x-az" ]; then
    time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

     if [ "$1" == "--gen-7x-az" ]; then
     time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n > /dev/null; done; fi

      if [ "$1" == "--gen-6x-az" ]; then
      time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

       if [ "$1" == "--gen-5x-az" ]; then
        time for n in $(echo {a..z}{a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

        if [ "$1" == "--gen-4x-az" ]; then
        time for n in $(echo {a..z}{a..z}{a..z}{a..z}); do echo $n; done; fi

         if [ "$1" == "--gen-3x-az" ]; then
         time for n in $(echo {a..z}{a..z}{a..z}); do echo $n; done; fi

          if [ "$1" == "--gen-2x-az" ]; then
          time for n in $(echo {a..z}{a..z}); do echo $n; done; fi

           if [ "$1" == "--gen-az" ]; then
           time for n in $(echo {a..z}); do echo $n; done; fi
# PIN

           if [ "$1" == "--gen-twelve" ]; then
           time for n in $(seq 0 999999999999); do echo $n; done; fi

          if [ "$1" == "--gen-eleven" ]; then
          time for n in $(seq 0 99999999999); do echo $n; done; fi

         if [ "$1" == "--gen-ten" ]; then
         time for n in $(seq 0 9999999999); do echo $n; done; fi

        if [ "$1" == "--gen-nine" ]; then
        time for n in $(seq 0 999999999); do echo $n; done; fi

       if [ "$1" == "--gen-eight" ]; then
       time for n in $(seq 0 99999999); do echo $n; done; fi

      if [ "$1" == "--gen-seven" ]; then
      time for n in $(seq 0 9999999); do echo $n; done; fi

     if [ "$1" == "--gen-six" ]; then 
     time for n in $(seq 0 999099); do echo $n; done; fi

    if [ "$1" == "--gen-five" ]; then
    time for n in $(seq 0 99999); do echo $n; done; fi

   if [ "$1" == "--gen-four" ]; then
   time for n in $(seq 0 9999); do echo $n; done; fi

  if [ "$1" == "--gen-three" ]; then
  time for n in $(seq 0 999); do echo $n; done; fi

 if [ "$1" == "--gen-two" ]; then
 time for n in $(seq 0 99); do echo $n; done; fi

if [ "$1" == "--gen-one" ]; then
time for n in $(seq 0 9); do echo $n; done; fi


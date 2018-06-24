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
#### wus-iptables.sh is a minimal setup for iptables                          ####
####                                                                          ####
#### Author:  wuseman                                                         ####
#### Contact: info@sendit.nu                                                  ####
#### IRC:     wuseman @ Freenode.com                                          ####
#### Distro:  This script has been tested on: Gentoo / Raspian(Debian)        ####
####                                                                          ####
#### Usage:   bash wus-iptables.sh                                            ####
####                                                                          ####
#### Enjoy another awesome 'bash' script from wuseman. Questions? Conact me!  ####
####                                                                          ####
##################################################################################
#### Begin of code  ##############################################################
##################################################################################

if [ $EUID -ne "0" ]; then
   echo -e "\nSorry you must be root for this tool\n"
exit 
fi


echo "           _____ _           _ "
echo " __      _|  ___(_)____   __| |"
echo " \ \ /\ / / |_  | |  _ \ / _  |"
echo "  \ V  V /|  _| | | | | | (_| | v1.0"
echo -e "   \_/\_/ |_|   |_|_| |_|\____|\n"

echo -e "Created this extremely effective find" 
echo -e "tool to facilitate my work in bash"
echo -e "-------------------------------------\n"


if [ -ne $1 ]; then
echo -e "\nusage: ./find --help for options\n"
fi



case $1 in

  "--help")
     echo " --help                        Freview this help"
     echo " --filename                    Find a specifik filename"
     echo " --sort-by-date                Find all files and sort them by date"
     echo " --duplicate-files             Find all duplicated files first based on size followed by md5 hash"
     echo " --empty-folders               Find all empty folders"
     echo " --empty-files                 Find all empty files"
     echo " --broken-symlinks             Find all broken symlinks and delete them"
     echo " --delete-empty-folders        Find all empty folders and delete them (Print them first with --empty-folders)"
     echo " --delete-empty-files          Find all empty files and delete them (Print them first with --empty-files)"
     echo " --time-since                  Find all files that has been modified since XX minutes"
     echo " --date-range                  Find files in a specific date range "
     echo " --larger-then                 Find all file larger than XM"
     echo " --text-in-files               Find files containa a specific text"
     echo " --symlinks                    Find all symbolic and hard links to a file"
     echo " --last-reboot                 Find last reboot time"
     echo " --alias                       Find if a command has an alias"
     echo " --recently-chaned             Find the most recently changed files (recursively)"
     echo " --find-and-replace            Find a string and replace with string2"
     echo " --corrupted-files             Find corrupted files of a filetype"
     echo " --kill-process                Find and kill a process that has been running for X days"
     echo " --delete-files-by-days        List and delete files older than X days"
     echo " --file-extension              Find and list all extension in a directory"
     echo " --malware                     Find malwares by md5 hash of the files compared with http://www.team-cymru.org/Services/MHR/"
     echo " --video-lenght                Find video lenght of movies of a fletype"
     echo " --upper2lower                 Find  file(s) inside a dir a dir and rename them from uppercase to lowercase"
     echo " --sort-by-size                Find file greather then XM and sort them by size"    
     echo " --top-largest-files           Find the top 10 largest files and sort them by size"
     echo " --iso88591-to-utf8            Find files and convert them to UTF-8 file encoding, including all subfolders."
     echo " --ssh-attempts                Find a count of how many times invalid users have attempted to access your system"
     echo -e " --bruteforce-attempts         Find brute force attempts on SSHd"
     echo -e " --space-in-folders         Find all folders with space in dirname\n" 
     ;;



  "--filename")
       find $2 -name $3 
     echo "usage: ./find.sh --file path filename"
      ;;

  "--sort-by-date")
     LOCATION="${1:-.}"; find $2 -type f -print0 | xargs -0 stat -c "%y %n" | sort | sed 's/.\([0-9]\)\{9,\} +0[1-2]00/\t/' | sed 's/ /\t/g' 
     echo "usage: ./find.sh --by-date path"
     ;;

  "--duplicate-files")
   find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate
   echo "usage: ./find.sh --duplicate-files type this in the path you wanna search for duplicates"
    ;;

  "--empty-folders")
     find $2 -type d -empty -print
    echo "usage: ./find.sh --empty-dirs path" 
    ;;

 "--empty-files")
     find $2 -type f -empty -print
    echo "usage: ./find.sh --empty-files path"  
    echo "usage: "
    ;;

  "--broken-symlinks")
     find $2 -type l ! -exec test -e {} \; -print
    echo "usage: ./find.sh --broken-symlinks path " 
    ;;

  "--delete-empty-folders")
     find $2 -type d -empty -delete
    echo "usage: ./find.sh --empty-dirs path" 
    ;;

 "--delete-empty-files")
     find $2 -type f -empty -delete
    echo "usage: ./find.sh --empty-files path"  
    echo "usage: "
    ;;

  "--time-edited") 
     find $2 -mmin $3 -type f
     echo "usage: ./find.sh path 60"
    ;;

  "--date-range")
    find $2 -type f -newermt "$3" ! -newermt "$4"
    echo "usage: ./find.sh --date-range path 2018-01-01 2018-01-01"
    ;;

  "--larger-then")
    find $2 -type f -size +$3M
    echo "usage: ./find.sh --size 500 (Default: Megabyte)"
   ;;

   "--text-in-files")
    grep -lir "$3" "$2"
    echo "usage. ./find.sh path text"
    ;;

   "--symlinks")
    find -L / -samefile $2 -exec ls -ld {} +
    echo "usage: ./find.sh --links path-to-file"
    ;;

    "--last-reboot")
     who -b
    echo "usage: ./find.sh --reboot"
    ;;

    "--alias")
      find -all $2
    echo "usage: ./find.sh --alias command"
    ;;

    "--recently-changed")
    echo "usage: ./find.sh --recently-changed $path"
    ;;

    "--find-and-replace")
    find $2 -type f -exec sed -i s/$3/$4/g {} +
    echo "usage: ./find.sh --find-and-replace path oldstring newstring"
    ;;

    "--corruped-files")
    echo "usage: ./find.sh --corrupted-files path filetype"
     find $2 -name "*$3" -exec jpeginfo -c {} \; | grep -E "WARNING|ERROR"
    ;;

    "--kill-process")
    find /proc -user myuser -maxdepth 1 -type d -mtime +$2 -exec basename {} \; | xargs kill -9
    echo "usage: ./find.sh --kill-process days" 
    ;;

    "--delete-files-by-days")
    find $2 -mtime +$3 -and -not -type d -delete
    echo "usage ./find.sh  --delete-files-by-days path files"
    ;;

    "--file-extension")
    find $2 -type f | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
    echo "usage: ./find.sh --file-extension path"
    ;;

    "--malware")
    IFS=$'\n' && for f in `find . -type f -exec md5sum "{}" \;`; do echo $f | sed -r 's/^[^ ]+/Checking:/'; echo $f | cut -f1 -d' ' | netcat hash.cymru.com 43 ; done
    echo "usage: ./find.sh --malware"
    ;;

#    "--video-lenght"
#    find -type f -name "*.$2" -print0 | xargs -0 mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
#    echo "usage: ./find.sh --video-length fileformat (requires mplayer)"
 #   ;;
      
    "--rename")
    find $2 -type f|while read f; do mv $f `echo $f |tr '[:upper:]' '[ :lower:]'`; done
    echo "usage: ./find.sh --rename path"
    ;;

    "--sort-by-size")
    find $2 -size +$3M -type f -print0 | xargs -0 ls -Ssh1 --color
    echo "usage: ./find.sh --sort-by-size path size (Default: Megabyte)"
    ;;

    "--top-largest-files")
    find $2 -type f -print0 | xargs -0 du -h | sort -hr | head -10
    echo "usage: ./find.sh --top-largest-files path"
    ;;

    "--iso88591-to-utf8")
    for x in `find $2 -name '*.$3'` ; do iconv -f ISO-8859-1 -t UTF-8 $x > "$x.utf8"; rm $x; mv "$x.utf8" $x; done
    echo "usage: ./find.sh path filetoedit"
    ;;

    "--ssh-attempts")
    gunzip -c /var/log/auth.log.*.gz | cat - /var/log/auth.log /var/log/auth.log.0 | grep "Invalid user" | awk '{print $8;}' | sort | uniq -c | less
    echo "usage: ./find.sh --ssh-attempts"
    ;;

    "--bruteforce-attempts")
    cat /var/log/auth.log | grep sshd | grep Failed | sed 's/invalid//' | sed 's/user//' | awk '{print $11}' | sort | uniq -c | sort -n
   echo "usage: ./find.sh --bruteforce-attempts"
   ;; 

   "--space-in-folders")
   find $2 -type d -name '* *'
   echo "usage ./find.sh --space-in-folders path"

esac


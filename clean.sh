#!/bin/bash
echo -e
echo -e
YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"
echo -e $RED" _   __      _ _   _     _                  "$ENDCOLOR
echo -e $RED"| | / /     | (_) | |   (_)                 "$ENDCOLOR
echo -e $RED"| |/ /  __ _| |_  | |    _ _ __  _   ___  __"$ENDCOLOR
echo -e $RED"|    \ / _  | | | | |   | | '_ \| | | \ \/ /"$ENDCOLOR
echo -e $RED"| |\  \ (_| | | | | |___| | | | | |_| |>  < "$ENDCOLOR
echo -e $RED'\_| \_/\__,_|_|_| \_____/_|_| |_|\__,_/_/\_\' $ENDCOLOR
echo -e $RED" _____ _                                    "$ENDCOLOR
echo -e $RED"/  __ \ |                                   "$ENDCOLOR
echo -e $RED"| /  \/ | ___  __ _ _ __   ___ _ __         "$ENDCOLOR
echo -e $RED"| |   | |/ _ \/ _  | '_ \ / _ \ '__|        "$ENDCOLOR
echo -e $RED"| \__/\ |  __/ (_| | | | |  __/ |           "$ENDCOLOR
echo -e $RED" \____/_|\___|\__,_|_| |_|\___|_|           "$ENDCOLOR
echo -e 
echo -e $YELLOW"=     This Script Made By : Mr Kara :')   ="$ENDCOLOR
                                                                                                                                                                                                                                         
OLDCONF=$(dpkg -l|grep "^rc"|awk '{print $2}')
CURKERNEL=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
LINUXPKG="linux-(image|headers|debian-modules|restricted-modules)"
METALINUXPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen)"
#OLDKERNELS=$(dpkg -l|awk '{print $2}'|grep -E $LINUXPKG |grep -vE $METALINUXPKG|grep -v $CURKERNEL)
YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"
 
if [ $USER != root ]; then
echo -e $RED"[Kali-cleaner]:Error: must be root"
echo -e $YELLOW"[Kali-cleaner]:Exiting..."$ENDCOLOR
exit 0
fi
 
echo -e $YELLOW"[Kali-cleaner]:Cleaning apt cache..."$ENDCOLOR
sudo aptitude clean
 
echo -e $YELLOW"[Kali-cleaner]:Removing old config files..."$ENDCOLOR
sudo aptitude purge $OLDCONF
 
echo -e $YELLOW"[Kali-cleaner]:Removing old kernels..."$ENDCOLOR
sudo aptitude purge $OLDKERNELS
 
echo -e $YELLOW"[Kali-cleaner]:Emptying every trashes..."$ENDCOLOR
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
 
echo -e $YELLOW"[Kali-cleaner]:Script Finished!"$ENDCOLOR
echo -e
echo -e $RED"Goodbye........."$ENDCOLOR

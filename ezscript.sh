#!/bin/bash

#################################
#
# ezScript By Sysdump
# 
# Makes Scrits Easyer to install
#################################

PREFIX=/usr/bin/

clear
echo -e "\033[31mCreated By: Sysdump \nVirsion 0.2\n\n\033[m"
if [ $UID -ne 0 ]
then
	echo "It is recommened you run this in root!"
	sleep 5
	fi

if [ $# -ne 1 ]
then
echo "Usage $0 <script>"
exit
fi

if [ ! -f /usr/bin/ezscript ]
	then
	echo "ezscript is not installed would you like to install it? (Y/N)"
	read install
        if [[ $install = Y || $install = y ]] ; then
			ezfile=$(basename $0 | sed 's/\.[^.]*$//')
			echo "Installing $0 to /usr/bin/$ezfile"
			cp -v $0 /usr/bin/ezscript
			echo "Making $ezfile Executable..."
			sleep 2
			chmod +x /usr/bin/ezscript
			sleep 1
			echo "Checking to see if file was successfully installed..."
			if [ -f /usr/bin/ezscript ]
			then
			echo -e "\033[32mezscript Successfully Installed!\033[m"
			sleep 2
			echo -e "\033[32mLaunching ezscript...\033[m"
			sleep 2
			clear
			ezscript $1
			exit 1
			else
			echo -e "\033[31m ezscript was not installed! \033[m"
			fi
		else
		echo "Alright ezscript will not be installed"
		sleep 5
	fi
fi


file=$(basename $1 | sed 's/\.[^.]*$//')
if [ -f /usr/bin/$file ] 
then
echo -e "\033[31mFile Already Exist Aborting...\033[m"
sleep 1
exit 1
fi

if [ -f $1 ]
then
echo -e "\033[31mAre you sure you want to install $1 ?(Y/N)\033[m"
else
echo -e "\033[31mNot A Valid File!\033[m"
fi

read installsb
if [[ $installsb = Y || $installsb = y ]]; then

echo "Installing $1 to /usr/bin/$file"
cp -v $1 /usr/bin/$file
sleep 2
echo -e "\033[31mMaking $file Executable...\033[m"
sleep 1
chmod +x /usr/bin/$file
echo -e "\033[31mChecking to see if $file was Installed Successfully\033[m"
if [ -f /usr/bin/$file ]
then
echo -e "\033[32m$file Installed Successfully!"
else
echo -e "\033[32mError During Installation $file Not Installed :(\033[m"
fi
fi

#!/bin/bash

# Variables that are taken when the script is executed:

date=$(date +%Y-%m-%d)
white='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
cyan='\033[0;36m'

# Variables that are taken with a human imput and a check for the directories existence, if the directory doesn't exit, the script will give a red message:

read -p "Type your name: " name
read -p "Type which directory you want to backup: " backupdir
	if [ ! -d $backupdir ]; then
		echo -e "${red}The selected directory doesn't exist, try again.${white}"
		exit 1
	fi
read -p "Type where you want the backup to be archived: " destination
	if [ ! -d $destination ]; then
		echo -e "${red}The selected directory doesn't exist.${white}"
		echo -ne "Would you want to create this directory? ${cyan}[y/n]${white}"
		read -s crtdir
		echo
			case "$crtdir" in
				y|Y) basename $destination | mkdir $destination 
					echo -e "${green}The directory has been succesfully created.${white}" ;;
				n|N) exit 0 ;;
				*) echo -e "${red}Unrecognized argument, try again${white}"
					exit 0;;
			esac
	fi

echo
echo -e "${cyan}Compressing the files...${white}"
echo

# The compressed backup is created and saved on the selected destination directory

filesbu=$(find "$backupdir" -type f | wc -l)
direcbu=$(find "$backupdir" -type d | wc -l)

tar -czf "${name}-${date}.tar.gz" "${backupdir}"
echo -e "${green}The backup has finished.${white}"
echo -e "${green}Backup disk usage is $(du -sh "${name}-${date}.tar.gz" | cut -f 1).${white}"
if [ $filesbu != 0 ]; then
	echo -e "${green}You have backed up $filesbu files.${white}"
fi
if [ $direcbu != 0 ]; then
	echo -e "${green}You have backed up $direcbu directories.${white}"
fi
mv "${name}-${date}.tar.gz" "${destination}"


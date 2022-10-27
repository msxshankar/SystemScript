#!/bin/bash                                                                                

# Program to update system packages
 
# Menu System
startMenu () {
cat <<- _EOF_
	A simple package update tool

	1. Upgrade packages
	2. Quit
	
_EOF_

read -p "Enter selection [1-2] > "
}

# Updates, upgrades and cleans pop os/ubuntu repos
apt_update () {
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get autoremove -y
	return	
}

pacman_update () {
	sudo pacman -Syu --noconfirm
	sudo pacman -Sc
	sudo pacman -R "$(pacman -Qdtq)"
}	
  
# Updates, upgrades and cleans flatpaks
flatpak_update () {
	flatpak update -y
	flatpak uninstall --unused
	return
}

# Updates and cleans nix pkgs
nixpkg_update () {
	nix-env -u
}

# Updates the pop-os recovery partition
popRecovery_update () {
	pop-upgrade recovery upgrade from-release
	return
}

# Updates the correct packages for the distro
updatePackages () {

	# Finds the distro name
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		OS=$NAME
	fi

	# Runs appropriate command for distro
	if [ "$NAME" = "Pop!_OS" ]; then
		apt_update
		
		# Asks user if they want to update pop-os recovery partition
		read -e -p "Do you want to upgrade the recovery partition? (y/n) " -i "n"
		
		if [ "$REPLY" = "y" ]; then
			popRecovery_update
		fi
	
	elif [ "$NAME" = "Arch Linux" ]; then
		pacman_update
	fi


	# Updates flatpak if installed
	if [ "$(which flatpak)" = /usr/bin/flatpak ]; then
		flatpak_update
	fi
}


# Starts menu system
condition=1
while [ "$condition" -eq 1 ]; do
	startMenu

	if [ "$REPLY" = 1 ]; then
		updatePackages
		exit 0
	elif [ "$REPLY" = 2 ]; then
		exit 0
	else 
		echo -e "Please try again\n"
		sleep 1
	fi
done

#!/bin/bash                                                                                                           

# Program to update system packages
 

# Updates, upgrades and cleans pop os/ubuntu repos
apt_update () {
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	return	
}
  

# Updates, upgrades and cleans flatpaks
flatpak_update () {
	flatpak update -y
	flatpak uninstall --unused
	return
}


# Updates the pop-os recovery partition
popRecovery_update () {
	pop-upgrade recovery upgrade from-release
	return
}

# Finds the distro name
if [ -f /etc/os-release ]; then
	. /etc/os-release
	OS=$NAME
fi

# Runs appropriate command for distro
if [ "$NAME" = "Pop!_OS" ]; then
	apt_update
	
	# Asks user if they want to update pop-os recovery partition
	read -p "Do you want to upgrade the recovery partition? (y/n) "
	
	if [ "$REPLY" = "y" ]; then
		popRecovery_update
	fi
fi

# Updates flatpak if installed
if [ "$(which flatpak)" = /usr/bin/flatpak ]; then
	flatpak_update
fi

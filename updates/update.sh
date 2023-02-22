#!/bin/bash                                                                                

# Program to update system packages
 
# Menu System
startMenu () {
cat <<- _EOF_
	A simple package update tool

	1. Upgrade all detected packages
	2. Choose packages to upgrade
	3. Quit
	
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

# Uses nala instead of apt
nala_update () {
  sudo nala upgrade -y
  sudo nala autoremove -y
  return
}

# Updates arch based systems
pacman_update () {
	sudo pacman -Syu --noconfirm
	sudo pacman -Sc
	sudo pacman -R "$(pacman -Qdtq)"
}

# Updates fedora based systems
dnf_update () {
  sudo dnf upgrade -y
}

# Updates, upgrades and cleans flatpaks
flatpak_update () {
	flatpak update -y
	flatpak uninstall --unused
	return
}

# Updates and cleans nix pkgs
nixpkg_update () {
  nix-channel --update -v
	nix-env -u -v
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
	if [ "$NAME" = "Pop!_OS" ] || [ "$NAME" = "Ubuntu" ] || [ "$NAME" = "Debian" ]; then
	  if [ -x "$(command -v nala)" ]; then
      nala_update
    else
      apt_update
    fi
  fi

  # Asks user if they want to update pop-os recovery partition
  if [ "$NAME" = "Pop!_OS" ]; then
		read -e -p "Do you want to upgrade the recovery partition? (y/n) " -i "n"
		
		if [ "$REPLY" = "y" ]; then
			popRecovery_update
		fi
  fi

  # Updates packages on arch based distros
	if [ "$NAME" = "Arch Linux" ]; then
		pacman_update
	fi

  # Updates packages on fedora based distros
  if [ "$NAME" = "Fedora" ]; then
   dnf_update
  fi

	# Updates flatpak if installed
	if [ -x "$(command -v flatpak)" ]; then
		flatpak_update
	fi

  # Updates nixpkgs if nix binary is installed
  if [ -x "$(command -v nix)" ]; then
    nixpkg_update
  fi
}

detect_packages () {
  echo "Detecting packages..."

  if [ -x "$(command -v nix)" ]; then
    echo "1 Nix"
  fi
  if [ -x "$(command -v flatpak)" ]; then
    echo "2 Flatpak"
  fi
  if [ -x "$(command -v pacman)" ]; then
    echo "3 Pacman"
  fi
  if [ -x "$(command -v dnf)" ]; then
    echo "4 Dnf"
  fi
  if [ -x "$(command -v apt)" ]; then
    echo "5 Apt"
  fi

  #read -p "Enter selection [1-2] > "

}

# Starts menu system
condition=1
while [ "$condition" -eq 1 ]; do
	startMenu

	if [ "$REPLY" = 1 ]; then
		updatePackages
		exit 0
	elif [ "$REPLY" = 2 ]; then
	  #updatePackages
	  detect_packages
		exit 0
	elif [ "$REPLY" = 3 ]; then
    exit 0
	else
		echo -e "Please try again\n"
		sleep 1
	fi
done

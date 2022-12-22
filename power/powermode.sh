#!/bin/bash

# Power management script for the Lenovo Ideapad 14ARE05 using ACPI

# Menu-System

startMenu () {
clear
cat <<- _EOF_
	Power Management Utility for the Lenovo Ideapad 14ARE05

	1. Change laptop performance power mode
	2. Change battery saver mode
	3. Change rapid charge mode
	4. Exit 
_EOF_
read -p "Enter selection [1-4] > "
}

powermodeMenu () {
clear
cat <<- _EOF_
	Power Managent Utility for the Lenovo Ideapad 14ARE05

	Choose performance mode:
	1. Battery mode
	2. Intelligent mode
	3. Extreme mode
	4. Go back
	5. Exit
_EOF_
read -p "Enter selection [1-5] > "
}

batterysaverMenu () {
clear
cat <<- _EOF_
	Power Managent Utility for the Lenovo Ideapad 14ARE05

	Turn battery saver mode on or off
	1. On (Caps battery at 60%)
	2. Off
	4. Go back
	5. Exit
_EOF_
read -p "Enter selection [1-5] > "
}

rapidchargeMenu () {
clear
cat <<- _EOF_
	Power Managent Utility for the Lenovo Ideapad 14ARE05

	Turn rapid charge mode on or off
	1. On (Charges more quickly but may wear out battery)
	2. Off
	4. Go back
	5. Exit
_EOF_
read -p "Enter selection [1-5] > "
}


VAR=1
DELAY=1

while [[ "$VAR" == 1 ]]; do

	startMenu

	# Validating user input
	if [[ "$REPLY" =~ ^[1-4]$ ]]; then

	  # Exits program
		if [[ "$REPLY" == 4 ]]; then
			echo "Exiting..."
			exit 1
		fi

    # Configures laptop power mode
		if [[ "$REPLY" == 1 ]];then
			powermodeMenu

		  if [[ $"REPLY" =~ ^[1-4]$ ]]; then
		    if [[ $"REPLY" =~ 1 ]]; then
          sudo modprobe acpi_call && echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x000FB001' | sudo tee /proc/acpi/call
        fi
      fi
		fi

		if [[ "$REPLY" == 2 ]];then
			batterysaverMenu
		fi

		if [[ "$REPLY" == 3 ]];then
			rapidchargeMenu
		fi
	else
		echo "Invalid entry. Try again."
		sleep "$DELAY"
	fi
done




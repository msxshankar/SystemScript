# SystemScript
A collection of useful scripts and programs for Linux computers.

## Introduction
When I first installed Linux, I was surprised at the amount of freedom I was given to modify how my computer worked. 
Along with the fact that my laptop wasn't well supported which prompted me to make custom scripts and programs. Hopefully, this repository will be useful to you too! :)

## General Install
Clone the repository and run the install script. This will put all scripts in the ~/.local/bin folder.
This will typically be in your path. If not, please add it using your .bashrc!
```
    git clone https://github.com/msxshankar/SystemScript
    chmod 755 install.sh 
    . install.sh
```

## bluetooth

### Explaination
A simple bluetooth program which runs in the terminal. Helps connect devices and spot issues that may not be visible in a GUI.

### How to install and run

Clone the repository and change directory to the bluetooth folder
```
   git clone https://github.com/msxshankar/SystemScript
   cd SystemScript/bluetooth
```

Make the program and run it
```
   make
   ./bluetooth
```
For now, the build system uses the Clang Compiler. GCC will be supported soon.

## power

### Explaination
Sets powermodes and tdp settings for the Lenovo Ideapad 14ARE05 laptop. Hopefully, I could expand this to other AMD laptops but for now I have only tested it on this device.

### How to install and run

Clone the repository and change directory to the power folder
```
   git clone https://github.com/msxshankar/SystemScript
   cd SystemScript/power
```

Make script executable
```
   chmod 755 powermode.sh
   chmod 755 tdp_adjust.sh
```

Run the script
```
   ./powermode.sh
   ./tdp_adjust.sh
```

Move to bin folder for easy access using your path (Optional)
```
   mv powermode.sh tdp_adjust ~/.local/bin
```

## update.sh

### Explaination
Updates system packages based on disto and package manager.
Supports the apt and pacman package managers

## How to install and run

Clone repository and change directory to the updates folder
```
git clone https://github.com/msxshankar/SystemScript
cd SystemScript/updates
```

Set script to executable:
```
chmod 755 update.sh
```

Run script:
```
./update.sh
```

Move to bin folder for easy access using your path (Optional)
```
   mv update.sh ~/.local/bin
```

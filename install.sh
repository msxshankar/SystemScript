#!/bin/bash

install () {
  chmod 755 updates/update.sh
  chmod 755 scripts/largefiles.sh
  chmod 755 power/powermode.sh
  chmod 755 power/tdp_adjust.sh

  mv updates/update.sh ~/.local/bin
  mv scripts/largefiles.sh ~/.local/bin
  mv power/powermode.sh ~/.local/bin
  mv power/tdp_adjust.sh ~/.local/bin
}

compile () {
  cd bluetooth/ && make all
  mv bluetooth ~/.local/bin
}

install
compile
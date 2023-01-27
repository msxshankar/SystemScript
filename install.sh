#!/bin/bash

install () {
  mv updates/update.sh ~/.local/bin
  mv scripts/largefiles.sh ~/.local/bin
  mv power/powermode.sh ~/.local/bin
  mv power/tdp_adjust.sh ~/.local/bin
}

compile () {
  cd bluetooth/ && make all
  mv bluetooth ~/.local/bin
}

compile
install
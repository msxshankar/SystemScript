#!/bin/bash

# Runs valgrind
valgrind () {
  command valgrind --leak-check=full \
                   ./bluetooth
}

valgrind
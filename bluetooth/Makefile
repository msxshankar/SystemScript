# Simple Makefile

# C Compiler flags
CC = clang
CFLAGS = -g -Wall

# Program
TARGETS = bluetooth
OBJECTS = bluetooth.o
MODULES = bluetooth.c
DEP = bluetooth.h

# Directories
BIN = bin

# Will run commands regardless of whether there exists files are named the same
.PHONY: all clean

# Looks for all targets below
all: ${TARGETS}

# Using static pattern rule and % wildcard which searches for target pattern
# $< holds the prerequisite file and $@ holds the target name
${TARGETS}: %: %.o
	${CC} ${CFLAGS} $< -o $@
	@echo "Static pattern rule compilation"
	
# $@ refers to target name
#bluetooth: bluetooth.h
#	${CC} ${CFLAGS} -o $@ ${MODULES}
#	@echo "Non-implicit compilation"

# Uses Make implicit rules
#bluetooth: bluetooth.o

# Allows dependencies to be included
#bluetooth.o: bluetooth.c bluetooth.h

# Suppresses rm error messages
# Could also just use the -f flag
clean:
	rm ${TARGETS} *.o

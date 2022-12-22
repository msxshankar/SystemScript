/* Program to connect bluetooth devices */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "bluetooth.h"

#define nonIntInput 1
#define badFileName 2

int main (int argc, char *argv[]) {

    /* Struct assignment */
    struct Menu menu = {.condition = 1};
    struct Menu *menu_ptr = &menu;

    struct File file = {.lines = 0};
    struct File *file_ptr = &file;

    if (argc == 1) {
        /* Main menu print out */
        printf("Connect your bluetooth devices\n");
        printf("1. Pair existing device\n");
        printf("2. Pair new device\n");
        printf("3. Exit\n");
        printf("Please enter your selection [1-3] > ");

        /* Takes in user input */
        if (!(scanf("%i", &menu_ptr->menuInput))) {
            exit(nonIntInput);
        }
    }

    else {
        char* endPtr;
        menu_ptr->menuInput = strtol(argv[1], &endPtr, 10);
    }

    /* Evalues user input */
	while (menu_ptr->condition) { 
		switch (menu_ptr->menuInput) {
			
			/* Pair existing device */
			case 1:
				menu_ptr->condition = 0;
				countLines(file_ptr);
				break;
			
			/* Pair new device */
			case 2:
				menu_ptr->condition = 0;
				newDevice();
				break;
			
			/* Exit */
			case 3:
				menu_ptr->condition = 0;
				exit(0);
			
			default:
				printf("Invalid input. Please try again [1-3] > ");
				scanf("%i", &menu_ptr->menuInput);
				break;
		}
	}
}

/* Counts number of devices in txt file */
int countLines (struct File *file_ptr) {
	FILE *openfile = fopen("devices.txt", "r");
	
	if (openfile == NULL) {
		exit(badFileName);
	}

	/* Read in file */
	while(fgets(file_ptr->buffer, 250, openfile) != NULL) {
		if (!(strlen(file_ptr->buffer) == 1)) {
			file_ptr->lines++;
		}
	}
	
	file_ptr->size = file_ptr->lines / 2;
	
	existingDevice(file_ptr);

	fclose(openfile);

	return file_ptr->size;
}


int existingDevice(struct File *file_ptr) {
	FILE *readfile = fopen("devices.txt", "r");
	
	/* Allocating memory for devices */
	char **deviceArray = malloc (file_ptr->lines * sizeof(char*));
	for (int i = 0; i < file_ptr->lines; i++) {
		deviceArray[i] = malloc (250 * sizeof(char));
	}
	
	/* Writing devices to memory */
	for (int k = 0; k < file_ptr->lines; k++) {
			fgets(deviceArray[k], 250, readfile);
	}
	
	/* Display devices from memory */

	int menuNumber = 1;
	printf("\nChoose device to connect to: \n");
	for (int l = 0; l < file_ptr->lines; l+=2) {
			printf("%i. %s", menuNumber, deviceArray[l]);
			menuNumber++;
	}
	printf("Enter number [1-%i] > ", menuNumber-1);

	int input;
	scanf("%i", &input); 

	/* Creates a string to pass to system() */
	char buf[500];
	int index = ((input*2)-2)+1;

	snprintf(buf, sizeof(buf), "bluetoothctl connect %s", deviceArray[index]);

	/* Creates new child process to call system() */
	if (fork() == 0) {
		int status = system(buf);
	}	

	/* Freeing memory */
	for (int freeCount = 0; freeCount < file_ptr->lines; freeCount++) {		
		free(deviceArray[freeCount]);
	}
	free(deviceArray);

	fclose(readfile);

	return 0;
}

int newDevice () {
//	FILE *fptr = fopen("devices.txt", "w");

	return 0;
}

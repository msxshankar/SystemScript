/* Function declarations */

int countLines();
int existingDevice ();
int newDevice ();


struct Menu {
	int menuInput;
	int condition;
};

struct File {
	int size;
	char buffer[250];
	int lines;
};

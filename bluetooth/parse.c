// Used to extract bluetooth device information from files
//
#include <stdio.h>
#include <stdlib.h>
#include <yaml.h>

#include "parse.h"

int main(int argc, char *argv[]) {
	
	// Parser
	yaml_parser_t parser;
	yaml_event_t event;

	int done;

	// Create parse object
	yalm_parser_initialize(&parser);
	
	// Input string
	char *input = "";
	size_t length = strlen(input);

	return 0;
}

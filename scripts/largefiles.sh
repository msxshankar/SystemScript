#WIP script to find large files

#!/bin/bash

search () {
	du --max-depth=1 -h
}

search

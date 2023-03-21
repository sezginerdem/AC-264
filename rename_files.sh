#!/bin/bash

# Check if directory exists
if [ ! -d "$1" ]
then
    echo "Error: Directory does not exist"
    exit 1
fi

# Check if directory readable
if [ ! -r "$1" ]
then
    echo "Error: Directory does not readable"
    exit 1
fi

# Check the numbers of arguments
if [ $# -ne 3 ]
then
 echo "This script runs with three argument as <directory> <prefix> <extension>"
 exit 1
fi

# Find all files with the specified extension and add prefix to their name
find "$1" -type f -name "*.$3" | while read file; do
    mv "$file" "$(dirname "$file")/$2$(basename "$file")"
done

echo "Files renamed successfully"
exit 0

#!/bin/bash

# Define the path to your .projects file
PROJECTS_FILE="/home/faezdwm/.projects"

# Check if the .projects file exists
if [ ! -f "$PROJECTS_FILE" ]; then
	echo "Error: .projects file not found."
	exit 1
fi

# Read each line in the .projects file
while IFS= read -r line; do
	# Extract the directory path and depth from the line
	path=$(echo "$line" | awk '{print $1}')
	depth=$(echo "$line" | grep -oP -- "--depth \K\d+")

	# Use 'find' to list directories up to the specified depth
	directories=$(find "$path" -type d -maxdepth "$depth" 2>/dev/null)

	# If directories are found, add them to the list
	if [ -n "$directories" ]; then
		all_directories="${all_directories}${directories}\n"
	fi
done <"$PROJECTS_FILE"

# Use 'fzf' to select a directory interactively
selected_directory=$(echo -e "$all_directories" | fzf --preview "tree -d {}")

# Change to the selected directory
if [ -n "$selected_directory" ]; then
	echo "$selected_directory" || exit 1
fi

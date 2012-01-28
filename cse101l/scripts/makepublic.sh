#!/bin/bash
# Create and chmod ~/public_html for the current user
# 
# Ross Nelson <rnelson@cse.unl.edu>

# Get the current date
DATE=$(date +%y%m%d%H%M%S)

if [ ! -d ~/public_html ]; then
	if [ -e ~/public_html ]; then
		echo "You have a 'public_html', but it isn't a directory"
		echo "I will move it to 'public_html.$DATE'"
		mv ~/public_html ~/public_html.$DATE
	fi
	
	echo "You do not have a 'public_html' directory"
	mkdir ~/public_html
	echo "Created 'public_html' directory"
fi

echo "Setting 'public_html' directory to be world-readable"
chmod 755 ~/public_html
echo "Done"
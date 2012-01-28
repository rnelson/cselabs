#!/bin/bash
# Copies the files from lab1 to public_html and updates 101nav.html
# 
# Ross Nelson <rnelson@cse.unl.edu>

if [ ! -d ~/public_html ]; then
	echo "Your 'public_html' is broken. Please run ~rnelson/bin/makepublic.sh"
else
	if [ ! -d ~/class/cse101/lab1 ]; then
		if [ ! -d ~/class/cse101 ]; then
			echo "Error: you do not have a 'cse101' folder"
		elif [ ! -d ~/class ]; then
			echo "Error: you do not have a 'class' folder"
		else
			echo "Error: you do not have a 'lab1' folder"
		fi
	else
		if [ ! -d ~/public_html/cse101 ]; then
			echo "Creating cse101 in pub html"
			mkdir ~/public_html/cse101
			chmod -R a+r ~/public_html/cse101
			echo "Made cse101 world readable"
		fi
		
		echo "Creating folder for lab1"
		mkdir ~/public_html/cse101/lab1
		echo "Created folder for lab1, copying files"
		cp -R ~/class/cse101/lab1/* ~/public_html/cse101/lab1
		echo "Copied files, changing permissions"
		chmod -R a+r ~/public_html/cse101/lab1
		
		echo ""
		echo "Done! Visit http://cse.unl.edu/~$USER/cse101/lab1/"
	fi
fi

#!/bin/sh

# Kill the database if it exists already
if [ -x blog.sq3 ]; then
	rm blog.sq3
fi

# Set up the db file
python makeblog.py

# Make it fully accessible by apache
chmod a+rwx blog.sq3

# Make the current dir writable too
chmod a+w .
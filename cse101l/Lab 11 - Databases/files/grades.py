#!/usr/bin/env python
import sys

command = sys.argv[len(sys.argv) - 1]

def usage():
	"""Display usage information if the user ran the program incorrectly"""
	print 'usage: grade.py --create      Create tables'
	print '       grade.py --data        Populate the database'
	print '       grade.py --print       Print the data'

def work():
	"""Do the actual work"""
	if command == '--create':
		# Step 1
		pass
	elif command == '--data':
		# Step 2
		pass
	elif command == '--print':
		# Step 3
		pass
	else:
		usage()

# The main program
work()
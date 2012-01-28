#!/usr/bin/env python
import sys

if len(sys.argv) != 2:
	print("usage: tree.py <n>")
	sys.exit()

treesize = int(sys.argv[1]) + 1

for i in range(1, treesize):
	spaces = treesize - i
	
	for j in range(1, spaces):
		sys.stdout.write(' ')
	
	for k in range(spaces, treesize):
		sys.stdout.write('T')
	
	sys.stdout.write('\n')

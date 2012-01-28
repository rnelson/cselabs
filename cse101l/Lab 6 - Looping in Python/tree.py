#!/usr/bin/env python
import sys

if len(sys.argv) != 2:
	print("usage: tree.py <n>")
	sys.exit()

treesize = int(sys.argv[1])
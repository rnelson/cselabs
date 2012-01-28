#!/usr/bin/env python
# Ross Nelson <rnelson@cse>
# $Id$

import sys

source = open(str(sys.argv[1]), "r")
destination = open(str(sys.argv[2]), "w")

for line in source:
	destination.write(line)

source.close()
destination.close()
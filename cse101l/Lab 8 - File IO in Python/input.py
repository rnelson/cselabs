#!/usr/bin/env python
# Ross Nelson <rnelson@cse>
# $Id$

import sys

file = open("/home/grad/rnelson/class/cse101/lab8/input.dat", "r")
sum = 0
count = 0

for line in file:
	sum = sum + float(line)
	count = count + 1

average = sum / count

print "The sum is ", sum
print "The average is ", average

file.close()
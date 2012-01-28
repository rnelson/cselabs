#!/usr/bin/env python
# $Id: client.py 148 2009-03-25 18:25:04Z rnelson $

from socket import socket, AF_INET, SOCK_DGRAM
import sys

user = ""
host = ""
port = ""

# Set up the local connection
s = socket(AF_INET, SOCK_DGRAM)
s.bind(('127.0.0.1', 0))

# Get the connection info from the command line
if len(sys.argv) < 3:
	print 'usage: client.py <host> <port> <username>'
	exit(1)
else:
	host = sys.argv[1]
	port = int(sys.argv[2])
	user = sys.argv[3]

# Connect to the server
server = (host, port)

# Get a chat message
input = raw_input('> ')

while input.upper() != 'QUIT':
	# Connect
	s = socket(AF_INET, SOCK_DGRAM)
	s.bind(('', 0))
	
	# Send the message
	data = '<' + user + '> ' + input
	s.sendto(data, server)
	
	# Get the next message
	input = raw_input('> ')
#!/usr/bin/env python
# $Id: client.py 148 2009-03-25 18:25:04Z rnelson $

from socket import socket, AF_INET, SOCK_DGRAM

s = socket(AF_INET, SOCK_DGRAM)
s.bind(('127.0.0.1', 0))

server = ('127.0.0.1', 11111)
s.sendto("Any old string here", server)

data, addr = s.recvfrom(1024)
print "received", data, "from", addr

s.close()
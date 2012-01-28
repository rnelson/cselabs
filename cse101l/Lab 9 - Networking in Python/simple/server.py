#!/usr/bin/env python
# $Id: server.py 148 2009-03-25 18:25:04Z rnelson $

from socket import socket, AF_INET, SOCK_DGRAM

s = socket(AF_INET, SOCK_DGRAM)
s.bind(('127.0.0.1', 11111))

while True:
    data, addr = s.recvfrom(1024)
    print "Connection from", addr
    s.sendto(data.upper(), addr)
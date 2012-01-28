#!/usr/bin/env python
# $Id: server.py 148 2009-03-25 18:25:04Z rnelson $

import SocketServer
import sys

badwords = [ ]

if len(sys.argv) < 2:
	print 'usage: server.py <port>'
	exit(1)

class ChatHandler(SocketServer.BaseRequestHandler):
	def handle(self):
		remote = self.client_address
		data, sock = self.request
		
		bad = False
		for badword in badwords:
			#if data.find(badword):
			if badword in data:
				bad = True
				break
		
		if not bad:
			print data

myaddr = ('127.0.0.1', int(sys.argv[1]))
myserver = SocketServer.UDPServer(myaddr, ChatHandler)
myserver.serve_forever()

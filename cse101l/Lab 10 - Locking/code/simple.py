from threading import Thread

class MyThread(Thread):
	def run(self):
		print "I'm a thread!"

t = MyThread()
t.start()
from threading import Thread, Lock

lock = Lock()

class MyThread(Thread):
	def run(self):
		print "I'm a thread!"
		
		lock.acquire()
		print "I'm a thread that has the lock!"
		lock.release()
		
		print "I'm still a thread!"

t = MyThread()
t.start()
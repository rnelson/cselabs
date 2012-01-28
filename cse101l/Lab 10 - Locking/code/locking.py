from threading import Thread, Lock
import time

lock = Lock()
threadCounter = 1

class MyThread(Thread):
	def run(self):
		global threadCounter
		threadId = threadCounter
		threadCounter = threadCounter + 1
		
		print 'Hello from thread ' + str(threadId)
		
		lock.acquire()
		time.sleep(1)
		lock.release()
		
		print 'Good bye from thread ' + str(threadId)

for x in xrange(6):
	MyThread().start()

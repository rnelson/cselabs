from threading import Thread, Lock
import time
import random
import sys

lock = Lock()
threadCounter = 1
value = -1
threadCount = int(sys.argv[1])

class MyThread(Thread):
	def run(self):
		# Get the thread's ID
		global threadCounter
		threadId = threadCounter
		threadCounter = threadCounter + 1
		
		# Decide on a time to sleep
		sleeptime = 10 * random.random()
		print 'Thread ' + str(threadId) + ' will sleep for ' + str(sleeptime) + ' seconds'
		
		# Sleep then get the lock
		time.sleep(sleeptime)
		lock.acquire()
		global value
		value = threadId
		lock.release()

# Start threads
for x in xrange(threadCount):
	MyThread().start()

#time.sleep(3)
#print 'The value is ' + str(value)

# Print out the result
time.sleep(10*threadCount)
lock.acquire()
print 'The value is ' + str(value)
lock.release()
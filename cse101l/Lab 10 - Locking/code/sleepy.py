#!/usr/bin/env python

import time
import thread

def myfunction(string,sleeptime,lock,*args):
	while 1:
		#entering critical section
		lock.acquire() 
		print string,"now sleeping after lock acquired for",sleeptime
		time.sleep(sleeptime) 
		print string,"now releasing lock and then sleeping again"
		lock.release()
		#exiting critical section
        
		time.sleep(sleeptime) # why?

if __name__=="__main__":
	sleeptime = 0.5
	lock=thread.allocate_lock()
	thread.start_new_thread(myfunction,("Thread-1", sleeptime, lock))
	thread.start_new_thread(myfunction,("Thread-2", sleeptime, lock))

	while 1:pass
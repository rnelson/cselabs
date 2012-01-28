#!/usr/bin/env python
import sqlite3 as dbapi
import sys

command = sys.argv[len(sys.argv) - 1]

def usage():
	"""Display usage information if the user ran the program incorrectly"""
	print 'usage: grade.py --create      Create tables'
	print '       grade.py --data        Populate the database'
	print '       grade.py --print       Print the data'

def work():
	"""Do the actual work"""
	conn = dbapi.connect('rnelson.db')
	cur = conn.cursor()
	
	if command == '--create':
		# Create the three tables
		cur.execute('CREATE TABLE grades (student INTEGER, assignment INTEGER, grade REAL, comments TEXT)')
		cur.execute('CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT)')
		cur.execute('CREATE TABLE assignments (id INTEGER PRIMARY KEY, max_score REAL, name TEXT, comments TEXT)')
		
		# Save our changes
		conn.commit()
		
	elif command == '--dump':
		cur.execute('SELECT id, name FROM students')
		students = cur.fetchall()
		
		for i in xrange(len(students)):
			id = students[i][0]
			name = students[i][1]
			
			print str(id) + ' -> ' + str(name)
		
	elif command == '--data':
		# Add in the data
		cur.execute('INSERT INTO students (name) VALUES ("Ross Nelson")')
		cur.execute('INSERT INTO students (name) VALUES ("Alex Harvey")')
		cur.execute('INSERT INTO students (name) VALUES ("Suzie Shorey")')
		cur.execute('INSERT INTO students (name) VALUES ("Jen Shin")')
		cur.execute('INSERT INTO students (name) VALUES ("Travis Munson")')
		
		cur.execute('INSERT INTO assignments (max_score, name) VALUES (20, "Lab 1")')
		cur.execute('INSERT INTO assignments (max_score, name) VALUES (20, "Lab 2")')
		cur.execute('INSERT INTO assignments (max_score, name) VALUES (30, "Lab 3")')
		cur.execute('INSERT INTO assignments (max_score, name) VALUES (10, "Quiz 1")')
		cur.execute('INSERT INTO assignments (max_score, name) VALUES (45, "Test 1")')
		cur.execute('INSERT INTO assignments (max_score, name) VALUES (60, "Final")')
		
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (1, 1, 20)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (1, 2, 20)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (1, 3, 30)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (1, 4, 10)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (1, 5, 45)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (1, 6, 60)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (2, 1, 19)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (2, 2, 20)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (2, 3, 30)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (2, 4, 10)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (2, 5, 43)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (2, 6, 54)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (3, 1,  3)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (3, 2, 15)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (3, 3, 16)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (3, 4,  6)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (3, 5, 32)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (3, 6, 47)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (4, 1, 20)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (4, 2, 19)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (4, 3, 29)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (4, 4,  8)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (4, 5, 44)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (4, 6, 56)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (5, 1, 18)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (5, 2, 18)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (5, 3, 29)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (5, 4,  9)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (5, 5, 45)')
		cur.execute('INSERT INTO grades (student, assignment, grade) VALUES (5, 6, 60)')
		
		conn.commit()
		
	elif command == '--print':
		# Get all students and assignments
		cur.execute('SELECT id, name FROM students')
		students = cur.fetchall()
		
		cur.execute('SELECT id, name, max_score FROM assignments')
		assignments = cur.fetchall()
		
		# For all students...
		for i in xrange(len(students)):
			student_id = students[i][0]
			student_name = students[i][1]
			
			print student_name + ':'
			
			# For all assignments...
			for j in xrange(len(assignments)):
				assignment_id = assignments[j][0]
				assignment_name = assignments[j][1]
				assignment_max = assignments[j][2]
				
				# Get this student's grade for this assignment
				cur.execute('SELECT grade FROM grades WHERE student=' + str(student_id) + ' AND assignment=' + str(assignment_id))
				res = cur.fetchall()
				
				if len(res) > 0:
					# Get the grade
					grade = res[0][0]
					
					# Print out the grade
					print '   ' + assignment_name + ' => ' + str(grade) + '/' + str(assignment_max)
		
	else:
		usage()
		
# The main program
work()

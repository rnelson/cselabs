program wk15amain
	use week15a
	implicit none
	
	! Create some variables
	type(point) :: a, b
	type(line) :: l
	real :: d
	
	! Set up the points
	a%x = 5
	a%y = 1
	b%x = 4
	b%y = 17
	
	! Get the distance between the points
	d = distance(a, b)
	
	! Make a line
	l = getline(a, b)
	
	100 format (A, I3, A, I3, A, I3, A, I3, A, F6.2, A, F7.2, A, /)
	
	! Print the results!
	print '(A)', "Test 1"
	print '(A)', "------"
	print '(A, F6.2, A)', "The line length is", d, "."
	print '(A, F6.2, A, F7.2, A)', "The y-intercept is", l%b, " and the slope is", l%m, "."
	print 100, "(p, p, m, b) = ((", l%p1%x, ", ", l%p1%y, "), (", l%p2%x, ", ", l%p2%y, "), ", l%m, ", ", l%b, ")"
	
	! Test 2
	a%x = 4
	a%y = 17
	b%x = 5
	b%y = 1
	d = distance(a, b)
	l = getline(a, b)
	print '(A)', "Test 2"
	print '(A)', "------"
	print '(A, F6.2, A)', "The line length is", d, "."
	print '(A, F6.2, A, F7.2, A)', "The y-intercept is", l%b, " and the slope is", l%m, "."
	print 100, "(p, p, m, b) = ((", l%p1%x, ", ", l%p1%y, "), (", l%p2%x, ", ", l%p2%y, "), ", l%m, ", ", l%b, ")"
	
	! Test 3
	a%x = 4
	a%y = 17
	b%x = -5
	b%y = -1
	d = distance(a, b)
	l = getline(a, b)
	print '(A)', "Test 3"
	print '(A)', "------"
	print '(A, F6.2, A)', "The line length is", d, "."
	print '(A, F6.2, A, F5.2, A)', "The y-intercept is", l%b, " and the slope is", l%m, "."
	print 100, "(p, p, m, b) = ((", l%p1%x, ", ", l%p1%y, "), (", l%p2%x, ", ", l%p2%y, "), ", l%m, ", ", l%b, ")"
end program wk15amain

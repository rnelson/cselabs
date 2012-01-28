program wk15B	
	! Variables
	integer, parameter :: f = 10
	integer :: count = 0, sum = 0, i, smallest, largest
	real :: avg
	
	! Open the file
	open(unit=f, status='OLD', file='/home/grad/Classes_102/cse150efl/files/week15-b.txt')
	
	! Read the first value
	read(f, *) i
	
	! Update the counter and the sum
	count = count + 1
	sum = sum + i
	
	! Set it to both smallest and largest
	smallest = i
	largest = i
	
	! Keep going
	do while (i /= 0)
		read(f, *) i
		
		! Stop if we read in 0
		if (i == 0) exit
		
		! Update smallest/largest if needed
		if (i < smallest) smallest = i
		if (i > largest) largest = i
		
		! Update count/sum
		count = count + 1
		sum = sum + i
	end do
	
	! Compute the average
	avg = real(sum) / real(count)
	
	! Print the values
	write (*, *) smallest
	write (*, *) largest
	write (*, *) sum
	write (*, *) avg
end program wk15b

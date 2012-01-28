program week4ex1
	implicit none
	integer :: startVal, stopVal, incVal
	integer :: i
	
	! Get the values from the user
	write (*, *) "Enter start value:"
	read (*, *) startVal
	
	write (*, *) "Enter stop value:"
	read (*, *) stopVal
	
	write (*, *) "Enter increment value:"
	read (*, *) incVal
	
	! Loop
	do i = startVal, stopVal, incVal
		write (*, *) i
	end do
end program week4ex1

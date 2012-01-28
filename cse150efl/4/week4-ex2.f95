program week4ex2
	implicit none
	integer :: startVal, stopVal, incVal
	integer :: i
	character :: ans
	
	ans = 'Y'
	do while (ans == 'Y' .or. ans == 'y')
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
		
		! See if the user wants to run the program again
		write (*, *) "Go again?"
		read (*, *) ans
	end do
end program week4ex2

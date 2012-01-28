program week3ex2
	implicit none
	real, parameter :: PI = 3.14
	real :: radius, height, volume
	
	write (*, *) 'Enter radius:'
	read (*, *) radius
	if (radius < 0) then
		write (*, *) 'Error: radius must be > 0'
		stop
	end if
	
	write (*, *) 'Enter height:'
	read (*, *) height
	if (height < 0) then
		write (*, *) 'Error: height must be > 0'
		stop
	end if
	
	volume = 1./3. * PI * radius * radius * height
	write (*, *) 'The volume is:', volume
end program week3ex2
program week3ex1
	implicit none
	real :: length, width, height, volume
	
	write (*, *) 'Enter length:'
	read (*, *) length
	if (length < 0) then
		write (*, *) 'Error: length must be > 0'
		stop
	end if
	
	write (*, *) 'Enter width:'
	read (*, *) width
	if (width < 0) then
		write (*, *) 'Error: width must be > 0'
		stop
	end if
	
	write (*, *) 'Enter height:'
	read (*, *) height
	if (height < 0) then
		write (*, *) 'Error: height must be > 0'
		stop
	end if
	
	volume = length * width * height
	write (*, *) 'The volume is:', volume
end program week3ex1
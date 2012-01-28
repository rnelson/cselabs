program week6
	implicit none
	integer, parameter :: RUNIT = 10
	integer, parameter :: WUNIT = 11
	integer :: iosr, count, number, sum, i
	
	! Open the input file
	open(unit=RUNIT, file="/home/grad/Classes_102/cse150efl/files/wk6in.txt", iostat=iosr, status="OLD")
	if (iosr /= 0) then
		write (*, *) "Error: unable to open wk6in.txt"
		stop
	end if
	
	! Open the output file
	open(unit=WUNIT, file="wk6out.txt", iostat=iosr, status="REPLACE")
	if (iosr /= 0) then
		write (*, *) "Error: unable to open wk6out.txt"
		stop
	end if
	
	! Read the input count
	read (RUNIT, *) count
	
	! Read in the numbers, adding to the sum as we go
	sum = 0
	do i = 1, count
		read (RUNIT, *) number
		sum = sum + number
	end do
	
	! Write the sum and average to the output file
	write (WUNIT, *) sum
	write (WUNIT, *) (sum / count)
	
	close(RUNIT)
	close(WUNIT)
end program week6
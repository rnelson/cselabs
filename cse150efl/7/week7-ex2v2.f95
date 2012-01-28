program week7ex2
	implicit none
	integer, parameter :: infile = 10
	integer, dimension(10, 10) :: m
	integer :: stat, i, j
	
	open(unit=infile, status="OLD", file="/home/grad/Classes_102/cse150efl/files/wk7in.txt", iostat=stat)
	if (stat /= 0) then
		write (*, *) 'Error: unable to open wk7in.txt'
		stop
	end if
	
	read (infile, *) m
	
	100 format (9(10I4, /), 10I4)
	write (*, 100) m
end program

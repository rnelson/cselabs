program week7ex1
	implicit none
	integer :: i, j, sum
	integer, dimension(30) :: data
	integer, dimension(5, 6) :: matrix = 0
	integer, dimension(6, 5) :: imatrix = 0
	
	data = (/ 18,   4,  32,  19,   0,   6, &
	          22,  34,   5,   4,   1, 108, &
	          24,  15,   3,  -5,  13,   7, &
	           2,  64,  84,  21,  99,   6, &
	          16,  57,   9,   0,   0,  13 /) 
	matrix = reshape(data, (/5,6/))
	
	sum = 0
	do i = 1, 5
		do j = 1, 6
			sum = sum + matrix(i, j)
		end do
	end do
	
	write (*, *) sum
	
	100 format (5(6(I5), /))
	200 format (6(5(I5), /))
end program

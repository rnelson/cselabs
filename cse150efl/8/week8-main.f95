PROGRAM week8main
	USE bsort
	IMPLICIT NONE
	INTEGER, DIMENSION(10) :: array = (/ 8, 36, 13, 74, 16, 42, 36, 84, -7, 0 /)
	
	100 FORMAT (A, 9(I3, ', '), I3)
	
	WRITE (*, 100) 'Unsorted: ', array
	CALL bubblesort(array, 10)
	WRITE (*, 100) 'Sorted:   ', array
END PROGRAM week8main
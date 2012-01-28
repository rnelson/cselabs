module week15a
implicit none
	type :: point
		integer :: x
		integer :: y
	end type point

	type :: line
		real :: b
		real :: m
		type (point) :: p1
		type (point) :: p2
	end type line
contains
	real function distance(pt1, pt2)
		implicit none
		
		type (point), intent(in) :: pt1, pt2
		real :: x1, y1, x2, y2
		
		x1 = real(pt1%x)
		y1 = real(pt1%y)
		x2 = real(pt2%x)
		y2 = real(pt2%y)
		
		distance = ((x2 - x1)**2 + (y2 - y1)**2)**0.5
	end function distance
	
	type (line) function getline(pt1, pt2)
		implicit none
		
		type (point), intent(in) :: pt1, pt2
		real :: x1, y1, x2, y2
		
		x1 = real(pt1%x)
		y1 = real(pt1%y)
		x2 = real(pt2%x)
		y2 = real(pt2%y)
		
		getline%m = (y2 - y1) / (x2 - x1)
		getline%b = y1 - getline%m * x1
		getline%p1%x = pt1%x
		getline%p1%y = pt1%y
		getline%p2%x = pt2%x
		getline%p2%y = pt2%y
	end function getline
end module week15a

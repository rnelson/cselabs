module bsort
	contains
		subroutine bubblesort(array, size)
			implicit none
			integer, intent(in) :: size
			integer, intent(inout), dimension(size) :: array
			integer :: temp, i
			logical :: swapped
			
			swapped = .true.
			do while (swapped .eqv. .true.)
				swapped = .false.
				
				do i = 1, size - 1
					if (array(i) > array(i+1)) then
						temp = array(i)
						array(i) = array(i+1)
						array(i+1) = temp
						swapped = .true.
					end if
				end do
			end do
		end subroutine bubblesort
end module bsort
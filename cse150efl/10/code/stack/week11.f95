module liststack
	type :: stack
		type(node), pointer :: bottom
		type(node), pointer :: top
	end type stack
	
	type :: node
		type(node), pointer :: next
		integer :: value
	end type node
contains
	subroutine init(st)
		type(stack), intent(inout) :: st
		nullify(st%bottom, st%top)
	end subroutine init
	
	subroutine destroy(st)
		type(stack), intent(inout) :: st
		type(node), pointer :: cur, next
		
		cur => st%bottom
		do while (associated(cur))
			next => cur%next
			nullify(cur%next)
			deallocate(cur)
			cur => next
		end do
	end subroutine destroy
	
	subroutine push(st, val)
		type(stack), intent(inout) :: st
		integer, intent(in) :: val
		type(node), pointer :: n
		
		! Create the new node
		allocate(n)
		nullify(n%next)
		n%value = val
		
		! Add the node
		if (associated(st%top)) then
			st%top%next => n
			st%top => n
		else
			st%bottom => n
			st%top => n
		end if
	end subroutine push
	
	integer function pop(st)
		type(stack), intent(inout) :: st
		type(node), pointer :: newTop
		
		! Set newTop to the item one below the top
		newTop => st%bottom
		do while (associated(newTop%next%next))
			newTop => newTop%next
		end do
		
		! Set the return value
		pop = newTop%next%value
		
		! Pop the top object
		nullify(st%top%next)
		deallocate(st%top)
		nullify(newTop%next)
		st%top => newTop
	end function pop
	
	integer function peek(st)
		type(stack), intent(in) :: st
		peek = st%top%value
	end function peek
end module liststack
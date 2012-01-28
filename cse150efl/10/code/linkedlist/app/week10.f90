module week10	
	type :: list
		type(node), pointer :: head
		type(node), pointer :: tail
	end type list
	
	type :: node
		type(node), pointer :: next
		character(len=25) :: name
		character(len=50) :: value
	end type node
contains
	subroutine init(l)
		type(list), intent(inout) :: l
		
		nullify(l%head, l%tail)
	end subroutine init
	
	subroutine addNode(l, name, value)
		type(list), intent(inout) :: l
		character(len=*), intent(in) :: name   ! len <= 25
		character(len=*), intent(in) :: value  ! len <= 50
		type(node), pointer :: n
		integer :: status
		
		! Allocate the new node
		allocate(n, stat=status)
		if (stat < 0) then
			write (*, '(A)') 'Error allocating new node. Terminating.'
		end if
		
		! Set the node's properties
		nullify(n%next)
		n%name = name
		n%value = value
		
		! Add it to the list
		if (.not. associated(l%head)) then
			! Empty list
			l%head => n
			l%tail => n
		else
			! Non-empty list, append
			l%tail%next => n
			l%tail => n
		end if
	end subroutine addNode
	
	subroutine destroy(l)
		type(list), intent(inout) :: l
		type(node), pointer :: cur
		type(node), pointer :: next
		
		if (associated(l%head)) then
			cur => l%head
			next => cur%next
			
			do while (associated(next))
				deallocate(cur)
				cur => next
				next => cur%next
			end do
		end if
	end subroutine destroy
	
	character(len=500) function getString(l)
		type(list), intent(in) :: l
		type(node), pointer :: cur
		character(len=50) :: name, value
		
		! Start with nothing
		getString = ""
		
		! Now go through the all of the nodes and add them
		cur => l%head
		do while (associated(cur))			
			! Add this node's values to the string
			getString = trim(getString) // trim(cur%name) // '=' // trim(cur%value) // '&'
			
			! Move on
			cur => cur%next
		end do
	end function getString
end module week10

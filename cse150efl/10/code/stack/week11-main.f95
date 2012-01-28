program week11main
	use liststack
	implicit none
	type(stack) :: st
	integer :: v1 = 42, v2 = 84, v3 = 24, v4
	logical :: verbose = .false.
	logical :: printList = .false.
	character(len=2) :: argument
	!node
	
	if (iargc() >= 1) then
		call getarg(1, argument)
		if (lle(argument, "-v") .and. lge(argument, "-v")) verbose = .true.
		!if (lle(argument, "-p") .and. lge(argument, "-p")) printList = .true.
	end if
	
	!if (printList) verbose = .false.
	
	! Initialize the stack
	call init(st)
	
	! Add Some values to the stack
	if (verbose) write (*, *) 'pushing 0'
	call push(st, 0)
	if (verbose) write (*, *) 'pushing 42'
	call push(st, v1)
	if (verbose) write (*, *) 'pushing 42'
	call push(st, v1)
	if (verbose) write (*, *) 'pushing 24'
	call push(st, v3)
	if (verbose) write (*, *) 'pushing -800'
	call push(st, -800)
	
	!if (printList) then
	!	write (*, '(A)') 'Stack Contents'
	!	write (*, '(A)') '--------------'
	!	
	!	
	!	
	!	stop
	!end if
	
	! Look at the top value
	if (verbose) write (*, *) 'peeking'
	write (*, '("The top of the stack contains ", I4)') peek(st)
	
	! Pop a few items
	if (verbose) write (*, *) 'popping the -800'
	v4 = pop(st)
	if (verbose) write (*, *) 'popping the 24'
	v4 = pop(st)
	write (*, '("The last item taken from the stack was ", I2)') v4
	
	! Look at the top value
	if (verbose) write (*, *) 'peeking, should be 42'
	write (*, '("The top of the stack contains ", I2)') peek(st)
	
	! Pop!
	if (verbose) write (*, *) 'popping the 42'
	write (*, '("The last item taken from the stack was ", I2)') pop(st)
	
	! Deallocate the entire stack
	if (verbose) write (*, *) 'destroying the stack'
	call destroy(st)
	
	if (verbose) write (*, *) 'done'
end program week11main

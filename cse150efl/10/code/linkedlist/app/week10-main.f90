! cc -c -o week10-curl.o `curl-config --cflags` week10-curl.c
! f90 -c -o week10-main.o week10-main.f90
! f90 -c -o week10.o week10.main
! f90 -o week10 `curl-config --libs` week10-curl.o week10.o week10-main.o

program week10main
	use week10
	implicit none
	character(len=46), parameter :: rootUrl = "http://cse.unl.edu/~cse150efl/query/query.php?"
	character(len=50) :: first, last, user, query
	type(list) :: getList
	integer :: i
	character(len=2) :: vOpt
	logical :: verbose = .false.
	logical :: printList = .false.
	type(node), pointer :: p
	
	50 format ('% Information: ', A)
	51 format ('% Information: ', A, X, A)
	52 format (A)
	
	! Function declarations
	character(len=50) :: getFirstName, getLastName, getQuery, htmlenc
	
	! Deal with command line arguments
	if (iargc() == 1) then
		do i = 0, iargc()
			call getarg(i, vOpt)
			
			if ( (LLE(vOpt, "-v") .and. LGE(vOpt, "-v")) .or. (LLE(vOpt, "-v") .and. LGE(vOpt, "-v")) ) then
				verbose = .true.
			end if
			
			if ( (LLE(vOpt, "-p") .and. LGE(vOpt, "-p")) .or. (LLE(vOpt, "-p") .and. LGE(vOpt, "-p")) ) then
				printList = .true.
			end if
		end do
	end if
	
	! Get all of the variables we'll be shoving into the request
	first = getFirstName("Enter first name: ")
	last =   getLastName("Enter last name:  ")
	call get_environment_variable("USER", user)
	query =     getQuery("Enter query:      ")
	
	! Initialize the linked list
	if (verbose) write (*, 50) 'initializing linked list'
	call init(getList)
	
	! Add the query information to the list
	if (verbose) write (*, 50) 'adding type:google to list'
	call addNode(getList, 'type', 'google')
	if (verbose) write (*, 50) 'adding firstName to list'
	call addNode(getList, 'firstName', first)
	if (verbose) write (*, 50) 'adding lastName to list'
	call addNode(getList, 'lastName', last)
	if (verbose) write (*, 50) 'adding username to list'
	call addNode(getList, 'username', user)
	if (verbose) write (*, 50) 'adding query to list'
	call addNode(getList, 'query', htmlenc(query))
	
	if (printList) then
		p => getList%head
		
		do while (associated(p))
			write (*, '(A, A, A, A)') '> Node: ', trim(p%name), ':', trim(p%value)
			p => p%next
		end do
		
		stop
	end if
	
	if (verbose) write (*, 51) 'url:', rootUrl // trim(getString(getList)) // char(0)
	
	! Send the query to the webservice
	if (verbose) write (*, 50) 'sending query to server'
	if (verbose) write (*, 52) ' '
	if (verbose) write (*, 52) ' '
	call send_query(rootUrl // getString(getList) // char(0))
	if (verbose) write (*, 52) ' '
	if (verbose) write (*, 52) ' '
	
	! Cleanup!
	if (verbose) write (*, 50) 'calling destroy()'
	call destroy(getList)
end program week10main

character(len=50) function getFirstName(prompt)
	character(len=*), intent(in) :: prompt
	write (*, '(A)') trim(prompt)
	read (*, *) getFirstName
end function getFirstName

character(len=50) function getLastName(prompt)
	character(len=*), intent(in) :: prompt
	write (*, '(A)') trim(prompt)
	read (*, *) getLastName
end function getLastName

character(len=50) function getQuery(prompt)
	character(len=*), intent(in) :: prompt
	write (*, '(A)') trim(prompt)
	read (*, '(A)') getQuery
end function getQuery

character(len=50) function htmlenc(str)
	character(len=*), intent(in) :: str
	integer :: i
	
	! Start with nothing
	htmlenc = ""
	
	! Now go through the entire string, changing spaces to +s. This doesn't
	! really count as html encoding, but it's (hopefully) sufficient for
	! our needs
	do i = 1, len_trim(str)
		if (str(i:i) /= ' ') then
			htmlenc = trim(htmlenc) // str(i:i)
		else
			htmlenc = trim(htmlenc) // '+'
		end if
	end do
end function htmlenc

program week9main
	use string
	implicit none
	
	character(len=5) :: copy
	character(len=9) :: res1
	character(len=2) :: ow
	character(len=16) :: cow
	
	copy = 'copy '
	ow = 'ow'
	cow = 'ow now brown cow'
	
	! strlen()
	100 format (A, I2, A)
	write (*, 100) 'There are ', strlen(copy), ' characters in variable copy.'
	write (*, 100) 'There are ', strlen(cow), ' characters in variable cow.'
	
	! strcat()
	res1 = strcat(copy, copy)
	res1 = strcat(res1, trim(copy))
	write (*, *) res1
	
	! strstr()
	call dostrstr(cow, ow)
	call dostrstr(copy, ow)
	call dostrstr(trim(copy), 'p')
	call dostrstr(trim(copy(1:2)), 'p')
	
	! strcmp()
	call dostrcmp(cow, ow)
	call dostrcmp(ow, cow)
	call dostrcmp(res1, res1)
	call dostrcmp(res1, res1 // ' ' // res1)
end program week9main

subroutine DoStrStr(s1, s2)
	use string
	character(len=*), intent(in) :: s1, s2
	integer :: idx
	
	idx = strstr(s1, s2)
	
	if (idx == 0) then
		200 format ('"', A, '" is not in "', A, '"')
		write (*, 200) s2, s1
	else
		300 format ('"', A, '" is at position ', I2, ' in "', A, '"')
		write (*, 300) s2, idx, s1
	end if
end subroutine DoStrStr

subroutine DoStrCmp(s1, s2)
	use string
	character(len=*), intent(in) :: s1, s2
	integer :: res
	
	res = strcmp(s1, s2)
	
	if (res == 0) then
		400 format ('"', A, '" = "', A, '"')
		write (*, 400) s1, s2
	else if (res < 0) then
		500 format ('"', A, '" < "', A, '"')
		write (*, 500) s1, s2
	else
		600 format ('"', A, '" > "', A, '"')
		write (*, 600) s1, s2
	end if
end subroutine DoStrCmp

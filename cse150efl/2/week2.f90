program week2
	implicit none
	integer :: age
	
	write (*,*) "Hello. How old are you?"
	read (*,*) age
	
	if (age .lt. 18) then
		write (*,*) "You're young!"
	end if
	
	if (age .ge. 18 .and. age .lt. 65) then
		write (*,*) "You're an adult!"
	end if
	
	if (age .ge. 65) then
		write (*,*) "You're a senior citizen!"
	end if
end program week2

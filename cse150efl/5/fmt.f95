program fmt
	real, parameter :: rVal = 8.246109
	
	write (*, '(I5)') 1024
	write (*, '(I8)') 7
	write (*, '(I2)') 65535
	write (*, '(F8.6)') rVal
	write (*, '(F8.2)') rVal
	write (*, '(E7.2)') rVal
	write (*, '(ES9.3)') rVal
	write (*, '(EN10.2)') rVal
	write (*, '(E7.2E1)') rVal
	write (*, '(ES9.3E2)') rVal
	write (*, '(EN10.2E1)') rVal
	write (*, '(L10)') .true.
	write (*, '(L1)') .false.
	write (*, '(A)') 'Hello'
	write (*, '(A1)') 'Hello'
	write (*, '(A7)') 'Hello'
	write (*, '(S, F6.3)') rVal
	write (*, '(SP, F6.3)') rVal
	write (*, '(SS, F6.3)') rVal
	write (*, '(S, F6.3)') (-1 * rVal)
	write (*, '(SP, F6.3)') (-1 * rVal)
	write (*, '(SS, F6.3)') (-1 * rVal)
end program fmt

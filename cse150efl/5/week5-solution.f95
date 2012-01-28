program week5
	implicit none
	
	! Don't change these
	real              :: VR1 = 3.14159265358979323846264338327950288419716939937510
	real              :: VR2 = 2.006598
	integer           :: VI1 = 2001
	integer           :: VI2 = 50092
	logical           :: VL1 = .false.
	logical           :: VL2 = .true.
	character         :: VC1 = '.'
	character(len=44) :: VS1 = 'The quick brown fox jumps over the lazy dogs'
	character(len=7)  :: VS2 = "Hello, "
	character(len=14) :: VS3 = ". How are you?"
	
	
	
	! Solution
	100 format (A43, /, 1X, A43, /, 2X, A43, /, 3X, A43, /, 4X, A43, /, 3X, A43, /, 2X, A43, /, 1X, A43, /, A43)
	200 format (L1, L1, L1, A)
	300 format (A7, A4, A14)
	400 format (A35, F4.2, A1)
	500 format (I5, A1, I4, A1, I5)
	600 format (E7.2E1)
	700 format (A44, TL1, A1)
	800 format (SP, F25.22)
	900 format (EN30.8E3)
	999 format (A5, A14)
	
	
	
	! Don't change these
	write (*, 100) VS1, VS1, VS1, VS1, VS1, VS1, VS1, VS1, VS1
	write (*, 200) VL2, VL1, VL2, " is a display type."
	write (*, 300) VS2, "Lisa", VS3
	write (*, 400) VS1, VR1, VC1
	write (*, 500) VI2, '-', VI1, '=', (VI2-VI1)
	write (*, 600) VR2
	write (*, 700) VS1, VC1
	write (*, 800) VR1
	write (*, 900) VR1
	write (*, 999) VS2, VS3
end program week5
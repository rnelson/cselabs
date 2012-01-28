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
	
	
	
	! Complete each of these format statements to make the write
	! statements below create identical output to mine
	100 format ( )
	200 format ( )
	300 format ( )
	400 format ( )
	500 format ( )
	600 format ( )
	700 format ( )
	800 format ( )
	900 format ( )
	999 format ( )
	
	
	
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

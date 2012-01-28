MODULE STRING
CONTAINS
	! STRLEN()
	! Gets the length of the given string
	! 
	! Parameters:
	!	STR1: CHAR, the string to check
	! Return:
	!	INTEGER, the number of characters in the string
	INTEGER FUNCTION STRLEN(STR1)
		IMPLICIT NONE
		
		! Parameters
		CHARACTER(len=*), INTENT(IN) :: STR1
		
		! Code
		STRLEN = LEN_TRIM(STR1)
	END FUNCTION STRLEN
	
	! STRCMP()
	! Compares two strings
	! 
	! Parameters:
	!	STR1: CHAR, the first string
	!	STR2: CHAR, the second string
	! Return:
	!	INTEGER, < 0 if STR1 < STR2
	!	         = 0 if STR1 = STR2
	!	         > 0 if STR1 > STR2
	INTEGER FUNCTION STRCMP(STR1, STR2)
		IMPLICIT NONE
		
		! Parameters
		CHARACTER(len=*), INTENT(IN) :: STR1, STR2
		
		! Variables
		INTEGER :: result
		
		! Code
		IF (LLT(STR1, STR2)) THEN
			result = -1
		ELSE IF (LGT(STR1, STR2)) THEN
			result = 1
		ELSE
			result = 0
		END IF
		
		STRCMP = result
	END FUNCTION STRCMP
	
	! STRCAT()
	! Concatenates two strings
	! 
	! Parameters:
	!	STR1: CHAR, the initial string
	!	STR2: CHAR, the string to append
	! Return:
	!	CHAR(100), STR1 and STR2 concatenated if |str1+str2| <= 100, else ""
	CHARACTER(len=100) FUNCTION STRCAT(STR1, STR2)
		IMPLICIT NONE
		
		! Parameters
		CHARACTER(len=*), INTENT(IN) :: STR1, STR2
		
		! Variables
		CHARACTER(len=100) :: result
		
		! Code
		IF (LEN(STR1) + LEN(STR2) > 100) THEN
			result = ''
		ELSE
			result = STR1 // STR2
		END IF
		
		STRCAT = result
	END FUNCTION STRCAT
	
	! STRSTR()
	! Searches for one string inside another
	! 
	! Parameters:
	!	STR1: CHAR, the string to search
	!	STR2: CHAR, the string to search for
	! Return:
	!	INTEGER, the location of STR2 in STR1 if found, else 0
	INTEGER FUNCTION STRSTR(STR1, STR2)
		IMPLICIT NONE
		
		! Parameters
		CHARACTER(len=*), INTENT(IN) :: STR1, STR2
		
		! Variables
		INTEGER :: result
		
		! Code
		result = INDEX(STR1, STR2, .FALSE.)
		STRSTR = result
	END FUNCTION STRSTR
END MODULE STRING
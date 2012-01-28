MODULE STRING
CONTAINS
	! STRLEN()
	! Gets the length of the given string
	! 
	! Parameters:
	!	STR1: CHAR, the string to check
	! Return:
	!	INTEGER, the number of characters in the string
	
	
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
	
	
	! STRCAT()
	! Concatenates two strings
	! 
	! Parameters:
	!	STR1: CHAR, the initial string
	!	STR2: CHAR, the string to append
	! Return:
	!	CHAR(100), STR1 and STR2 concatenated if |str1+str2| <= 100, else ""
	
	
	! STRSTR()
	! Searches for one string inside another
	! 
	! Parameters:
	!	STR1: CHAR, the string to search
	!	STR2: CHAR, the string to search for
	! Return:
	!	INTEGER, the location of STR2 in STR1 if found, else 0
	
END MODULE STRING
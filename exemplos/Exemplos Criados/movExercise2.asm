;==================================
;File: 
;Description:
;Author: Fernando
;Version: 
;=================================

.code



end:
	INT exit

.data
	;syscall exit
	exit: DD 25

	push: DD 0
	pop: DD 1

	cont: DD 0
	tam: DD 5

.bss

	sp: RESD 1

.stack 5

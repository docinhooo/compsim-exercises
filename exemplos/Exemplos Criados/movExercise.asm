;==================================
;File: 
;Description:
;Author: 
;Version: 
;=================================

.code

add:

	LDA element
	SOP push
	SUB pop
	STA element

	JZ search
	JMP add

search:

	MOV $SP
	ADD two
	STA num
	LDI num
	STA num

end:
	INT exit

.data
	;syscall exit
	exit: DD 25

	push: DD 0;
	pop: DD 1;
	two: DD 2;
	element: DD 10;

.bss
	num: RESD 1

.stack 10


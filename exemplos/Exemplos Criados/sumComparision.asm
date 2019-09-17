;==================================
;File: 
;Description:
;Author: Fernando Morato
;Version: 1.0
;=================================

.code
	
for:

	LDA i
	SUB max
	JZ end

	LDA a
	ADD a
	STA a

	LDA i
	ADD plus_one
	STA i	

	JMP for

if:

	LDA a
	SUB vinte
	JN elif

then:
	
	LDA vinte
	STA a
	JN end

elif:

	LDA dez
	SUB a
	JN end

then:

	LDA dez
	STA a

end:
	INT exit

.data

	a: DD 1
	i: DD 0
	plus_one: DD 1
	max: DD 5

	vinte: DD 20
	dez: DD 10

	;syscall exit
	exit: DD 25

.stack 10

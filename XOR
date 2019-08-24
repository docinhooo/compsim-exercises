;XOR
; res = ~(~(~(a & b) & a) & ~(~(a & b) & b))
.code

	LDA a
	NAND c
	STA p1
	
	LDA p1
	NAND a
	STA p1

	LDA a
	NAND c
	STA p2
	
	LDA p2
	NAND c
	STA p2
	
	LDA p1
	NAND p2
	STA res

end:
	INT exit

.data

	a: DD 10
	c: DD 8

	
	exit: DD 25

.bss

	p1: RESD 1
	p2: RESD 1
	res: RESD 1

.stack 10



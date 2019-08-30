;XNOR
; res = ~(~(~(~(a & b) & a) & ~(~(a & b) & b)))
; res = ~(a XOR c)
; not working due to compsim inconsistency. 
; already reported to admin (Edson)
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
	
	;res1 = res NAND res
	;res = 0011b
	;res1 = 1100b
	LDA res
	NAND res
	STA res1

end:
	INT exit

.data

	a: DD 10
	c: DD 9

	exit: DD 25

.bss

	p1: RESD 1
	p2: RESD 1
	res: RESD 1
	res1: RESD 1

.stack 10




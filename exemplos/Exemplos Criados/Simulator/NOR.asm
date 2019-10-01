;NOR
; not_a = ~(a & a)
; not_c = ~(c & c)
; res = ~(not_c & not_a)
.code

	LDA a
	NAND a
	STA not_a

	LDA c
	NAND c
	STA not_c

	LDA not_a
	NAND not_c
	STA res	

exit:
	INT exit
.data
	a: DD 10
	c: DD 15
	exit: DD 25
.bss
	res: RESD 1
	not_a: RESD 1
	not_c: RESD 1

.stack 10

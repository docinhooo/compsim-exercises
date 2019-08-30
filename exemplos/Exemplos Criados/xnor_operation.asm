;==================================
;File: xnor.asm
;Description: Demonstração do XNOR
;Author: Fernando Morato, Pedro Silva
;Version: 1.0
;=================================

.code

	LDA a
	NAND a
	STA not_a

	LDA c
	NAND c
	STA not_c


	LDA not_a
	NAND not_c
	STA p3

	LDA p3
	NAND p3
	STA part1

;------  ------	
		
	LDA a
	NAND c
	STA p4

	LDA p4
	NAND p4
	STA part2
	
;------  execucao do or  ------		

	LDA part1
	NAND part2
	STA p5
	
	LDA p5
	NAND part1
	STA p5

	LDA part1
	NAND part2
	STA p6
	
	LDA p6
	NAND part2
	STA p6
	
	LDA p5
	NAND p6
	STA res


end:
	INT exit

.data

	;int a = 10
	a: DD 1
	;int c = 11
	c: DD 1
	;syscall exit
	exit: DD 25

.bss
	
	res: RESD
 1
	not_a: RESD 1
	not_c: RESD 1
	p3: RESD 1
	p4: RESD 1
	p5: RESD 1
	p6: RESD 1
	part1: RESD 1
	part2: RESD 1

.stack 10




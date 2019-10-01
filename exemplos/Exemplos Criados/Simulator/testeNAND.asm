;==================================
;File: testeNAND.asm
;Description: Teste básico do operador NAND
;Author: Fernando Morato, Pedro Silva
;Version: 1.0
;=================================

.code

	LDA a
	NAND c
	STA res

	;Testes realizados:
	;0 NAND 0
	;0 NAND 1
	;1 NAND 0
	;1 NAND 1


end:
	INT exit

.data	

	a: DD 1 
	c: DD 1
	;syscall exit
	exit: DD 25

.bss

	res: RESD 1

.stack 10

.code
;==================================
;Arquivo: shifting_values.asm
;Proposito: Demonstra operaões de 
; multiplicação e divisão
;Autores: Gabriel Arthur, Pedro Silva
;Versao: 1.0
;Codigo em C:
; int a = 10
; a = a * 2
; int c = 10
; c = c / 2
; exit()
;==================================


	; Le valor de a para AC
	LDA a

	; Multiplica AC por 2
	SHIFT one

	; Grava valor de AC em a
	STA a


	LDA c
	
	; Divide AC por 2
	SHIFT zero

	STA c
	
	;finaliza programa
end: 
	INT exit

.data
	;int a = 10;
	a: DD 10
	c: DD 2
	zero: DD 0
	one: DD 1

	; syscall exit
	exit: DD 25


; pilha de 10 palavras
.stack 10 




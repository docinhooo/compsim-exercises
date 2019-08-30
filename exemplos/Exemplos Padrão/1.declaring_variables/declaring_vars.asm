.code
;==================================
;Arquivo: declaring_vars.asm
;Proposito: Demonstra exemplos 
; de como inicializar variaveis.
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 10
; char b[5] = "hello"
; int exit = 25
; int c
; char d[10]
; exit()
;==================================

	;finaliza programa
end: 
	INT exit

.data
	;int a = 10;
	a: DD 10

	;char b[5] = "hello";
	b: DB "hello"
	
	; syscall exit
	exit: DD 25

	; secao .bss eh opcional
.bss
	;int c; 
	c: RESD 1

	;int d[10]; 
	d: RESB 10

; pilha de 10 palavras
.stack 10 



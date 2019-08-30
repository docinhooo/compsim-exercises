.code
;==================================
;Arquivo: accessing_memory.asm
;Proposito: Demonstra acessos 
; basicos de leitura/escrita na
; memoria.
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 10
; int b
; b = a
; exit()
;==================================


	; Le valor de a para AC
	LDA a

	; Grava valor de AC em b
	STA b
	
	;finaliza programa
end: 
	INT exit

.data
	;int a = 10;
	a: DD 10
	
	; syscall exit
	exit: DD 25

	; secao .bss eh opcional
.bss
	;int b; 
	b: RESD 1

; pilha de 10 palavras
.stack 10 



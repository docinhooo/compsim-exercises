.code
;==================================
;Arquivo: if_else_conditionals.asm
;Proposito: Implementacao de  
; estrutura de selecao IF/ELSE
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 1
; int b = 5
; if a >= b {
;   a = a * 2
; }
; else {
;   b = b - a 
; }
; exit()
;==================================

    ;if a >= b:
if: 
    LDA a
    SUB b
    JN else

    ;then a = a * 2
then: 
    LDA a
    ADD a
    STA a
	
    ;else b = b - a
else:
    LDA b
    SUB a
    STA b
	
end:
    INT exit
	

.data
    a: dd 1
    b: dd 5

	exit: DD 25

.stack 10

.code
;==================================
;Arquivo: and_operation.asm
;Proposito: Um implementacao da  
; operaca logica AND
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 10
; int b = 15
; int c
; c = ~(a & b)
; c = ~(c & c)
; exit()
;==================================


    ; c = a NAND b
    LDA a
    NAND b
    STA c
	
    ; c = c NAND c
    LDA c
    NAND c
    STA c
	
end:
    INT exit

.data
    ;a = 1010b
    a: DD 10
	
    ;b = 1111b
    b: DD 15
    
    exit: DD 25

.bss
    ;c = a AND b
    c: RESD 1

.stack 10



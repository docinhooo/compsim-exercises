.code
;==================================
;Arquivo: or_operation.asm
;Proposito: Um implementacao da  
; operaca logica OR
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 10
; int b = 15
; int c
; int out_a
; int_out b
; out_a = ~(a & a)
; out_b = ~(b & b)
; c = ~(out_a & out_b)
; exit()
;==================================

    ; out_a = a NAND a
    LDA a
    NAND a
    STA out_a
	
    ; out_b = b NAND b
    LDA b
    NAND b
    STA out_b

    ; c = out_a NAND out_b
    LDA out_a
    NAND out_b
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
    
    out_a: RESD 1
    out_b: RESD 1

.stack 10


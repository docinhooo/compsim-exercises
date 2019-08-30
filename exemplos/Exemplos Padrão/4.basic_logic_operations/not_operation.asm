.code
;==================================
;Arquivo: not_operation.asm
;Proposito: Um implementacao da  
; operaca logica NOT
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 10
; int not_a
; not_a = ~(a & a)
; exit()
;==================================

    ; not_a = a NAND a
    LDA a
    NAND a
    STA not_a
	
end:
    INT exit

.data
    ;a = 1010b
    a: DD 10

    exit: DD 25

.bss
    ;not_a = NOT a
    not_a: RESD 1

.stack 10


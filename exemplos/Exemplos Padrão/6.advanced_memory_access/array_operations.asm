.code
;==================================
;Arquivo: array_operations.asm
;Proposito: Operações sobre
; arrays.
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a[10]
; int size_a = 10
; int i
; int value = 0
; for(i=0; i<size_a; i++){
;   a[i] = value
;   value = value + 1
; exit()
;==================================


select_pos:
    LDI ptr_a ; a[i] = value;
    ADD value
    STI ptr_a

    LDA value  ;value += 1
    ADD one
    STA value
    
    LDA ptr_a ;i += 1
    ADD one
    STA ptr_a
    
    ;if value == size(a)
    LDA size_a
    SUB value
    ;then exit
    JZ end
    ;else
    JMP select_pos
    
end:
    INT exit
     
.data
    ptr_a: DD a ; int *index_a = a
    size_a: DD 10
    value: DD 0
    one: DD 1

    exit: DD 25
.bss
    a: RESD 10 ; int a[10];

.stack 10






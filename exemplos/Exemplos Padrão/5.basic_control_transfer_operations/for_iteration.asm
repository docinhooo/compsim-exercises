.code
;==================================
;Arquivo: for_iteration.asm
;Proposito: Implementacao de  
; laco FOR
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int i = 0
; int a = 1
; int plus_one = 1
; int max = 5
; for(i=i; i<max; i=i+plus_one){
;   a = a*2
; }
; exit()
;==================================

    ;for (i=0; i<5; i=i+plus_one)
for:
    LDA i
    SUB max
    JZ end

    ; a = a x 2
    LDA a
    ADD a
    STA a

    ; i += 1
    LDA i
    ADD plus_one
    STA i

    JMP for

end:
    INT exit
    
.data
    i: DD 0
    a: DD 1
    plus_one: DD 1
    max: DD 5

    exit: DD 25

.stack 10

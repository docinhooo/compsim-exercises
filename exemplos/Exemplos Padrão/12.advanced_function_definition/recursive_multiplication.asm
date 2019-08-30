.code
;==================================
;Arquivo: recursive_multiplication.
; asm
;Proposito: Versao recursiva da ope
; racao de multiplicacao
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int x = 5
; int y = 3
; int z;
;
; int multi(int x, int y) {
;   if (y == 1) {
;     return x
;   } else {
;     return x + multi(x, y - 1)
;   }
; }
; multi(x,y)
; exit()
;==================================


    LDA y
    SOP push
    LDA x
    SOP push
    CALL multi

    SOP pop
    STA z

    INT exit

multi:
    SOP pop
    STA ret_var ; guarda end. ret.
    
    SOP pop
    STA var1 ; guarda x
    
    SOP pop
    STA var2 ; guarda y
    
    ; if (y == 1)
    MOV 1
    SUB var2 
    JZ  multi_ret

    ;else
    LDA var2
    SUB one
    STA var2   ; y = y - 1

    LDA ret_var
    SOP push

    LDA var1
    SOP push

    LDA var2
    SOP push
    
    LDA var1
    SOP push
    
    CALL multi  ;mult(x, y - 1)
    
    SOP pop
    STA var3

    SOP pop
    ADD var3
    STA var1 ; x = x + mult

    SOP pop
    STA ret_var

multi_ret:
    LDA var1
    SOP push
    
    LDA ret_var
    SOP push 
	
    RET

.data
    x: DD 5
    y: DD 30
    z: DD 0

    one: DD 1
    push: DD 0
    pop: DD 1
    exit: DD 25

.bss
    var1: RESD 1 ; local var
    var2: RESD 1 ; local var 
    var3: RESD 1 ; var3 = var1 - var2
    
    ret_var: RESD 1 ; end. retorno

    ptr: RESD 1  ; acesso a pilha
   

.stack 100








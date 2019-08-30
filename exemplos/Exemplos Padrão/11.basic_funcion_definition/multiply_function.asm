.code

  ; a = multiply(a, b)
    LDA b
    SOP push
    LDA a
    SOP push
    CALL multiply
    ;remove parametros da pilha
    SOP pop 
    SOP pop 
    STA a

    INT exit
    
;======================================
multiply:
    MOV $sp     ; end. topo pilha
    ADD one     ; end. param. funcao
    STA ptr  
    LDI ptr     ; recupera a (var1)
    STA var1
    LDA ptr
    ADD one
    STA ptr  
    LDI ptr     ; recupera b (var2)
    STA var2
    LDA zero    ; zera var3
    STA var3    

    ;while(var !=))
while_m:
    LDA var2    
    SUB zero
    JZ end_m

    ; if (var2 ^ 1)
if_m:
    LDA var2   
    NAND one
    STA t
    LDA t   
    NAND t
    JZ end_if_m

then_m:  
    LDA var3    ; var3 += var1
    ADD var1
    STA var3
     
end_if_m:
    LDA var1	; var1 <<= 1
    SHIFT one
    STA var1
    
    LDA var2   ; var2 >>= 1
    SHIFT zero
    STA var2
    
    JMP while_m

end_m:	
    LDA var3
    STI ptr
    RET
;======================================


.data
    a: DD 5
    b: DD 5

    one: DD 1
    zero: DD 0

    push: DD 0
    pop: DD 1
    exit: DD 25	

.bss
    var1: RESD 1 ; local var
    var2: RESD 1 ; local var 
    var3: RESD 1 ; var3 = var1 + var2
    t: RESD 1    ; local var
	
    ptr: RESD 1  ; acesso a pilha
	
.stack 10






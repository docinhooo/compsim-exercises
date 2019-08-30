.code

  ; a = divide(a, b)
    LDA b
    SOP push
    LDA a
    SOP push
    CALL divide
    ;remove parametros da pilha
    SOP pop
    SOP pop
    STA a

    INT exit

;======================================
divide:
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


	;if (var1 == var2):
    LDA var1
    SUB var2
    JZ return_1_d

    ;if (var1 < var2):
    LDA var1
    SUB var2
    JN return_0_d

    ;while (var1 >= var2):
while_d:
	LDA var1
	SUB var2
	JN end_d
	
	;a = a - b
	LDA var1
	SUB var2
	STA var1
	
	;c = c + 1
	MOV 1
	ADD var3
	STA var3
	
	JMP while_d

return_1_d:
    MOV 1
    STA var3
    JMP end_d
    
return_0_d:
	MOV 0
	STA var3
	JMP end_d

end_d:
    LDA var3
    STI ptr
    RET
;======================================

.data
    a: DD 20
    b: DD 2
    one: DD 1
    zero: DD 0

    push: DD 0
    pop: DD 1
    exit: DD 25

.bss
    var1: RESD 1 ; local var
    var2: RESD 1 ; local var 
    var3: RESD 1 ; var3 = var1 - var2

    ptr: RESD 1  ; acesso a pilha

.stack 10


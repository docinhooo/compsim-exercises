.code

	;if (a == b):
    LDA a
    SUB b
    JZ return_1

    ;if (a < b):
    LDA a
    SUB b
    JN return_0

    ;while (a >= b):
while:
	LDA a
	SUB b
	JN end
	
	;a = a - b
	LDA a
	SUB b
	STA a
	
	;c = c + 1
	MOV 1
	ADD c
	STA c
	
	JMP while

return_1:
    MOV 1
    STA c
    JMP end
    
return_0:
	MOV 0
	STA c
	JMP end

    
end:
    INT exit

.data
    a: DD 20
    b: DD 2
    
    exit: DD 25

.bss
    c: RESD 1  ;c = a / b

.stack 10






.code

    ;while(b != 0)
while:
    LDA b    
    SUB zero
    JZ end
    
    ; if (b ^ 1)
if:
    LDA b   
    NAND one
    STA t
    LDA t   
    NAND t
    JZ end_if
	
then:  
    LDA c    ; c += a
    ADD a
    STA c
    
end_if:
    LDA a	; a <<= 1
    SHIFT one
    STA a
    
    LDA b   ; b >>= 1
    SHIFT zero
    STA b
    
    JMP while
    ;end while
	
end:	
    INT exit

.data
    a: DD 2
    b: DD 5
    
    zero: DD 0
    one: DD 1

    exit: DD 25

.bss
    c: RESD 1  ;c = a * b
    t: RESD 1 ; temporary

.stack 10





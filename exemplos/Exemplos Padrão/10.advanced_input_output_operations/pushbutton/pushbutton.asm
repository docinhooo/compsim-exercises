.code
;==================================
; pushbutton no Pin 8
;==================================


main:
    LDA arduino_portB

    ;read char from keyboard
    INT input

    ; c = input NAND mask
    NAND mask
    STA nand_c
	
    ; a = nand_c NAND nand_c
    NAND nand_c
    STA a

    JMP main 

    ;encerra a aplicacao
    INT exit

.data
    mask: DD 1; b00000001
    nand_c: DD 0

    arduino_portB: DD 512
    ;input interruption
    input: DD 20
    
    ;halt interruption
    exit: DD 25

.bss
    a: RESD 1

.stack 10






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

    MOV 1
    SUB a
    JZ apaga_led

acende_led:
    LDA high_led
    ADD arduino_portD
    INT output
    JMP main

apaga_led:
    LDA low_led
    ADD arduino_portD
    INT output
    JMP main

    ;encerra a aplicacao
    INT exit

.data
    mask: DD 1; b00000001
    nand_c: DD 0

    high_led: DD 128 ; b10000000
    low_led:  DD 0 

    arduino_portB: DD 512
    arduino_portD: DD 768

    ;input interruption
    input: DD 20
    ;output interruption
    output: DD 21
    ;halt interruption
    exit: DD 25

.bss
    a: RESD 1

.stack 10







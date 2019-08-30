.code

    ;set keyboard address
    LDA keyboard_address

    ;read char from keyboard
    INT input

    ;grava char em 'a'
    STA a
 
    ;encerra a aplicacao
    INT exit

.data
    ;A0 pin
    pin: DD 0

    arduino_portC: DD 1024

    ;input interruption
    input: DD 20

    ;syscall exit
    exit: DD 25

.bss
    a: RESD 1

.stack 10



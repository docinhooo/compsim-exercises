.code


    ;set portC address
loop:
    LDA arduino_portC

    ;set A0 pin
    ADD pinA0

    ;read char from keyboard
    INT input

    ;grava char em 'a'
    STA a
 
    JMP loop
 
    ;encerra a aplicacao
    INT exit

.data
    ;A0 pin
    pinA0: DD 0

    arduino_portC: DD 1024

    ;input interruption
    input: DD 20

    ;syscall exit
    exit: DD 25

.bss
    a: RESD 1

.stack 10




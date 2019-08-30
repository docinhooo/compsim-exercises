.code


    ;set portC address
loop:
    LDA arduino_portC

    ;set A0 pin
    ADD pinA0

    ;read char from keyboard
    INT input

    STA a
    ;divide por 4
    ; a >> 2
    SHIFT right
    SHIFT right

    ;set pin3
    ADD arduino_portPWM
    INT output

    JMP loop
 
    ;encerra a aplicacao
    INT exit

.data
    um: DD 1
    a: DD 0
    
    right: DD 0

    ;A0 pin
    pinA0: DD 0

    ;read port
    arduino_portC: DD 1024

    ;write port (pin 3 - PWM)
    arduino_portPWM: DD 1280

    ;input interruption
    input: DD 20

    ;output interruption
    output: DD 21

    ;syscall exit
    exit: DD 25


.stack 10










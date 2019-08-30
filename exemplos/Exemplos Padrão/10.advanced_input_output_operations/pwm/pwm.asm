.code


loop:
    LDA a
    ;set pin3
    ADD arduino_portPWM
    INT output
    
    ;updates output
    MOV 5
    ADD a
    STA a


    JMP loop

    ;encerra a aplicacao
    INT exit

.data
    a: DD 0
    
    ;write port (pin 3 - PWM)
    arduino_portPWM: DD 1280

    ;output interruption
    output: DD 21

    ;syscall exit
    exit: DD 25


.stack 10









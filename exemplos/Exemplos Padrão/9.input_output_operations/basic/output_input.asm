.code

blink:
    LDA high
    ADD arduino_portD
    INT output

loop:
    MOV 2
    SUB contador
    JZ  read_1    
    ;contador += 1
    MOV 1
    ADD contador
    STA contador
    JMP loop

read_1:
    LDA arduino_portB
    INT input
    STA var

    ; contador = 0
    MOV 0
    STA contador
    JMP loop

    ;encerra a aplicacao
    INT exit

.data
    ;bits de operacao
    high: DD 1  ;b11111111
    down: DD 0  ;b00000000

    ;endereço da porta D: 
    ;b00000011 00000000
    arduino_portD: DD 768

    ;endereço da porta B: 
    ;b00000010 00000000
    arduino_portB: DD 512

    ;output interruption
    output: DD 21

    ;input interruption
    input: DD 20

    contador: DD 0
    var: DD 0

    ;syscall exit
    exit: DD 25
      
.stack 1











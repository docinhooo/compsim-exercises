.code

blink:
    LDA high
    ADD arduino_portB
    INT output

loop:
    MOV 2
    SUB contador
    JZ  no_blink    
    
    MOV 1
    ADD contador
    STA contador
    JMP loop

no_blink:
    LDA down
    ADD arduino_portB
    INT output

    MOV 0
    STA contador

loop2:
    MOV 2
    SUB contador
    JZ  blink    

    MOV 1
    ADD contador
    STA contador
    JMP loop2

    INT exit

.data

    high: DD 32  ;pin 5
    down: DD 0

    arduino_portB: DD 512
 
    output: DD 21
    
    contador: DD 0

    exit: DD 25
      
.stack 1








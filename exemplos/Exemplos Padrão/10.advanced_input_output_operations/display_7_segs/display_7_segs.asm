.code

main:
    CALL clean_display
    CALL print_zero
    CALL print_um
    CALL print_dois
    CALL print_tres
    CALL print_quatro
    CALL print_cinco
    CALL print_seis
    CALL print_sete
    CALL print_oito
    CALL print_nove

    JMP main

end:
    INT exit

clean_display:
    LDA clean
    ADD arduino_portD
    INT output
    LDA clean
    ADD arduino_portB
    INT output
    RET

print_zero:
    LDA zeroD
    ADD arduino_portD
    INT output
    LDA zeroB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET
    
print_um:
    LDA umD
    ADD arduino_portD
    INT output
    LDA umB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_dois:
    LDA doisD
    ADD arduino_portD
    INT output
    LDA doisB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_tres:
    LDA tresD
    ADD arduino_portD
    INT output
    LDA tresB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_quatro:
    LDA quatroD
    ADD arduino_portD
    INT output
    LDA quatroB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_cinco:
    LDA cincoD
    ADD arduino_portD
    INT output
    LDA cincoB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_seis:
    LDA seisD
    ADD arduino_portD
    INT output
    LDA seisB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_sete:
    LDA seteD
    ADD arduino_portD
    INT output
    LDA seteB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_oito:
    LDA oitoD
    ADD arduino_portD
    INT output
    LDA oitoB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep
    RET

print_nove:
    LDA noveD
    ADD arduino_portD
    INT output
    LDA noveB
    ADD arduino_portB
    INT output
    ;sleep
    CALL sleep    
    RET

    ;funcao sleep
sleep:
    LDA cont_default
    STA contador
sleep_loop:
    LDA contador
    SUB one
    JZ  sleep_end
    ;contador -= 1
    LDA contador
    SUB one
    STA contador
    JMP sleep_loop
sleep_end:
	LDA cont_default
	STA contador
	RET



.data
    ;numeros do display
    clean: DD 0      ;b00000000
    zeroD: DD 252    ;b11111100
    zeroB: DD 0      ;b00000000
    umD: DD 24       ;b00011000
    umB: DD 0        ;000000000
    doisD: DD 108    ;b01101100
    doisB: DD 1      ;b00000001
    tresD: DD 60     ;b00111100
    tresB: DD 1      ;b00000001
    quatroD: DD 152  ;b10011000
    quatroB: DD 1    ;b00000001
    cincoD: DD 180   ;b10110100
    cincoB: DD 1     ;b00000001
    seisD: DD 244    ;b11110100
    seisB: DD 1      ;b00000001
    seteD: DD 28     ;b00011100
    seteB: DD 0      ;b00000000    
    oitoD: DD 252     ;b11111100
    oitoB: DD 1      ;b00000001 
    noveD: DD 156    ;b10011100
    noveB: DD 1      ;b00000001
    
    ;sleep vars
    cont_default: DD 1
    contador: DD 0
    one: DD 1
    ;portas B e D Arduino
    arduino_portB: DD 512
    arduino_portD: DD 768
    ;interrupcao de output
    output: DD 21
    ;operacoes com pilha
    push: DD 0
    pop: DD 1
    end_ret: DD 0
    
    exit: DD 25 
.stack 10





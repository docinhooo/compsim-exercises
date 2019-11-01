.code
	;pegar entrada no teclado
	LDA dez

gravarParalelo:

	LDI ptr
	STA portD_2
	INT output
	
	MOV 1
	ADD ptr
	STA ptr
	STA portD_3
	INT output
	
	MOV 1
	ADD ptr
	STA ptr
	STA portD_4
	INT output

	MOV 1
	ADD ptr
	STA ptr
	STA portD_5
	INT output
	
	JMP clock

clock:

    MOV 1
    STA portB_8
	INT output
    
    MOV 0
    STA portB_8
	INT output
	
end:
	INT exit

.data
	
	ptr: DD dez
	dez: DB '1010'
	;arduino_portD: DD 768
	portD_2: DD 772
	portD_3: DD 776
	portD_4: DD ‭784‬
	portD_5: DD 800
	portD_6: DD 832
	portD_7: DD 896
	;arduino_portD: DD 512
	portB_8: DD 513 ;clock
	portB_9: DD 514 ;clear
	portB_10: DD 516
	exit: DD 25

.bss
	
	serial: RESD 1
	paralelo: RESD 1
	in_serial: RESD 1
	clock: RESD 1
	clear: RESD 1

.stack 10




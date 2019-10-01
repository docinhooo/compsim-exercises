.code

loop:

	LDA arduino_portB

	INT input

	NAND mask
	STA nand_c
	NAND nand_c

	STA a
	JZ inverter

	JMP loop

blink:
	LDA p
	ADD arduino_portD
	INT output

	JMP loop

inverter:
	MOV 32
	SUB p
	JZ zerar

	JMP highar
	
zerar:
	MOV 0
	STA p
	JMP blink
highar:
	MOV 32 
	STA p
	JMP blink


	INT exit

.data

	mask: DD 1
	
	nand_c: DD 0

	arduino_portB: DD 512
	arduino_portD: DD 768
	high: DD 32
	input: DD 20
	output: DD 21
	check: DD 0
	p: DD 32
	exit: DD 25

.bss
	contador: RESD 1
	a: RESD 1

.stack 10  




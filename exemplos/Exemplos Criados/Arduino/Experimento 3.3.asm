.code

button:

	LDA arduino_portB

	INT input

	NAND mask
	STA nand_c
	NAND nand_c

	STA a
	SUB running
	JZ blink
	JN reset

	JMP button

reset:
	MOV 0
	STA running
	JMP button

blink:
 	LDA on
    INT output

	MOV 1
	STA running

    LDA arduino_portD
    INT output

	JMP button


	INT exit

.data

	mask: DD 1
	running: DD 0
	nand_c: DD 0
	arduino_portD: DD 768
	arduino_portB: DD 512
	on: DD 800
	input: DD 20
	output: DD 21
	contador: DD 0
	running: DD 0
	exit: DD 25

.bss
	
	a: RESD 1

.stack 10  







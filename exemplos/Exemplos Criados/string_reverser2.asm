.code

inverter:

	LDI ptrW
	SOP push

	LDA ptrW
	ADD pop
	STA ptrW

	LDA cont
	ADD pop
	STA cont

	LDA tam
	SUB cont
	JZ voltar
	JMP inverter

voltar:

	LDA ptrW
	SUB tam
	STA ptrW

passar:

	LDI ptrW
	SOP pop
	STI ptrW

	LDA ptrW
	ADD pop
	STA ptrW

	LDA cont2
	ADD pop
	STA cont2

	LDA tam
	SUB cont2
	JZ end
	JMP passar

end:
	INT exit

.data

	push: DD 0
	pop: DD 1
	cont: DD 0
	cont2: DD 0
	tam: DD 6
	char: DD 19
	ptrW: DD hello
	hello: DB "hello!"
	exit: DD 25

.stack 6

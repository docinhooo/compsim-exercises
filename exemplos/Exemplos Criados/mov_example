.code

for:
	LDA num
	SOP push

	MOV 1
	ADD num
	STA num

	LDA num
	SUB six
	JZ next
	JMP for

next:
	MOV $SP
	ADD two
	STA sp
	LDI sp
	STA sp

end:
	INT exit
.data
	exit: DD 25

	num: DD 1
	two: DD 2
	push: DD 0
	six: DD 6

.bss
	sp: RESD 1	

.stack 10


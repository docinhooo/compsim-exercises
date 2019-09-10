.code

for:
	LDI ptr_str
	SOP push
	
	LDA ptr_str
	ADD one	
	STA ptr_str
	
	LDA index
	ADD one
	STA index	
	
	LDA size_str
	STA last_ptr

	LDA size_str
	SUB index
	JZ next_part
	JMP for
	
next_part:
	LDA zero
	STA index

	LDA last_ptr
	STA ptr_str

for1:
	SOP pop
	STI reversed_ptr

	LDA reversed_ptr
	ADD one	
	STA reversed_ptr
	
	LDA index
	ADD one
	STA index	
	
	LDA size_str
	SUB index
	JZ end
	JMP for1

end:
	INT exit

.data
	;syscall exit
	exit: DD 25

	push: DD 0
	pop: DD 1
	one: DD 1
	index: DD 0
	zero: DD 0
	size_str: DD 6

	string: DB 'hello!'
	ptr_str: DD string
	reversed_ptr: DD reversed_str

.bss
	last_ptr: RESD 1
	reversed_str: RESB 6

.stack 10




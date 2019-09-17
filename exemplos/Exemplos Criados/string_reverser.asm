;==================================
;File: 
;Description:
;Author: 
;Version: 
;=================================

.code

for:
	LDA string
	SOP push
	
	LDA ptr_str
	ADD one	
	STA ptr_str
	
	LDA index
	ADD one
	STA index	
	
	LDA size_str
	SUB index
	JZ end
	JMP for
	
end:
	INT exit

.data
	;syscall exit
	exit: DD 25
	push: DD 0
	pop: DD 0
	one: DD 1
	index: DD 0
	size_str: DD 6
	string: DB 'hello!'
	ptr_str: DD string

.stack 10


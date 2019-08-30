.code

read_char:
	LDA keyboard_address
	INT input
	STA char

	;if char == '':
if_has_not_input:
	SUB has_not_input
	JZ return_result

	;if char == ENTER:
if_enter:
	LDA char
	SUB enter_ascii
	JZ return_result

	;if char == '-':
if_is_negative:
	LDA char
	SUB signal_ascii
	JZ set_negative

	;res = char - '0' + res*10;
is_a_digit:
	LDA char
	SUB zero_ascii
	STA char
	LDA res
	SOP push
	MOV 10
	SOP push
	CALL multiply
	SOP pop 
	SOP pop 
	ADD char
	STA res
	JMP read_char

	;is_negative = 1
set_negative:
	MOV 1
	STA is_negative
	JMP read_char

	;if is_negative == 0:
return_result:
	MOV 0
	SUB is_negative
	JZ end

	;if is_negative != 0:
	;calculates 2's complement:
	;res = 0 - res
	MOV 0
	SUB res
	STA res

end:
	INT exit

;==================================
multiply:
	MOV $sp     ; end. topo pilha
	ADD one     ; end. param. funcao
	STA ptr  
	LDI ptr     ; recupera b
	STA var1
	LDA ptr
	ADD one
	STA ptr  
	LDI ptr     ; recupera a
	STA var2
	LDA zero    ; zera var3
	STA var3    

while_m:
	LDA var2    
	SUB zero
	JZ end_m

	; if (b ^ 1)
if_m:
	LDA var2   
	NAND one
	STA t
	LDA t   
	NAND t
	JZ end_if_m

then_m:  
	LDA var3    ; var3 += var1
	ADD var1
	STA var3
 
end_if_m:
	LDA var1	; var1 <<= 1
	SHIFT one
	STA var1

	LDA var2   ; var2 >>= 1
	SHIFT zero
	STA var2

	JMP while_m

end_m:	
	LDA var3
	STI ptr
	RET
;==================================

.data
	;states a negative number
	is_negative: DD 0
	;states has not input
	has_not_input: DD 0
	;ascii code for '-'
	signal_ascii: DD 45
	;ascii code for '0'
	zero_ascii: DD 48
	;ascii code for 'Enter'
	enter_ascii: DD 13

	; Endereço de teclado formatado para copia no AC
	; Ac High | Ac Low
	; b00000001 | b00000000
	keyboard_address: DD 256

	;codigo de interrupcao de input
	input: DD 20

	;syscall exit
	exit: DD 25

	one: DD 1
	zero: DD 0
	push: DD 0
	pop: DD 1

.bss
	;result
	res: RESD 1
	;read char
	char: RESD 1

	;====================
	;multiply local vars
	;====================
	var1: RESD 1 ; local var
	var2: RESD 1 ; local var 
	var3: RESD 1 ; var3 = var1 + var2
	t: RESD 1    ; local var
	ptr: RESD 1  ; acesso a pilha

.stack 10

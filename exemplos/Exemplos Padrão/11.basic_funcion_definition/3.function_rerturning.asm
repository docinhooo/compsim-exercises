.code
;==================================
;Arquivo: 2.function_parameter_pass
; ing.asm
;Proposito: Chama a funcao print,
; que recebe um char como parametro
; e imprime na saida.
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; char var = 'A'
; int one = 1
; char next_char(char a){
;   return a + 1
; }
; void print(char a){
;   putchar(a)
; }
; 
; print(next_char(var))
; exit()
;==================================

    ; Parametro da funcao na pilha
    LDA var
    SOP push
    
    ;next_char(a)
    CALL next_char

    SOP pop
    SOP push

    ;print_char(a)
    CALL print
    
    ;encerra programa
    JMP end

next_char:
    MOV $sp     ; end. topo pilha
    ADD one     ; end. param. funcao
    STA ptr  
    LDI ptr     ; param. funcao
    ADD one
    STI ptr
    RET

print:
    MOV $sp     ; end. topo pilha
    ADD one     ; end. param. funcao
    STA ptr  
    LDI ptr     ; param. funcao
    ADD video_address
    INT output ; imprime
    RET

end:
    INT exit

.data
    var: DB 'A'
    one: DD 1
     
    push: DD 0
    pop: DD 1

	; Endereço de video formatado para copia no AC
	; Ac High | Ac Low
	; b00000000 | b00000000
	video_address: DD 0

    ; syscall putchar
    output: DD 21

    ; syscall exit
    exit: DD 25

.bss 
    ptr: RESD 1

.stack 10

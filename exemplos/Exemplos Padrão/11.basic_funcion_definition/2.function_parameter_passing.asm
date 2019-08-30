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
; void print(char a){
;   putchar(a)
; }
; 
; print(var)
; exit()
;==================================

    ; Parametro da funcao na pilha
    LDA var
    SOP push
    
    ;print_char(a)
    CALL print
    
    ;encerra programa
    JMP end

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

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
; char a = 'A'
; char b = 'B'
;
; void print_a(){
;   putchar(a)
; }
; void print_b(){
;   putchar(b)
; }
; void print_ab(){
;   print_a()
;   print_b()
; }
;
; print_ab()
; exit()
;==================================

    CALL print_ab
    JMP end

print_ab:
    CALL print_a
    CALL print_b
    RET

print_a:
    LDA a
    ADD video_address
    INT output
    RET

print_b:
    LDA b
    ADD video_address
    INT output
    RET

end:
    INT exit

.data
    a: DB 'A'
    b: DB 'B'
    
    ; Endereço de video formatado para copia no AC
	; Ac High | Ac Low
	; b00000000 | b00000000
	video_address: DD 0

    ; syscall putchar
    output: DD 21

    ; syscall exit
    exit: DD 25

	
.stack 10





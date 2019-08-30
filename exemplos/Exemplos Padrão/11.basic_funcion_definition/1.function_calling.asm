.code
;==================================
;Arquivo: 1.function_calling.asm
;Proposito: Chama a funcao print_ch
; ar, que imprime um caractere na 
; saida.
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; char a = 'A'
; void print_char(){
;   putchar(a)
; }
; 
; print_char()
; print_char()
; exit()
;==================================

    CALL print_char
    CALL print_char
    CALL end

print_char:
    LDA a
    ADD video_address
    INT output
    RET
    
end:
    INT exit

.data
    a: DB 'A'
    
    ; syscall putchar
    output: DD 21

	; Endereço de video formatado para copia no AC
	; Ac High | Ac Low
	; b00000000 | b00000000
	video_address: DD 0


    ; syscall exit
    exit: DD 25

	
.stack 10

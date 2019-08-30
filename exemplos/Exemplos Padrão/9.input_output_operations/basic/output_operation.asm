.code
;==================================
;Arquivo: output_operation.asm
;Proposito: Escreve um caractere na 
; saída padrão (video).
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; char a = 'A'
; putchar(a)
; exit()
;==================================

    ;carrega em AC o char 'A'
    LDA a
    
    ;adiciona o endereço de io do video
    ADD video_address

    ;syscall putchar
    INT output

    ;encerra a aplicacao
    INT exit

.data
    ;char que sera impresso
    a: DB 'A'
    
    ; video io address
    video_address: DD 0
    
    ;output interruption
    output: DD 21
      
    ;syscall exit
    exit: DD 25
      
.stack 1





.code
;==================================
;Arquivo: addition.asm
;Proposito: Demonstra operacao 
; basica de adicao.
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; int a = 10
; int b = 1
; a = a + b
; exit()
;==================================

    ; carrega o valor de a no AC
    LDA a
    
    ; soma o valor de b ao de AC
    ADD  b

    ; armazena o valor de AC em a
    STA  a

    ; finaliza o programa
end: 
    INT exit


.data
    a: DD 10 
    b: DD 1  

    ; syscall exit
    exit: DD 25


.stack 10       ; Stack size




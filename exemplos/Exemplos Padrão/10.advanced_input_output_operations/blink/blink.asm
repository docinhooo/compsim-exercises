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

blink:
    LDA high
    ADD arduino_portB
    INT output

loop:
    MOV 2
    SUB contador
    JZ  no_blink    
    ;contador += 1
    MOV 1
    ADD contador
    STA contador
    JMP loop

no_blink:
    LDA down
    ADD arduino_portB
    INT output

    ;contador = 0
    MOV 0
    STA contador

loop2:
    MOV 2
    SUB contador
    JZ  blink    
    ;contador += 1
    MOV 1
    ADD contador
    STA contador
    JMP loop2

    ;encerra a aplicacao
    INT exit

.data
    ;bits de operacao
    high: DD 32  ;b1000000
    down: DD 0   ;b0000000

    ;endereço da porta B: 
   ;b00000011 00000000
    arduino_portB: DD 512
    
    ;syscall putchar
    output: DD 21
    
    contador: DD 0

    ;syscall exit
    exit: DD 25
      
.stack 1








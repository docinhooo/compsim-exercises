.code
    ; carrega o valor de a no AC
    LDA  a
    ; guarda AC na pilha
    SOP push
    ; retira da pilha para AC
    SOP pop
    ; finaliza o programa
    INT exit

.data
    a: DD 10
      
    push: DD 0
    pop: DD 1

    exit: DD 25
    
.stack 10       ; Stack size



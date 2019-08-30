.code

    MOV 1
    ADD a
	STA b

end:
    INT exit

.data
    a: DD 10

    ;syscall exit
    exit: DD 25

.bss
    b: RESD 1

.stack 10

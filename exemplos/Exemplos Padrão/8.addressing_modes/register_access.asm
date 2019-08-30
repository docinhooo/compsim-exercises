.code

    MOV $CS
    STA cs

    MOV $DS
    STA ds

    MOV $SS
    STA ss

    MOV $SP
    STA sp

end:
    INT exit

.data
    ;syscall exit
    exit: DD 25

.bss
    cs: RESD 1
    ds: RESD 1
    ss: RESD 1
    sp: RESD 1

.stack 10

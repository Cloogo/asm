#  8byte[    ] high
#       [    ]
#       [$len]
#       [$msg]
#       [ret ]
#       [%rbp]
#       [    ] low
.data
    msg:
    .ascii "Hello,Cloogo!\n"
    len=.-msg

.text
.global _start

.type echoMsg,@function
    echoMsg:
        push %rbp
        mov %rsp,%rbp
        mov 16(%rbp),%rsi
        mov 24(%rbp),%rdx
        mov $1,%rax
        mov $1,%rdi
        syscall
        pop %rbp
        ret

_start:
    nop
    push $len
    push $msg
    call echoMsg
    
    add $16,%rsp

exit:
    mov $60,%rax
    mov $1,%rdi
    syscall

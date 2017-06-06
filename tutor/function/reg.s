.data
    user:
    .ascii "Cloogo"
    lenUser=.-user
    greet:
    .ascii "Hello "
    lenGreet=.-greet

.text
.global _start
.type echoMsg,@function

echoMsg:
    mov $1,%rax
    mov $1,%rdi
    syscall
    ret

_start:
    nop
    mov $greet,%rsi
    mov $lenGreet,%rdx
    call echoMsg

    lea user,%rsi
    mov $lenUser,%rdx
    call echoMsg

ExitProgram:
    mov $60,%rax
    mov $0,%rdi
    syscall

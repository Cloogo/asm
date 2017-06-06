.data
    user:
    .ascii "Cloogo"
    lenUser=.-user
    greet:
    .ascii "Hello "
    lenGreet=.-greet
.bss
    .lcomm stringPtr,8
    .lcomm len,4

.text
.global _start
.type echoMsg,@function
echoMsg:
    mov $1,%rax
    mov $1,%rdi
    mov stringPtr,%rsi
    mov len,%rdx
    syscall
    ret

_start:
    nop
    lea greet,%rdx
    mov %rdx,stringPtr
    mov $lenGreet,%rdx
    mov %rdx,len
    call echoMsg

    lea user,%rdx
    mov %rdx,stringPtr
    mov $lenUser,%rdx
    mov %rdx,len
    call echoMsg

Exit:
    mov $60,%rax
    mov $0,%rdi
    syscall


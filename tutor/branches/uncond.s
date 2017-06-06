.data
    user:
    .ascii "Cloogo!"
    len=.-user

.text
.global _start
_start:
    nop
    call printUser
    jmp exitProgram

printUser:
    mov $1,%rax
    mov $1,%rdi
    mov $user,%rsi
    mov $len,%rdx
    syscall
    ret

exitProgram:
    mov $60,%rax
    mov $1,%rdi
    syscall

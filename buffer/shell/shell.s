.data
    filename:
    .asciz "/bin/bash"
    nul1:
    .double 0
    args:
    .double 0
    env:
    .double 0
.text
.global _start
_start:
    lea filename,%rax
    mov %rax,args
    mov $filename,%rdi
    mov $args,%rsi
    mov $env,%rdx
    mov $59,%rax
    syscall

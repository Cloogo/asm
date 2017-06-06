#as -gstabs -o variables.o variables.s
#ld -o variables variables
.data
    msg:
    .ascii "Hello world!\n"

    mask:
    .byte 0x10

    type:
    .short 0x1000

    len:
    .int 0x100000

    fac:
    .float 10.23

    scale:
    .double 1.35

    mems:
    .int 10,20,30,40,50

.bss
    .comm   buffer,10000

.text
    .global _start
    _start:
        nop
        mov $60,%rax
        mov $0,%rdi
        syscall



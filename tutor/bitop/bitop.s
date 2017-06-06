.data
    num:

.text
.globl _start
_start:
    movabs $0x1000000000000000,%rbx
    movb $2,%al
    sal %rbx


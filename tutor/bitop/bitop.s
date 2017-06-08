.text
.globl _start
_start:
    movabs $0xFFFFFFFFFFFFFFFF,%rbx
    sal %rbx
    sar %rbx

    shl %rbx
    shr %rbx
    shl %rbx

    movb $2,%cl
    sal %cl,%rbx
    sar %cl,%rbx

    shl %cl,%rbx
    shr %cl,%rbx

    movabs $0xFFFFFFFFFFFFFFFE,%rbx
    rol %cl,%rbx
    ror %cl,%rbx

    rcl %cl,%rbx
    rcr %cl,%rbx

    clc
    movabs $0xFFFFFFFFFFFFFFF4,%rbx
    mov $0,%cl
    bt %rcx,%rbx
    mov $2,%cl
    bt %rcx,%rbx

    clc
    movabs $0xFFFFFFFFFFFFFFF4,%rbx
    mov $0,%cl
    bts $0,%rbx
    mov $1,%cl
    btc %rcx,%rbx
    mov $2,%cl
    btr %rcx,%rbx

    clc
    movabs $0xFFFFFFFFFFFFFFF4,%rbx
    bsf %rbx,%rax
    bsr %rbx,%rbx

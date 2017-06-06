.data
    setMsg:
    .ascii "Zero Flag is set!\n"
    lenSet=.-setMsg

    notSetMsg:
    .ascii "Zero Flag isn't set!\n"
    lenNotSet=.-notSetMsg

    greetMsg:
    .ascii "Hello Cloogo!\n"
    lenGreet=.-greetMsg

.text
.global _start
_start:
#Note:
#1.In order to use conditional jumps you must hava an operation which set the eflags register appropriately.
#2.Only short and near jumps are supported.

#    mov $10,%rax
#    sub %rax,%rax
    xor %rax,%rax
#    mov $10,%rax
#    test $10,%rax
#    jz ZeroFlagSet
    jz PrintGreetMsg

ZeroFlagNotSet:
    mov $1,%rax
    mov $1,%rdi
    mov $notSetMsg,%rsi
    mov $lenNotSet,%rdx
    syscall
    jmp ExitProgram

ZeroFlagSet:
    mov $1,%rax
    mov $1,%rdi
    mov $setMsg,%rsi
    mov $lenSet,%rdx
    syscall
    jmp ExitProgram

PrintGreetMsg:
    mov $10,%rcx
    PrintTenTimes:
        push %rcx   #rcx used in syscall
        mov $1,%rax
        mov $1,%rdi
        mov $greetMsg,%rsi
        mov $lenGreet,%rdx
        syscall
        pop %rcx
        loop PrintTenTimes
#    loopz PrintTenTimes ;ZF=1&&%rcx!=0
#   loopzn  PrintTenTimes;ZF=0&&%rcx!=0

ExitProgram:
    mov $60,%rax
    mov $0,%rdi
    syscall

.data
    Byte:
    .byte 0
    Short:
    .short 0
    Int:
    .int 0
    Array:
    .int 0,1,2,3,4
.bss
    .comm buffer,1000

.text
.global _start
_start:
    nop
#mov immediate value into register
    mov $1,%rax
    movb $1,%al

#mov data between registers
    mov %rax,%rbx

#mov data from register(memory) to memory(register)
    mov %rax,Byte
    mov Byte,%rax

#mov immediate value into memory
    movb $2,Byte
    movw $2,Short
    movl $2,Int

#mov data into an indexed memory location
#Location is defined by BaseAddress(Offset,Index,Datasize)
#offset and index must be registers,datasize can be a numerical value
    mov $0,%rax
    mov $2,%rdi
    movl $20,Array(%rax,%rdi,4)

#indirect addressing using registers
    mov $Int,%rax #$lable get the address of lable
    mov (%rax),%rbx
    movl $20,(%rax)

#exit syscall to exit program
    mov $60,%rax
    syscall

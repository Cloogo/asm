.data
    msg:
    .ascii "Clocgo! oh"
    nickname:
    .asciz "Cloogo!"
    len=. -nickname

.bss
    .lcomm msgBuffer,100
    .lcomm userBuffer,100
.text
.global _start
_start:
    nop

#rsi point to memory location of source string
#rdi point to memory location of destination string
    mov $msg,%rsi
    mov $msgBuffer,%rdi
#using movsx
    movsb
    movsw
    movsl

#set/reset DF
    std #rsi and rdi are decremented
    cld #rsi and rdi are incremented

#using rep
    mov $nickname,%rsi
    mov $userBuffer,%rdi
    mov $len,%rcx
    cld
    rep movsb

#move string from memory into register rax.
    lea nickname,%rsi #equal to mov $nickname,%rsi
    cld
    lodsb

    dec %rsi
    lodsw

    sub $2,%rsi
    lodsl

#move string from rax to memory
    lea userBuffer,%rdi
    stosb
    stosw
    stosl

#cmps
    lea msg,%rsi
    lea nickname,%rdi

    cmpsb

    dec %rsi
    dec %rdi
    cmpsw

    sub $2,%rsi
    sub $2,%rdi
    cmpsl

#repz cmps
    cld
    lea msg,%rsi
    lea nickname,%rdi

    mov $len,%rcx
    xor %ax,%ax
    repz cmpsb

#exit program
    mov $60,%rax
    syscall

.section .rodata
format_d:       .string "hey: %d\n"
format_invalid:  .string "invalid option!\n"


.text

.globl pstrlen
    .type pstrlen, @function
pstrlen:
    movzbl (%rdi), %rax
    ret


.globl replaceChar
    .type replaceChar, @function
replaceChar:
    movq %rdi, %r9
    call pstrlen
    movq $0, %rcx
loop:
    add $1, %rdi
    movzbl (%rdi), %r8
    cmp %r8, %rsi
    je changeChar
continue:
    add $1, %rcx
    cmp %rcx, %rax
    ja loop
    movq %r9, %rax
    ret


changeChar: #swap the char
    movb %dl, (%rdi)
    jmp continue


.globl swapCase
    .type swapCase, @function
swapCase:
    movq %rdi, %r9
    call pstrlen
    movq $0, %rcx
loop1:
    add $1, %rdi
    movb (%rdi), %cl
    # we first see if the number is smaller than 91 and than from 123
    # because if it smaller that 91 it can't be in small case
    cmp $91, %cl     # check if smaller than 'Z' 
    jb .L1
    cmp $123, %cl    # check if smaller than 'z' 
    jb .L2


continue1:
    add $1, %rcx
    cmp %rcx, %rax
    jb loop1
    movq %r9, %rax
    ret
# we already know that the char is smaller or equal 'z'
.L2:
    cmp $96, %cl    # check if greater than 'a'
    ja upCase
    jmp continue1
# we already know that the char is smaller or equal 'Z'
.L1:
    cmp $64, %cl    # check if greater than 'A'
    ja downCase
    jmp continue1

downCase:
    add $32, %cl
    movb %cl, (%rdi)
    jmp continue1

upCase: #swap the char
    sub $32, %cl
    movb %cl, (%rdi)
    jmp continue1

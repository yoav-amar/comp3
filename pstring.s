.section .rodata
format_d:       .string "hey: %d\n"
format_invalid:  .string "invalid option!\n"
format_invalid_input:   .string "invalid input!\n"


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

.globl pstrijcpy
    .type pstrijcpy, @function
pstrijcpy:
    #save the first pstring (because we need to return it)
    pushq %rdi
    # checking if the index is smaller that the len of the first pstring
    call pstrlen
    # compare the len of the string with the index of the end
    # (because j is greater that i).
    cmp %rax, %rcx
    je invalid_input
    ja invalid_input
    # now checking if the index is smaller that the len of the second pstring
    movq %rsi, %rdi
    call pstrlen
    cmp %rax, %rcx
    je invalid_input
    ja invalid_input
    popq %rdi   # we take the first pstring and that return it to the stack
    pushq %rdi
    add $1, %rdi    # we going to the start of the string
    add %rdx, %rdi  # moving fowrd to the i'th index
    add $1, %rsi    # we going to the start of the string
    add %rdx, %rsi  # moving fowrd to the i'th index
loop2:
    movb (%rsi), %r8b
    movb %r8b, (%rdi)
    add $1, %rdx
    add $1, %rdi
    add $1, %rsi
    cmp %rdx, %rcx
    ja loop2
    je loop2
continue2:
    popq %rdi
    movq %rdi, %rax
    ret


invalid_input:
    movq $format_invalid_input, %rdi
    movq $0, %rax
    call printf
    jmp continue2

.globl pstrijcmp
    .type pstrijcmp, @function
pstrijcmp:
    # save the first pstring 
    pushq %rdi
    # checking if the index is smaller that the len of the first pstring
    call pstrlen
    # compare the len of the string with the index of the end
    # (because j is greater that i).
    cmp %rax, %rcx
    je invalid_input1
    ja invalid_input1
    # now checking if the index is smaller that the len of the second pstring
    movq %rsi, %rdi
    call pstrlen
    cmp %rax, %rcx
    je invalid_input1
    ja invalid_input1
    popq %rdi   # we take the first pstring and that return it to the stack
    add $1, %rdi    # we going to the start of the string
    add %rdx, %rdi  # moving fowrd to the i'th index
    add $1, %rsi    # we going to the start of the string
    add %rdx, %rsi  # moving fowrd to the i'th index
loop3:
    movb (%rsi), %r8b
    movb (%rdi), %r9b
    cmp %r8b, %r9b
    ja big
    jb small
    add $1, %rdx
    add $1, %rdi
    add $1, %rsi
    cmp %rdx, %rcx
    ja loop3
    je loop3
    movq $0, %rax
continue3:
    ret

big:
    movq $1, %rax
    jmp continue3

small:
    movq $-1, %rax
    jmp continue3

invalid_input1:
    movq $format_invalid_input, %rdi
    movq $0, %rax
    call printf
    popq %rdi # we pop back to rdi in order that the 'ret' will be OK
    movq $-2, %rax
    jmp continue3

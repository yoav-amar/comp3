.globl swapCase
    .type swapCase, @function
swapCase:
    movq %rdi, %r9
    movq $0, %r9    #remove
    call pstrlen
    movq $0, %rcx
loop1:
    add $1, %rdi
    movb (%rdi), %cl
    cmp $123, %cl    #check if smaller than 'z' 
    ja .L2
    cmp $91, %cl     #check if smaller than 'Z' 
    ja .L1

continue1:
    add $1, %rcx
    cmp %rcx, %rax
    jb loop1
    movq %r9, %rax
    ret
#we already know that the char is smaller or equal 'z'
.L2:
    cmp $96, %cl    #check if greater than 'a'
    jb upCase
#we already know that the char is smaller or equal 'Z'
.L1:
    cmp $64, %cl    #check if greater than 'A'
    jb downCase

downCase:
    sub $32, %cl
    movb %cl, (%rdi)
    jmp continue1

upCase: #swap the char
    add $32, %cl
    movb %cl, (%rdi)
    jmp continue1
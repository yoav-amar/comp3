


.text

.globl pstrlen
    .type pstrlen, @function
pstrlen:
    movzbl (%rdi), %rax
    ret


.globl replaceChar
    .type replaceChar, @function
replaceChar:
    call pstrlen
    movq $0, %rcx
loop:
    add $8, %rdi
    add $1, %rcx
    cmp %rcx, %rax
    jg loop
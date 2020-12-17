.section .rodata
format_d:       .string "%lu"
format_print:   .string "x+y=%lu\n"

.text
.globl main
.type main, @function
main:
    push    %rbp
    push    %rbx
    movq    %rsp, %rbp

    sub     $8, %rsp

    movq    $format_d, %rdi
    leaq    -8(%rbp), %rsi
    movq    $0, %rax
    call    scanf

    movq    -8(%rbp), %rbx

    movq    $format_d, %rdi
    leaq    -8(%rbp), %rsi
    movq    $0, %rax
    call    scanf

    movq    $format_print, %rdi
    movq    -8(%rbp), %rsi
    addq    %rbx, %rsi
    movq    $0, %rax
    call    printf

    movq    %rbp, %rsp
    pop     %rbx
    pop     %rbp

    xorq    %rax, %rax
    ret    

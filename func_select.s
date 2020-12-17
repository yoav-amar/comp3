.section .rodata
format_d:       .string "%lu"
format_print:   .string "x+y=%lu\n"

.align 8 # Align address to multiple of 8
.jump_table:
    .quad .L1 # Case 50 or 60: print strings
    .quad .L2 # Case defualt: invalid option
    .quad .L3 # Case 52 : replaceChar
    .quad .L4 # Case 53 : pstrijcpy 
    .quad .L5 # Case 54 : swapCase
    .quad .L6 # Case 55 : print strings



.text

l1:
    call aa
    jmp done
l2:
    call bb
    jmp done
l3:
    call cc
    jmp done
l4:
    call dd
    jmp done
l5:
    call ee
    jmp done
l6:
    call ff
    jmp done
    
.globl select
.type select, @function
select:
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

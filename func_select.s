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


    
.globl select
.type select, @function
select:
    push    %rbp
    movq    %rsp, %rbp

    sub $50, %rdi
    cmpq $10, %rdi
    je .l1
    cmpq $5, %rdi
    ja .l2
    jmp *.jump_table(,%rdi,8)

.l1:
    call aa
    jmp .done
.l2:
    call bb
    jmp .done
.l3:
    call cc
    jmp .done
.l4:
    call dd
    jmp .done
.l5:
    call ee
    jmp .done
.l6:
    call ff
    jmp .done

.done:
    movq    %rbp, %rsp
    pop     %rbp

    ret    

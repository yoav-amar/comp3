.section .rodata
format_d:       .string "hey"
format_invalid:  .string "invalid option!\n"
format_print:   .string "length: %d, string: %s\n"
format_lengths: .string "first pstring length: %d, second pstring length: %d\n"

.align 8 # Align address to multiple of 8
.L10:
    .quad .L1 # Case 50 or 60: print strings
    .quad .L2 # Case defualt: invalid option
    .quad .L3 # Case 52 : replaceChar
    .quad .L4 # Case 53 : pstrijcpy 
    .quad .L5 # Case 54 : swapCase
    .quad .L6 # Case 55 : print strings



.text


    
.globl run_func
.type run_func, @function
run_func:
    push    %rbp
    movq    %rsp, %rbp

    sub $50, %rdi
    cmpq $10, %rdi
    je .L1
    cmpq $5, %rdi
    ja .L2
    jmp *.L10(,%rdi,8)

.L1:
    movq %rsi, %rdi
    call pstrlen
    movq %rax, %rsi
    movq %rdx, %rdi
    call pstrlen
    movq %rax, %rdx
    movq $format_lengths, %rdi
    movq $0, %rax
    call printf
    jmp .done

.L2:    #defualt
    movq $format_invalid, %rdi  # print invalid option
    xorq %rax, %rax    # make rax 0 before calling printf
    call printf
    jmp .done
.L3:
    movq $0, %rax
    call cc
    jmp .done
.L4:
    movq $0, %rax
    call dd
    jmp .done
.L5:
    pushq %rdx
    movq %rsi, %rdi
    call swapCase
    movq %rax, %rdx
    add $1, %rdx
    movq %rax, %rdi
    call pstrlen
    movq %rax, %rsi    
    movq $0, %rax
    movq $format_print, %rdi
    call printf
    popq %rdi
    call swapCase
    movq %rax, %rdx
    add $1, %rdx
    movq %rax, %rdi
    call pstrlen
    movq %rax, %rsi    
    movq $0, %rax
    movq $format_print, %rdi
    call printf
    jmp .done
.L6:
    movq $0, %rax
    call ff
    jmp .done
.done:
    movq    %rbp, %rsp
    pop     %rbp

    ret    

	.section	.rodata			#read only data section
format1:	.string	"bb %d bb\n"	#c+b
format2:	.string	"%ld*2^%d = %ld\n"	#a*2^c
	########
	.text	#the beginnig of the code
.globl	main	#the label "main" is used to state the initial point of this program
	.type	main, @function	# the label "main" representing the beginning of a function
main:	# the main function:
	pushq	%rbp		#save the old frame pointer
	movq	%rsp, %rbp	#create the new frame pointer
	pushq	%rbx		#saving a callee save register.
    movq $0, %rax
    movq $84, %rsi
    movq	$format1,%rdi	#the string is the first paramter passed to the printf function.
    call printf

    	#return from printf 2nd time - end of program:
	movq	$0, %rax	#return value is zero.
	movq	-8(%rbp), %rbx	#restoring the save register (%rbx) value, for the caller function.
	movq	%rbp, %rsp	#restore the old stack pointer - release all used memory.
	popq	%rbp		#restore old frame pointer (the caller function frame)
	ret			#return to caller function (OS).



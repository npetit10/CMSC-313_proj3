	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"rb"
.LC1:
	.string	"Error opening file"
.LC2:
	.string	"%08lx "
.LC3:
	.string	"%02x "
.LC4:
	.string	"   "
.LC5:
	.string	" |"
.LC6:
	.string	"|"
	.text
	.globl	hex_dump
	.type	hex_dump, @function
hex_dump:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L16
	movl	$8256, %r14d
	leaq	.LC4(%rip), %r13
	leaq	.LC3(%rip), %r12
	jmp	.L2
.L16:
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L4:
	movq	%r13, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.L5:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L17
.L6:
	cmpq	%rbp, %rbx
	jnb	.L4
	movzbl	(%rbx,%r15), %edx
	movq	%r12, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L5
.L17:
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r15
	leaq	16(%rsp), %rbx
	addq	%rbx, %rbp
	jmp	.L9
.L7:
	movl	$46, %edi
	call	putchar@PLT
.L8:
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	je	.L18
.L9:
	movzbl	(%rbx), %edi
	movzbl	%dil, %edx
	movq	(%r15), %rax
	testb	$64, 1(%rax,%rdx,2)
	je	.L7
	movzbl	%dil, %edi
	call	putchar@PLT
	jmp	.L8
.L18:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	addq	$16, %r14
.L2:
	leaq	16(%rsp), %rdi
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L19
	movq	%r14, %rdx
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %ebx
	leaq	16(%rsp), %r15
	jmp	.L6
.L19:
	movq	8(%rsp), %rdi
	call	fclose@PLT
.L1:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
	.size	hex_dump, .-hex_dump
	.section	.rodata.str1.1
.LC7:
	.string	"Usage: %s <filename>\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpl	$2, %edi
	je	.L22
	movq	(%rsi), %rcx
	leaq	.LC7(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %eax
.L21:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	call	hex_dump
	movl	$0, %eax
	jmp	.L21
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

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
	.section	.text.unlikely,"ax",@progbits
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4
	.globl	hex_dump
	.type	hex_dump, @function
hex_dump:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rsi
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
	call	fopen@PLT
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L15
	movq	$8256, (%rsp)
	leaq	16(%rsp), %rbp
	leaq	.LC4(%rip), %r13
	leaq	.LC3(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L2:
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	fread@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L19
	movq	(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	movl	$2, %edi
	call	__printf_chk@PLT
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L21:
	movzbl	0(%rbp,%r14), %edx
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	$16, %r14
	je	.L20
.L6:
	cmpq	%rbx, %r14
	jb	.L21
	movq	%r13, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	$16, %r14
	jne	.L6
.L20:
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movq	%rbp, %r15
	addq	%rbp, %rbx
	movl	$2, %edi
	call	__printf_chk@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L9:
	movzbl	(%r15), %ecx
	movq	(%r14), %rax
	movq	%rcx, %rdi
	testb	$64, 1(%rax,%rcx,2)
	jne	.L17
	movl	$46, %edi
.L17:
	call	putchar@PLT
	addq	$1, %r15
	cmpq	%r15, %rbx
	jne	.L9
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	addq	$16, (%rsp)
	jmp	.L2
.L19:
	movq	8(%rsp), %rdi
	call	fclose@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L22
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
.L22:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	hex_dump.cold, @function
hex_dump.cold:
.LFSB25:
.L15:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L23
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leaq	.LC1(%rip), %rdi
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
	jmp	perror@PLT
.L23:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
	.text
	.size	hex_dump, .-hex_dump
	.section	.text.unlikely
	.size	hex_dump.cold, .-hex_dump.cold
.LCOLDE7:
	.text
.LHOTE7:
	.section	.rodata.str1.1
.LC8:
	.string	"Usage: %s <filename>\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpl	$2, %edi
	je	.L25
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC8(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %eax
.L24:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	call	hex_dump
	xorl	%eax, %eax
	jmp	.L24
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

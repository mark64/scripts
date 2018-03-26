	.file	"ice.c"
	.text
	.p2align 4,,15
	.globl	time_to_read
	.type	time_to_read, @function
time_to_read:
.LFB540:
	.cfi_startproc
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, start(%rip)
	movzbl	(%rdi), %eax
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	start(%rip), %rax
	ret
	.cfi_endproc
.LFE540:
	.size	time_to_read, .-time_to_read
	.p2align 4,,15
	.globl	evict_ptr
	.type	evict_ptr, @function
evict_ptr:
.LFB541:
	.cfi_startproc
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE541:
	.size	evict_ptr, .-evict_ptr
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"cached: %llu\nuncached: %llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB542:
	.cfi_startproc
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	leaq	63(%rsp), %rdi
	movb	$5, 63(%rsp)
	movq	%rdi, access_ptr(%rip)
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, start(%rip)
	movzbl	63(%rsp), %eax
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	start(%rip), %rax
	movq	%rax, (%rsp)
	rdtsc
	movq	%rax, %rsi
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rsi
	movq	%rsi, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
	rdtsc
	movq	%rax, %r12
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r12
	movq	%r12, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %r15
	salq	$32, %rdx
	orq	%rdx, %r15
	rdtsc
	movq	%rax, %rbp
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rbp
	movq	%rbp, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
	rdtsc
	movq	%rax, %rbx
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rbx
	movq	%rbx, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r8
	orq	%rdx, %r8
	movq	%r8, 8(%rsp)
	rdtsc
	movq	%rax, %r11
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r11
	movq	%r11, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r10
	orq	%rdx, %r10
	movq	%r10, 16(%rsp)
	rdtsc
	movq	%rax, %r10
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r10
	movq	%r10, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r9
	orq	%rdx, %r9
	movq	%r9, 24(%rsp)
	rdtsc
	movq	%rax, %r9
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r9
	movq	%r9, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r13
	orq	%rdx, %r13
	movq	%r13, 32(%rsp)
	rdtsc
	movq	%rax, %r13
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r13
	movq	%r13, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r8
	orq	%rdx, %r8
	movq	%r8, 40(%rsp)
	rdtsc
	movq	%rax, %r8
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r8
	movq	%r8, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	addq	%r12, %rsi
	salq	$32, %rdx
	addq	%rsi, %rbp
	orq	%rdx, %rax
	addq	%rbp, %rbx
	addq	%rbx, %r11
	addq	%r11, %r10
	addq	%r10, %r9
	addq	%r13, %r9
	addq	%r9, %r8
	subq	%r8, %rcx
	leaq	(%rcx,%r15), %rdx
	addq	%r14, %rdx
	addq	8(%rsp), %rdx
	addq	16(%rsp), %rdx
	addq	24(%rsp), %rdx
	addq	32(%rsp), %rdx
	addq	40(%rsp), %rdx
	addq	%rax, %rdx
	addq	(%rsp), %rdx
	movabsq	$-3689348814741910323, %rax
	mulq	%rdx
	shrq	$3, %rdx
	movq	%rdx, 8(%rsp)
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, start(%rip)
	movzbl	63(%rsp), %eax
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	start(%rip), %rax
	movq	%rax, (%rsp)
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %rsi
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rsi
	movq	%rsi, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %rbp
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rbp
	movq	%rbp, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %r15
	salq	$32, %rdx
	orq	%rdx, %r15
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %rbx
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rbx
	movq	%rbx, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %r11
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r11
	movq	%r11, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r10
	orq	%rdx, %r10
	movq	%r10, 16(%rsp)
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %r10
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r10
	movq	%r10, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r9
	orq	%rdx, %r9
	movq	%r9, 24(%rsp)
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %r9
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r9
	movq	%r9, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	movq	%rax, %r13
	salq	$32, %rdx
	orq	%rdx, %r13
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %r12
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r12
	movq	%r12, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r8
	orq	%rdx, %r8
	movq	%r8, 32(%rsp)
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %r8
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %r8
	movq	%r8, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, 40(%rsp)
#APP
# 31 "ice.c" 1
	clflush (%rdi)
# 0 "" 2
#NO_APP
	rdtsc
	movq	%rax, %rdi
	movzbl	63(%rsp), %eax
	salq	$32, %rdx
	orq	%rdx, %rdi
	movq	%rdi, start(%rip)
	movb	%al, a(%rip)
	rdtsc
	addq	%rbp, %rsi
	salq	$32, %rdx
	addq	%rsi, %rbx
	orq	%rdx, %rax
	movq	8(%rsp), %rsi
	addq	%rbx, %r11
	addq	%r11, %r10
	addq	%r10, %r9
	addq	%r12, %r9
	addq	%r9, %r8
	addq	%r8, %rdi
	subq	%rdi, %rcx
	leaq	.LC0(%rip), %rdi
	leaq	(%rcx,%r15), %rdx
	addq	%r14, %rdx
	addq	16(%rsp), %rdx
	addq	24(%rsp), %rdx
	addq	%r13, %rdx
	addq	32(%rsp), %rdx
	addq	40(%rsp), %rdx
	addq	%rax, %rdx
	addq	(%rsp), %rdx
	movabsq	$-3689348814741910323, %rax
	mulq	%rdx
	xorl	%eax, %eax
	shrq	$3, %rdx
	call	printf@PLT
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
	.cfi_endproc
.LFE542:
	.size	main, .-main
	.comm	a,1,1
	.comm	start,8,8
	.comm	access_ptr,8,8
	.ident	"GCC: (Debian 7.2.0-18) 7.2.0"
	.section	.note.GNU-stack,"",@progbits

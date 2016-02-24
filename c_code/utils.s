	.file	"utils.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"utils.c"
	.align 8
.LC1:
	.string	"res != -1 && \"failure with clock_gettime\""
	.text
	.globl	current_time_ns
	.type	current_time_ns, @function
current_time_ns:
.LFB2:
	.file 1 "utils.c"
	.loc 1 18 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 32 0
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	clock_gettime
	movl	%eax, -20(%rbp)
	.loc 1 33 0
	cmpl	$-1, -20(%rbp)
	jne	.L2
	.loc 1 33 0 is_stmt 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.2888, %ecx
	movl	$33, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
.L2:
	.loc 1 34 0 is_stmt 1
	movq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	.LC3(%rip), %xmm0
	jnb	.L3
	cvttsd2siq	%xmm0, %rax
	jmp	.L4
.L3:
	movsd	.LC3(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L4:
	.loc 1 36 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	current_time_ns, .-current_time_ns
	.globl	make_buffer
	.type	make_buffer, @function
make_buffer:
.LFB3:
	.loc 1 39 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 40 0
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 42 0
	movq	-8(%rbp), %rax
	.loc 1 43 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	make_buffer, .-make_buffer
	.section	.rodata
.LC4:
	.string	"%lu\n"
	.text
	.globl	print_arr64
	.type	print_arr64, @function
print_arr64:
.LFB4:
	.loc 1 46 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
.LBB2:
	.loc 1 47 0
	movq	$0, -8(%rbp)
	jmp	.L9
.L10:
	.loc 1 48 0 discriminator 3
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	.loc 1 47 0 discriminator 3
	addq	$1, -8(%rbp)
.L9:
	.loc 1 47 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L10
.LBE2:
	.loc 1 50 0 is_stmt 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_arr64, .-print_arr64
	.globl	random_uint32_t
	.type	random_uint32_t, @function
random_uint32_t:
.LFB5:
	.loc 1 53 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 54 0
	call	rand
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	.loc 1 55 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	random_uint32_t, .-random_uint32_t
	.globl	count_m_to_n
	.type	count_m_to_n, @function
count_m_to_n:
.LFB6:
	.loc 1 58 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 59 0
	movq	-40(%rbp), %rax
	subq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB3:
	.loc 1 60 0
	movq	$0, -16(%rbp)
	jmp	.L14
.L15:
	.loc 1 61 0 discriminator 3
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 60 0 discriminator 3
	addq	$1, -16(%rbp)
	addq	$1, -32(%rbp)
.L14:
	.loc 1 60 0 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L15
.LBE3:
	.loc 1 63 0 is_stmt 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	count_m_to_n, .-count_m_to_n
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.2888, @object
	.size	__PRETTY_FUNCTION__.2888, 16
__PRETTY_FUNCTION__.2888:
	.string	"current_time_ns"
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.align 8
.LC3:
	.long	0
	.long	1138753536
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/4.9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x285
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF25
	.byte	0x1
	.long	.LASF26
	.long	.LASF27
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8b
	.long	0x69
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0xaf
	.long	0x69
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF28
	.byte	0x10
	.byte	0x4
	.byte	0x78
	.long	0xb9
	.uleb128 0x6
	.long	.LASF12
	.byte	0x4
	.byte	0x7a
	.long	0x77
	.byte	0
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0x7b
	.long	0x82
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.long	.LASF16
	.byte	0x5
	.byte	0x33
	.long	0x4d
	.uleb128 0x2
	.long	.LASF17
	.byte	0x5
	.byte	0x37
	.long	0x38
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.byte	0x11
	.long	0xd2
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x12d
	.uleb128 0x8
	.string	"tp"
	.byte	0x1
	.byte	0x1f
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.string	"res"
	.byte	0x1
	.byte	0x20
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.long	.LASF29
	.long	0x13d
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.2888
	.byte	0
	.uleb128 0xa
	.long	0x8d
	.long	0x13d
	.uleb128 0xb
	.long	0x70
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.long	0x12d
	.uleb128 0xd
	.long	.LASF21
	.byte	0x1
	.byte	0x26
	.long	0x180
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x180
	.uleb128 0xe
	.long	.LASF20
	.byte	0x1
	.byte	0x26
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.string	"arr"
	.byte	0x1
	.byte	0x28
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.byte	0x8
	.long	0xd2
	.uleb128 0x10
	.long	.LASF19
	.byte	0x1
	.byte	0x2d
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x1de
	.uleb128 0x11
	.string	"arr"
	.byte	0x1
	.byte	0x2d
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.long	.LASF20
	.byte	0x1
	.byte	0x2d
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x12
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x2f
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	.LASF22
	.byte	0x1
	.byte	0x34
	.long	0xc7
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x21c
	.uleb128 0xe
	.long	.LASF23
	.byte	0x1
	.byte	0x34
	.long	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.long	.LASF24
	.byte	0x1
	.byte	0x34
	.long	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.long	.LASF30
	.byte	0x1
	.byte	0x39
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.string	"arr"
	.byte	0x1
	.byte	0x39
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.string	"m"
	.byte	0x1
	.byte	0x39
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x39
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x14
	.long	.LASF20
	.byte	0x1
	.byte	0x3b
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x3c
	.long	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"size_t"
.LASF13:
	.string	"tv_nsec"
.LASF17:
	.string	"uint64_t"
.LASF29:
	.string	"__PRETTY_FUNCTION__"
.LASF27:
	.string	"/home/alex/SpiderOak Hive/all_notes/winter/systems/benchmarking_the_memory_hierarchy/c_code"
.LASF20:
	.string	"size"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"current_time_ns"
.LASF2:
	.string	"short unsigned int"
.LASF19:
	.string	"print_arr64"
.LASF9:
	.string	"__time_t"
.LASF1:
	.string	"unsigned char"
.LASF30:
	.string	"count_m_to_n"
.LASF23:
	.string	"lower_bound"
.LASF12:
	.string	"tv_sec"
.LASF26:
	.string	"utils.c"
.LASF3:
	.string	"unsigned int"
.LASF15:
	.string	"long long unsigned int"
.LASF22:
	.string	"random_uint32_t"
.LASF7:
	.string	"sizetype"
.LASF14:
	.string	"long long int"
.LASF21:
	.string	"make_buffer"
.LASF28:
	.string	"timespec"
.LASF11:
	.string	"char"
.LASF5:
	.string	"short int"
.LASF24:
	.string	"upper_bound"
.LASF16:
	.string	"uint32_t"
.LASF6:
	.string	"long int"
.LASF4:
	.string	"signed char"
.LASF25:
	.string	"GNU C 4.9.3 -mtune=generic -march=x86-64 -g -O0 -std=gnu11 -fstack-protector"
.LASF10:
	.string	"__syscall_slong_t"
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits

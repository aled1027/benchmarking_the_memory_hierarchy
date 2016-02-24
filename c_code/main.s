	.file	"main.c"
	.text
.Ltext0:
	.section	.rodata
.LC2:
	.string	"%lu\n"
	.text
	.globl	simple_timing_test
	.type	simple_timing_test, @function
simple_timing_test:
.LFB2:
	.file 1 "main.c"
	.loc 1 38 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.loc 1 40 0
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	clock_gettime
	.loc 1 41 0
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$4, %edi
	call	clock_gettime
	.loc 1 42 0
	movq	-32(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movq	-24(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	.LC1(%rip), %xmm0
	jnb	.L2
	cvttsd2siq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	jmp	.L3
.L2:
	movsd	.LC1(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movabsq	$-9223372036854775808, %rax
	xorq	%rax, -48(%rbp)
.L3:
	movq	-48(%rbp), %rax
	movq	%rax, -48(%rbp)
	.loc 1 43 0
	movq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	.LC1(%rip), %xmm0
	jnb	.L4
	cvttsd2siq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	jmp	.L5
.L4:
	movsd	.LC1(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movabsq	$-9223372036854775808, %rax
	xorq	%rax, -40(%rbp)
.L5:
	movq	-40(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 1 44 0
	movq	-40(%rbp), %rax
	subq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 45 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	simple_timing_test, .-simple_timing_test
	.section	.rodata
.LC3:
	.string	"main.c"
.LC4:
	.string	"argc && argv"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 48 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 49 0
	cmpl	$0, -4(%rbp)
	je	.L7
	.loc 1 49 0 is_stmt 0 discriminator 2
	cmpq	$0, -16(%rbp)
	jne	.L8
.L7:
	.loc 1 49 0 discriminator 3
	movl	$__PRETTY_FUNCTION__.3946, %ecx
	movl	$49, %edx
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	call	__assert_fail
.L8:
	.loc 1 55 0 is_stmt 1
	movl	$0, %eax
	call	simple_timing_test
	.loc 1 57 0
	movl	$0, %eax
	.loc 1 58 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3946, @object
	.size	__PRETTY_FUNCTION__.3946, 5
__PRETTY_FUNCTION__.3946:
	.string	"main"
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.align 8
.LC1:
	.long	0
	.long	1138753536
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/stdint.h"
	.file 4 "/usr/include/time.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x199
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF21
	.byte	0x1
	.long	.LASF22
	.long	.LASF23
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x8b
	.long	0x5e
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0xaf
	.long	0x5e
	.uleb128 0x5
	.byte	0x8
	.long	0x88
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x37
	.long	0x2d
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x6
	.long	.LASF24
	.byte	0x10
	.byte	0x4
	.byte	0x78
	.long	0xc6
	.uleb128 0x7
	.long	.LASF13
	.byte	0x4
	.byte	0x7a
	.long	0x6c
	.byte	0
	.uleb128 0x7
	.long	.LASF14
	.byte	0x4
	.byte	0x7b
	.long	0x77
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF16
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF17
	.uleb128 0x8
	.long	.LASF25
	.byte	0x1
	.byte	0x25
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x130
	.uleb128 0x9
	.string	"tp"
	.byte	0x1
	.byte	0x27
	.long	0xa1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x9
	.string	"tp2"
	.byte	0x1
	.byte	0x27
	.long	0xa1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.long	.LASF18
	.byte	0x1
	.byte	0x2a
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x9
	.string	"end"
	.byte	0x1
	.byte	0x2b
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0xb
	.long	.LASF26
	.byte	0x1
	.byte	0x2f
	.long	0x57
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x181
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x2f
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.long	.LASF20
	.byte	0x1
	.byte	0x2f
	.long	0x181
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.long	.LASF27
	.long	0x197
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3946
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.long	0x82
	.uleb128 0xe
	.long	0x88
	.long	0x197
	.uleb128 0xf
	.long	0x65
	.byte	0x4
	.byte	0
	.uleb128 0x10
	.long	0x187
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
.LASF16:
	.string	"float"
.LASF23:
	.string	"/home/alex/SpiderOak Hive/all_notes/winter/systems/benchmarking_the_memory_hierarchy/c_code"
.LASF18:
	.string	"start"
.LASF14:
	.string	"tv_nsec"
.LASF11:
	.string	"uint64_t"
.LASF27:
	.string	"__PRETTY_FUNCTION__"
.LASF1:
	.string	"unsigned char"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF8:
	.string	"__time_t"
.LASF17:
	.string	"double"
.LASF26:
	.string	"main"
.LASF3:
	.string	"unsigned int"
.LASF15:
	.string	"long long unsigned int"
.LASF25:
	.string	"simple_timing_test"
.LASF24:
	.string	"timespec"
.LASF19:
	.string	"argc"
.LASF7:
	.string	"sizetype"
.LASF13:
	.string	"tv_sec"
.LASF12:
	.string	"long long int"
.LASF22:
	.string	"main.c"
.LASF10:
	.string	"char"
.LASF5:
	.string	"short int"
.LASF20:
	.string	"argv"
.LASF6:
	.string	"long int"
.LASF4:
	.string	"signed char"
.LASF21:
	.string	"GNU C 4.9.3 -mtune=generic -march=x86-64 -g -O0 -std=gnu11 -fstack-protector"
.LASF9:
	.string	"__syscall_slong_t"
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits

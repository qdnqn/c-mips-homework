	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
$CPI0_0:
	.8byte	4661014508095930368
$CPI0_1:
	.8byte	4621819117588971520
	.text
	.globl	main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:
$tmp0:
$func_begin0 = ($tmp0)
	.file	1 "main.c"
	.loc	1 24 0
	.cfi_sections .debug_frame
	.cfi_startproc
	.frame	$fp,80,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
	addiu	$sp, $sp, -80
$cfi0:
	.cfi_def_cfa_offset 80
	sw	$ra, 76($sp)
	sw	$fp, 72($sp)
$cfi1:
	.cfi_offset 31, -4
$cfi2:
	.cfi_offset 30, -8
	move	 $fp, $sp
$cfi3:
	.cfi_def_cfa_register 30
	move	 $1, $5
	move	 $2, $4
	sw	$zero, 68($fp)
	sw	$4, 64($fp)
	sw	$5, 60($fp)
$tmp1:
	.loc	1 25 15 prologue_end
	lui	$4, 16395
	ori	$4, $4, 40238
	sw	$4, 52($fp)
	lui	$4, 3632
	ori	$4, $4, 17515
	sw	$4, 48($fp)
	sw	$1, 44($fp)
	sw	$2, 40($fp)
	.loc	1 25 8 is_stmt 0
	j	$BB0_1
	nop
$BB0_1:
$tmp2:
	.loc	1 25 30
	ldc1	$f0, 48($fp)
	lui	$1, %hi($CPI0_0)
	.loc	1 25 32
	ldc1	$f2, %lo($CPI0_0)($1)
	c.olt.d	$f0, $f2
$tmp3:
	.loc	1 25 2
	bc1f	 $BB0_5
	nop
	j	$BB0_3
	nop
$BB0_3:
$tmp4:
	.loc	1 26 42 is_stmt 1
	ldc1	$f0, 48($fp)
	.loc	1 26 45 is_stmt 0
	addiu	$6, $zero, 307
	mov.d	$f12, $f0
	sdc1	$f0, 32($fp)
	jal	calculateAmount
	nop
	.loc	1 26 3
	move	 $6, $sp
	sw	$2, 16($6)
	lui	$2, %hi($.str)
	addiu	$4, $2, %lo($.str)
	ldc1	$f0, 32($fp)
	mfc1	$6, $f0
	mfhc1	$7, $f0
	jal	printf
	nop
	sw	$2, 28($fp)
	.loc	1 27 2 is_stmt 1
	j	$BB0_4
	nop
$tmp5:
$BB0_4:
	.loc	1 25 44
	ldc1	$f0, 48($fp)
	lui	$1, %hi($CPI0_1)
	ldc1	$f2, %lo($CPI0_1)($1)
	mul.d	$f0, $f0, $f2
	sdc1	$f0, 48($fp)
	.loc	1 25 2 is_stmt 0
	j	$BB0_1
	nop
$tmp6:
$BB0_5:
	.loc	1 29 2 is_stmt 1
	addiu	$2, $zero, 0
	move	 $sp, $fp
	lw	$fp, 72($sp)
	lw	$ra, 76($sp)
	addiu	$sp, $sp, 80
	jr	$ra
	nop
$tmp7:
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, ($func_end0)-main
	.cfi_endproc

	.type	$.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
$.str:
	.asciz	"Amount( %f , 307) = %f\n "
	.size	$.str, 25

	.section	.debug_str,"MS",@0x7000001e,1
$info_string0:
	.asciz	"ecc version 2017-08-23 (http://ellcc.org) based on clang version 6.0.0 (trunk 311547)"
$info_string1:
	.asciz	"main.c"
$info_string2:
	.asciz	"/home/wubuntu/c-translations/zadaca2/zad8"
$info_string3:
	.asciz	"main"
$info_string4:
	.asciz	"int"
$info_string5:
	.asciz	"argc"
$info_string6:
	.asciz	"argv"
$info_string7:
	.asciz	"char"
$info_string8:
	.asciz	"i"
$info_string9:
	.asciz	"double"
	.section	.debug_abbrev,"",@0x7000001e
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.ascii	"\264B"
	.byte	25
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	39
	.byte	25
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	3
	.byte	5
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	4
	.byte	11
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	5
	.byte	52
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	6
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	7
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	8
	.byte	38
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_info,"",@0x7000001e
$cu_begin0:
	.4byte	146
	.2byte	4
	.4byte	.debug_abbrev
	.byte	4
	.byte	1
	.4byte	($info_string0)
	.2byte	12
	.4byte	($info_string1)
	.4byte	($line_table_start0)
	.4byte	($info_string2)

	.4byte	($func_begin0)
	.4byte	($func_end0)-($func_begin0)
	.byte	2
	.4byte	($func_begin0)
	.4byte	($func_end0)-($func_begin0)
	.byte	1
	.byte	110
	.4byte	($info_string3)
	.byte	1
	.byte	24

	.4byte	113

	.byte	3
	.byte	3
	.byte	141
	.asciz	"\300"
	.4byte	($info_string5)
	.byte	1
	.byte	24
	.4byte	113
	.byte	3
	.byte	2
	.byte	141
	.byte	60
	.4byte	($info_string6)
	.byte	1
	.byte	24
	.4byte	120
	.byte	4
	.4byte	($tmp1)
	.4byte	($tmp6)-($tmp1)
	.byte	5
	.byte	2
	.byte	141
	.byte	48
	.4byte	($info_string8)
	.byte	1
	.byte	25
	.4byte	142
	.byte	0
	.byte	0
	.byte	6
	.4byte	($info_string4)
	.byte	5
	.byte	4
	.byte	7
	.4byte	125
	.byte	7
	.4byte	130
	.byte	8
	.4byte	135
	.byte	6
	.4byte	($info_string7)
	.byte	6
	.byte	1
	.byte	6
	.4byte	($info_string9)
	.byte	4
	.byte	8
	.byte	0
	.section	.debug_ranges,"",@0x7000001e
	.section	.debug_macinfo,"",@0x7000001e
$cu_macro_begin0:
	.byte	0
	.section	.debug_pubnames,"",@0x7000001e
	.4byte	($pubNames_end0)-($pubNames_begin0)
$pubNames_begin0:
	.2byte	2
	.4byte	($cu_begin0)
	.4byte	150
	.4byte	38
	.asciz	"main"
	.4byte	0
$pubNames_end0:
	.section	.debug_pubtypes,"",@0x7000001e
	.4byte	($pubTypes_end0)-($pubTypes_begin0)
$pubTypes_begin0:
	.2byte	2
	.4byte	($cu_begin0)
	.4byte	150
	.4byte	113
	.asciz	"int"
	.4byte	142
	.asciz	"double"
	.4byte	135
	.asciz	"char"
	.4byte	0
$pubTypes_end0:

	.ident	"ecc version 2017-08-23 (http://ellcc.org) based on clang version 6.0.0 (trunk 311547)"
	.section	".note.GNU-stack","",@progbits
	.text
	.section	.debug_line,"",@0x7000001e
$line_table_start0:

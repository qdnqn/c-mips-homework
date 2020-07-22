.section .rodata
str: .asciiz "MyMax: %lf\n"
f1: .double 1.0
f2: .double 5.7
f3: .double 9.4
f4: .double 14.8
f5: .double 7.1
f6: .double 8.2
f7: .double 10.5

.section .text
.globl main

main:
	addiu $sp, $sp, -60
	sw $ra, 56($sp)
	
	ldc1 $f4, f1
	sdc1 $f4, ($sp)
	
	ldc1 $f4, f2
	sdc1 $f4, 8($sp)

	ldc1 $f4, f3
	sdc1 $f4, 16($sp)

	ldc1 $f4, f4
	sdc1 $f4, 24($sp)

	ldc1 $f4, f5
	sdc1 $f4, 32($sp)

	ldc1 $f4, f6
	sdc1 $f4, 40($sp)

	ldc1 $f4, f7
	sdc1 $f4, 48($sp)

	addu $a2, $0, $sp
	addiu $a3, $0, 7
	
	ldc1 $f12, ($sp)

	jal mymax

	la $a0, str
	mfc1 $a2, $f1
	mfc1 $a3, $f0

	jal printf

	lw $ra, 56($sp)
	addiu $v0, $0, 0
	addiu $sp, $sp, 60
	
	jr $ra

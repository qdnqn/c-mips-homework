.section .rodata
x: .double 5.59

.section .text
.globl main 

main:

addiu $sp, $sp, -12
sw $ra, 8($sp)

addiu $t0, $0, 7
ldc1 $f4, x
sdc1 $f4, ($sp)

addu $a0, $0, $sp
addu $a1, $0, $t0

jal foo

lw $ra, 8($sp)
addiu $sp, $sp, 12
addiu $v0, $0, 0
jr $ra

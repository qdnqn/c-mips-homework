.section .text
.globl main

main:
addiu $sp, $sp, -292
addiu $t0, $sp, 288
addu $a0, $0, $t0
addiu $a1, $0, 9
sw $ra, 292($sp)
jal max
lw $ra, 292($sp)
addiu $sp, $sp, 292
addiu $v0, $0, 0
jr $ra


.section .text
.globl max
max:
addiu $t0, $0, 1
beq $t0, $a1, retniz
addiu $sp, $sp, -64
sw $ra, 64($sp)
sw $a0, 60($sp)

addiu $a0, $a0, 1
addiu $a1, $a1, -1

jal max

sw $v0, 56($sp)
lw $a0, 60($sp)

lw $t0, ($a0)
sw $t0, 52($sp)

addu $a0, $0, $t0
addu $a1, $0, $v0
jal compare

lw $ra, 64($sp)
lw $t0, 56($sp)

beq $v0, $0, retrec
lw $a0, 60($sp)
lw $t0, ($a0)
addu $v0, $0, $t0
addiu $sp, $sp, 64
jr $ra

retniz:
lw $t0, ($a0)
addu $v0, $0, $t0
jr $ra

retrec:
lw $t0, 56($sp)
addu $v0, $0, $t0
addiu $sp, $sp, 64
jr $ra

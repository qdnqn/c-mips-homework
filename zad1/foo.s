.section .text
.globl foo

foo:
  slti $t0, $a0, 2
  beq $t0, $0, nextIf
  addiu $v0, $0, 0
  j $ra
nextIf:
  slti $t0, $a1, 3
  beq $t0, $0, rekurzija
  addiu $v0, $0, 1
  jr $ra 

rekurzija:
  addiu $sp, $sp, -64
 
  slt $t0, $a0, $a1
  beq $t0, $0, else

  sw $ra, 64($sp)
  sw $a0, 60($sp)
  sw $a1, 56($sp)

  addiu $a0, $a0, -1
  addiu $a1, $a1, -3

  jal foo

  lw $ra, 64($sp)
  lw $a0, 60($sp)
  lw $a1, 56($sp)

  addu $v0, $v0, $a0
  addiu $sp, $sp, 64
  jr $ra

else:
  sw $ra, 64($sp)
  sw $a0, 60($sp)
  sw $a1, 56($sp)

  addiu $a0, $a0, -2
  addiu $a1, $a1, -1

  jal foo

  lw $ra, 64($sp)
  lw $a0, 60($sp)
  lw $a1, 56($sp)
  
  subu $a0, $a0, $a1
  addu $v0, $v0, $a0
  addiu $sp, $sp, 64

  jr $ra



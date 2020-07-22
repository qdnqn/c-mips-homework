.section .rodata
str: .asciiz "TEST %f\n"
dfp1: .double 2.45

.section .text
.globl main

main:
  addiu $sp, $sp, -4
  sw $ra, ($sp)
  la $a0, str
  l.d $f4, dfp1
  mfc1 $a3, $f4
  mfc1 $a2, $f5

  jal printf

  lw $ra, ($sp)
  addiu $sp, $sp, 4
  addiu $v0, $0, 0

  jr $ra

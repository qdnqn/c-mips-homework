.section .rodata
cstr: .asciiz "%c"
nlstr: .asciiz "\n"

.section .data
d: .byte

.section .text
.globl combinations

combinations:
  addiu $sp, $sp, -64
  
  sw $a0, 64($sp) // *chars
  sw $a1, 60($sp) // u32t size
  sw $a2, 56($sp) // u32t r
  sw $ra, 52($sp)

  la $t0, d
  
  addu $a0, $0, $a2
  jal malloc

  lw $a0, 64($sp)
  lw $a1, 56($sp)
  lw $a2, 60($sp)
  
  addu $a3, $0, $a1

  jal combinations_impl
  
  lw $ra, 52($sp)
  addiu $sp, $sp, 64
  jr $ra

combinations_impl:
  bne $a3, $0, rekurzija
  addiu $sp, $sp, -64
  sw $ra, 64($sp)
  addu $a0, $0, $a1
  jal print_comb
  lw $ra, 64($sp)
  addiu $sp, $sp, 64
  j $ra

rekurzija:
  addiu $sp, $sp, -64

  init1:
    addiu $t0,$0,0
    j cond1
  body1:
    sw $ra, 64($sp)
    sw $a0, 60($sp)
    sw $a1, 56($sp)
    sw $a2, 52($sp)
    sw $a3, 48($sp)
    sw $t0, 44($sp)
    
    la $t1, d
  
    subu $t2, $a1, $a3
    addu $t2, $t2, $t1
    addu $t3, $a0, $t0

    lb $t4, ($t3)
    sb $t4, ($t2)

    addiu $a3, $a3, -1
    
    jal combinations_impl

    lw $ra, 64($sp)
    lw $a0, 60($sp)
    lw $a1, 56($sp)
    lw $a2, 52($sp)
    lw $a3, 48($sp)
    lw $t0, 44($sp)

    addiu $t0,$t0, 1
  cond1: 
    slt $t1, $t0, $a2
    beq $t1, $0, end1
    j body1

end1:
  addiu $sp, $sp, 64
  jr $ra
  
print_comb:
  addiu $sp, $sp, -64
  la $t5, d
init2:
  addiu $t0, $0, 0
body2:
  sw $ra, 64($sp)
  sw $a0, 60($sp)
  sw $t5, 54($sp)
  sw $t0, 48($sp)

  addu $t5, $t5, $t0
  lb $a1, ($t5)
  la $a0, cstr

  jal printf

  lw $ra, 64($sp)
  lw $a0, 60($sp)
  lw $t5, 54($sp)
  lw $t0, 48($sp)
  addiu $t0, $t0, 1
cond2:
  slt $t1, $t0, $a0
  bne $t1, $0, body2

  sw $ra, 64($sp)
  la $a0, nlstr
  jal printf
  lw $ra, 64($sp)

  addiu $sp, $sp, 64
  jr $ra


  

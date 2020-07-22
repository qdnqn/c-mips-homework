.section .rodata
string: .asciiz "foo( %d , %d ), %hd\n"
.globl string 

.section .text
.globl main

main:

addiu $sp, $sp, -64

init1:
  addiu $a0, $0, 2
  j cond1
body1:
  init2:
    addiu $a1, $0, 3
    j cond2
  body2:
    sw $ra, 64($sp)
    sw $a0, 60($sp)
    sw $a1, 56($sp)

    jal foo
  
    lw $a1, 60($sp)
    lw $a2, 56($sp)
    
    la $t0, string
    addu $a0, $0, $t0
    addu $a3, $0, $v0
    
    jal printf

    lw $ra, 64($sp)
    lw $a0, 60($sp)
    lw $a1, 56($sp)
       
    addiu $a1, $a1, 1  
  cond2:
    slti $t0, $a1, 7
    beq $t0, $0, cond1statement
    j body2 
cond1:
  slti $t0, $a0, 6
  beq $t0, $0, end
  j body1

end:
  lw $ra, 64($sp)
  addiu $sp, $sp, 64
  jr $ra

cond1statement:
  addiu $a0, $a0, 1
  j cond1

.section .rodata
fp1: .double 0.001
fp2: .double 0.01
fp3: .double 0.1
fp4: .double 1.0

dc1: .double 10
dc2: .double 100
dc3: .double 1000

.section .text
.globl calculateAmount

#void roundToTick ( double * p , uint32_t precision )
# p addres -> a0, precision -> a1
roundToTick:
  ldc1 $f4, ($a0)
  mtc1 $a1, $f6
  cvt.d.w $f6, $f6
  mul.d $f4, $f4, $f6
  trunc.w.d $f4, $f4
  cvt.d.w $f4, $f4
  div.d $f4, $f4, $f6
  sdc1 $f4, ($a0)
  jr $ra

#double getTick ( double num )
# num -> f12

getTick:
  mtc1 $0, $f4
  cvt.d.w $f4, $f4 
  c.eq.d $f12, $f4
  bc1f else_if
  mov.d $f0, $f4
  j ret_getTick
else_if:
  l.d $f4, dc1
  c.lt.d $f12, $f4
  bc1f else_if2
  l.d $f0, fp1
  j ret_getTick
else_if2:
  l.d $f4, dc2
  c.lt.d $f12, $f4
  bc1f else_if3
  l.d $f0, fp2
  j ret_getTick
else_if3:
  l.d $f4, dc3
  c.lt.d $f12, $f4
  bc1f else_if4
  l.d $f0, fp3
  j ret_getTick
else_if4:
  l.d $f0, fp4
ret_getTick:
  jr $ra

# double calculateAmount ( double price , int quantity )
# price -> $f12, quantity -> $a2
calculateAmount:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $a2, 56($sp)
  sdc1 $f12, 48($sp)

  jal getTick

  ldc1 $f4, fp4
  div.d $f4, $f4, $f0
  trunc.w.d $f4, $f4
  mfc1 $a1, $f4
  addiu $a0, $sp, 48

  jal roundToTick

  l.d $f4, 48($sp)
  lwc1 $f6, 56($sp)
  cvt.d.w $f6,$f6
  mul.d $f0, $f4, $f6
  
  lw $ra, 60($sp)
  addiu $sp, $sp, 64 
  
  jr $ra






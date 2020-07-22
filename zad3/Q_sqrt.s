.section .rodata
halfone: .float 0.5

.section .text
.globl Q_sqrt

Q_sqrt:
  addiu $sp, $sp, -20
  lui $t0, 0x3fc0
  sw $t0, 16($sp) # const float threehalfs = 1.5 F

  lw $t0, halfone # load addr of halfone 0.5 into t0 
  l.s $f4, 16($sp) # store value from addr t0 to f4

  mul.s $f4, $f4, $f12  # multiply 0.5 * number
  s.s $f4, 12($sp) # x2 = number * 0.5 F;

  # need to compile i = * (long *) &y
  s.s $f12, 8($sp) # y = number

  cvt.w.s $f0, $f12 # * (long*) &y

  mfc1 $t0, $f0
 
  lui $t1, 0x5f37
  ori $t1, 0x59df

  sra $t0, 1
  subu $t0, $t1, $t0 # t0 -> y = 0x5f3759df - (i >> 1)

  mtc1 $t0, $f0
  cvt.s.w $f0, $f0

  mul.s $f1, $f0, $f0
  mul.s $f1, $f1, $f4

  lwc1 $f2, 16($sp)
  sub.s $f1, $f2, $f1
  mul.s $f0, $f0, $f1

  addiu $sp, $sp, 20

  

  jr $ra
  





  

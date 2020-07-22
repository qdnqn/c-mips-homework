#
# double baz ( float f1 , double * p1 , float f2 , int n ) 
# calling convention s1, n1, s2, n2 | $f12, $a1, $a2, $a3
#
.section .text
.globl baz

baz:
  # a1 -> holds address of double (NEED TO DEREF!)
  
  ldc1 $f4, ($a1)       # double d1 -> $f4
  li.d $f6, 0.0         # load immd 0.0 in f6

  c.eq.d $f4, $f6       # *double == 0
  bc1t f1pf2            # if true goto f1pf2

  mtc1 $a2, $f6 		# move to coproc1 f2 -> $f6
  add.s $f6, $f6, $f12  # f2+f1
  cvt.d.s $f6, $f6      # promote f2+f1 to double

  mtc1 $a3, $f8         # move to coproc1 n -> $f8
  cvt.d.w $f8, $f8      # promote to double	

  c.lt.d $f6, $f8
  bc1t f1pf2

  j else_if

f1pf2:
  mtc1 $a2, $f6 		# move to coproc1 f2 -> $f6
  add.s $f6, $f6, $f12  # f2+f1
  cvt.d.s $f6, $f6      # promote f2+f1 to double

  mtc1 $a3, $f8         # move to coproc1 n -> $f8
  cvt.d.w $f8, $f8      # promote to double
  mul.d $f0, $f6, $f8
  
  j end

else_if:
  li.d $f6, 0.0
  c.eq.d $f4, $f6
  bc1t return
  
  mtc1 $a2, $f6 
  sub.s $f12, $f12, $f6  # f1-f2
  cvt.d.s $12, $f12      # promote to double

  mtc1 $a3, $f8         # move to coproc1 n -> $f8
  cvt.d.w $f8, $f8      # promote to double
  
  mul.d $f0, $f12, $f8
  div.d $f0, $f0, $f4

  j end
  
return:
  mtc1 $a2, $f6 
  cvt.d.s $f6, $f6      # promote f2 to double

  mtc1 $a3, $f8         # move to coproc1 n -> $f8
  cvt.d.w $f8, $f8      # promote n to double
  
  mul.d $f0, $f6, $f4
  add.d $f0, $f0, $f8
  add.d $f0, $f0, $f12
  
end:
  j $ra


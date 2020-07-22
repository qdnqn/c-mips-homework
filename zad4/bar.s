.section .rodata
const2f: .float 2.0

.section .text
.globl bar

bar:  
  cvt.d.s $f4, $f12
  cvt.d.s $f6, $f14
  
  mtc1 $a2, $f8
  mtc1 $a3, $f9
  
  ceil.w.d $f4, $f4
  round.w.d $f6, $f6
  trunc.w.d $f8, $f8
  
  cvt.s.w $f4, $f4
  cvt.s.w $f5, $f6
  cvt.s.w $f6, $f8  
  
  la $t0, const2f
  lwc1 $f7, ($t0)
  
  add.s $f7, $f7, $f4
  sub.s $f7, $f7, $f5
  add.s $f7, $f7, $f6
  mov.s $f4, $f7
  j end
less:
  sub.s $f4, $f4, $f5
  add.s $f4, $f4, $f6
end:
  mov.s $f0, $f4
  
  jr $ra

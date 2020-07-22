.section .rodata
d: .double 6.28
t: .double 3.0

.section .text
.globl foo

foo:
ldc1 $f4, d # load d in $f4
ldc1 $f6, ($a0) # load in f6 from ptr x, f6 -> *x
mtc1 $a1, $f8 # move n to coproc1 f8 -> n
cvt.d.w $f8, $f8 # convert n to double
c.lt.d $f6, $f8 # *x < n
bc1f returnxpd
add.d $f6, $f6, $f4 # *x = *x + d
sdc1 $f6, ($a0) # push to memory *x + d
l.d $f4, t # load 3.0 in $f4
mul.d $f0, $f6, $f4
cvt.s.d $f0, $f0
jr $ra

returnxpd:

sub.d $f6, $f6, $f4 # *x = *x - d
sdc1 $f6, ($a0) # push to memory *x - d
sub.d $f0, $f6, $f8
cvt.s.d $f0, $f0
jr $ra


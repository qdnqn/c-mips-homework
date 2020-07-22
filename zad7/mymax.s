#double mymax ( double start , const double * nums , uint32_t size )
# d1 -> f12
# a3 -> nums addr
# a4 -> size 

.section .text
.globl mymax

mymax:
  mov.d $f4, $f12   # $f4 = d1
  addiu $t0, $t0, 0  # int i = 0;

for_loop:
  slt $t1, $t0, $a3
  beq $t1, $0, return
  
  # calculate proper address in t2
  sll $t2, $t0, 3       # t2 = i * 8 eg: t2 = 1 * 8, t2 = 2 * 8, t2 = 3 * 8
  addu $t2, $t2, $a2    # t2 = t2 + start_address
  ldc1 $f4, ($t2)

  c.lt.d $f12, $f4
  bc1t updateMax
  
incr:
  addiu $t0, $t0, 1 # i++
  j for_loop
  
return:
  mov.d $f0, $f12
  jr $ra

updateMax:
  mov.d $f12, $f4
  j incr

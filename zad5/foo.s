# d1, s1, s2 -> f12, f14, a3

.section .text
.globl foo

foo:
  mov.s $f6, $f14 	# f6 -> float1
  mtc1 $a3, $f4 	# f4 -> float2
  
  cvt.d.s $f4, $f4
  cvt.d.s $f6, $f6
  
  c.lt.d $f4, $f12	# float2 < double1
  bc1f else_if		# if not goto else_if

  add.d $f6, $f6, $f4	# float1+float2
  sub.d $f6, $f6, $f12	# -double1

  li.d $f4, 3.0			# load double immediate
  div.d $f6, $f6, $f4	# /3.0
  
  trunc.w.d $f6, $f6	# Remove digits after decimal point
  mfc1 $v0, $f6			# move from coproc1 to v0

  j end					# return value
  
else_if:
  c.eq.d $f12, $f4		# double1 == float2
  bc1f else_if2			# if not goto else_if2
  c.eq.d $f12, $f6		# double1 == float1
  bc1t else_if2			# if yes goto else_if2
  li.d $f8, .0			# load double immediate .0 in $f8
  c.eq.d $f12, $f8		# double1 == 0.0
  bc1t else_if2 		# if yes goto else_if2

  li.d $f4, 3.0			# load immediate 3.0 in $f4( float2 is not used so we dont need it! )
  mul.d $f6, $f6, $f4	# float1 * 3.0
  div.d $f6, $f6, $f12	# / double1
  
  trunc.w.d $f6, $f6	# remove digits after decimal point
  mfc1 $v0, $f6			# move from coproc1 to v0
  j end					# return value
  
else_if2:				
  c.lt.d $f12, $f4		# double1 < float2
  bc1f else_if3			# if not goto else_if3
  c.eq.d $f12, $f6		# double1 == float1
  bc1f else_if3			# if not goto else_if3
  li.d $f8, .0			# load immediate 0.0 in f8
  c.eq.d $f6, $f8		# float1 == 0.0
  bc1t else_if3			# if yes goto else_if3
  
  sub.d $f12, $f12, $f4 # double1-float2
  abs.d $f12, $f12		# abs
  div.d $f12, $f12, $f6	# /float1
  trunc.w.d $f12, $f12	# remove digits after decimal point
  mfc1 $v0, $f12			# move from coproc1 to v0
  j end					# return value

else_if3:
  li.d $f8, 12.0		# load immediate 12.0 in $f8
  mul.d $f4, $f4, $f6	# a = float2 * $float 1
  mul.d $f8, $f8, $f12	# b = 12.0 * double1
  sub.d $f4, $f4, $f8	# a-b
  trunc.w.d $f4, $f4	# remove digits after decimal point
  mfc1 $v0, $f4			# move from coproc1 to v0
  
end:
  jr $ra
  

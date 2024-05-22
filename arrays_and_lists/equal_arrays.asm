# given 2 (non empty) arrays print 1 if they're equal

.data
	len1: .word 5
	array1: .word 2, 3, 4, 5, 6
	len2: .word 5
	array2: .word 2, 3, 4, 5, 6
.text
	lui s0, 0x10010
	lw t0, 0(s0) # t0 = len1
	slli t1, t0, 2 # multiply len1 * 4 (5*4=20)
	add t2, t1, s0 # add result to initial address (now it points to the last element of array1)
	addi t2, t2, 4 # add 4 (now it points to len2)
	lw s2, 0(t2) # s2 = len2
	bne t0, s2, not_equal
	loop: addi s0, s0, 4 # shift address1
		  addi t2, t2, 4 # shift address2
		  addi t0, t0, -1 # decrease len (same for both)
		  lw s1, 0(s0) # load element1
		  lw s2, 0(t2) # load element2
		  bne s1, s2, not_equal
		  bne t0, zero, loop
	addi a0, zero, 1 # this happens only if they are equal
	not_equal: addi a7, zero, 1
	ecall # print
	addi a7, zero, 10
	ecall # exit
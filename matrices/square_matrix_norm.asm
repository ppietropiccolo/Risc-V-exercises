# print the norm of a square matrix (maximum between the sum of each row)

.data
	side: .word 3
	row1: .word 5, 0,  7
	row2: .word 2, -1, 0
	row3: .word 3, 3, -1 
.text
	lui s0, 0x10010
	lw s1, 0(s0) # s1 = side
	add s2, zero, zero # s2 = row counter (= zero)
	add t2, zero, zero # t2 = col counter (= zero)
	loop: addi s0, s0, 4
		  lw t0, 0(s0) # load element
		  add t1, t1, t0 # add it to partial sum
		  addi t2, t2, 1 # col counter += 1
		  bne t2, s1, loop
		  # after a row is finished
		  beq s2, zero, swap
		  blt t1, a0, no_swap
		  swap: add a0, zero, t1 # if a0 is less then row sum swap them
		  no_swap: add t1, zero, zero # reset partial sum
		  add t2, zero, zero # reset col counter
		  addi s2, s2, 1 # remove 1 to row counter
		  bne s2, s1, loop
	addi a7, zero, 1
	ecall # print
	addi a7, zero, 10
	ecall # exit
		  
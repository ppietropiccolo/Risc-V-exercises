# print the trace of a square matrix

.data
	side: .word 3
	row1: .word 5, 0,  7
	row2: .word 2, -1, 0
	row3: .word 3, 3, -1 
.text
	lui s0, 0x10010
	lw s1, 0(s0) # s1 = side
	addi s0, s0, 4 # s0 points to the first element
	add a0, zero, zero # initialize a0
	addi t2, s1, 1 # side + 1
	slli t2, t2, 2 # multiply t2 by 4 to compute address to sum everytime
	loop: lw t0, 0(s0) # load the element
		  add a0, a0, t0 # add it to the result
		  add s0, s0, t2 # point to right address
		  addi s1, s1, -1
		  bne zero, s1, loop
	addi a7, zero, 1
	ecall # print
	addi a7, zero, 10
	ecall # exit
		  
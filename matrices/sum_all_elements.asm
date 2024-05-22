# print the sum of all the elements of a square matrix

.data
	side: .word 3
	row1: .word 5, 0,  7
	row2: .word 2, -1, 0
	row3: .word 3, 3, -1 
.text
	lui s0, 0x10010
	lw s1, 0(s0)
	mul s1, s1, s1
	add a0, zero, zero
	loop: addi s0, s0, 4
		  lw t0, 0(s0)
		  add a0, a0, t0
		  addi s1, s1, -1
		  bne s1, zero, loop
	addi a7, zero, 1
	ecall # print
	addi a7, zero, 10
	ecall # exit

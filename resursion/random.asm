# create a binary tree of empty nodes of given depth (return the root)

.data
	.word 4 # depth
.text
	lui a0, 0x10010
	lw a1, 0(a0)
	jal ra, create
	addi a7, zero, 1
	ecall # print
	addi a7, zero, 10
	ecall # exit
	
	create:	bne a1, zero, rec # a0 is the address, a1 is the depth
			jalr zero, ra, 0
	rec: addi a0, a0, 4 # depth is at least 1
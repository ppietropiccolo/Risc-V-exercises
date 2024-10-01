# find the sum of all the nodes of a genral tree

# a general tree is made by nodes which contain 3 values each:
# the node value, a pointer to the right brother, a pointer to the most left of the children
# (forest of right brothers and forest of children)

.data
    tree: .word node1
	node1:  .word 7, 0, node2
	node2:  .word 6, node3, node5				# expected sum = 62
	node3:  .word 7, node4, node8				#
	node4:  .word 5, 0, node10					#		  ______7______
	node5:  .word 4, node6, 0					#		 /      |      \
	node6:  .word 2, node7, 0					#		6		7		5
	node7:  .word 5, 0, 0						#	   /|\     /\       |
	node8:  .word 1, node9, node11				#	  4 2 5   1  6		3
	node9:  .word 6, 0, 0						#			  |		   /|
	node10: .word 3, 0, node12					#			  3		  2 9
	node11: .word 3, 0, node14					#			 /
	node12: .word 2, node13, 0					#			2
	node13: .word 9, 0, 0
	node14: .word 2, 0, 0
	
.text
    lw a0, tree
    jal ra, sum
    addi a7, zero, 1 
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
	# current data: a0 = address of the current node to visit, ra = current return address
	sum: bne a0, zero, rec # a0 is the address of the node being checked
		 jalr zero, ra, 0 # if the address is zero exit and put the result in a0 (no need because already 0)
	rec: lw t0, 0(a0) # if here a0 contains an adress -> load the node value in t0
	     sw t0, 0(sp) # store the sum in the stack
		 sw ra, 4(sp) # store the return address of this call in the stack
		 sw a0, 8(sp) # store the address of the current node (a0) because it will be overritten
		 lw a0, 8(a0) # load the address of the child
		 addi sp, sp, 12 # adjust the stack pointer
		 jal ra, sum # call the function on the child -> a0 = child tree sum
		 addi sp, sp, -12 # adjust the stack pointer
		 lw t0, 0(sp) # take back the sum
		 add t0, t0, a0 # add the child tree sum
		 sw t0, 0(sp) # put the sum again in the stack
		 lw ra, 4(sp) # take back the correct return address
		 lw a0, 8(sp) # take back the correct node address
		 lw a0, 4(a0) # load the address of the brother
		 addi sp, sp, 8
		 jal ra, sum # call the function on the brother -> a0 = brother tree sum
		 addi sp, sp, -8
		 lw t0, 0(sp) # take back the previous sum
		 add a0, t0, a0 # add the brother tree sum and put it finally in a0 <- return value
		 lw ra, 4(sp) # take back the correct return address
		 jalr zero, ra, 0 # finally exit

# find the depth of a binary tree

.data
    tree: .word node1
    node3: .word 7, node4, node5
    node1: .word 7, node2, node3
    node4: .word 6, node5
    node2: .word 6, 0, 0
    node5: .word 7, 0, node6
    node6: .word 2, 0, 0
.text
    lui s0, 0x10010
    jal find_depth
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    find_depth:  bne a0, zero, rec # base case: the empty tree (not even a root)
    		jalr zero, ra, 0 # just exit because a0 already contains zero
    rec: addi sp, sp, -12 # free up the space for 3 values
    	 sw, ra, 0(sp) # store the return address
    	 sw, a0, 4(sp) # store the address of the current node (argument of the function)
    	 lw a0, 4(a0) # load the left child address
    	 jal ra, find_depth # call the function on the left child (a0) ->  a0 becomes the height of the left side
    	 sw a0, 8(sp) # store the height of the left side just found 
    	 lw a0, 4(sp) # load the current node address again
    	 lw a0, 8(a0) # load the right child address
    	 jal ra, find_depth # call the function on the right child
    	 addi a0, a0, 1 # add 1 to right height
    	 lw t0, 8(sp) # load the height of the left side previously found
    	 addi t0, t0, 1 # add 1 to left height
    	 bge a0, t0, jump # checks which is bigger
    	 mv a0, t0 # if left side is larger put it in a0 (overrights left height)
    	 jump: lw ra, 0(sp) # load the correct return address
    	 addi sp, sp, 12 # reset the stack pointer
    	 jalr zero, ra, 0 # return to the initial caller
    	 
    	 
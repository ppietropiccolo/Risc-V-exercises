# print the sum of the element of the list skipping the ones in an even position (result = 5)

.data
    list: .word node1
    node3: .word 7, node4
    node1: .word 7, node2
    node4: .word 6, node5
    node2: .word 6, node3
    node5: .word 7, 0

.text
    lw a0, list # a0 = pointer to node1, ready to be used as function argument
    jal ra, count_2
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    # with position skipper -> iterative
    count: add t0, zero, a0 # move a0 (address of the head) in t0
    	   add a0, zero, zero # reset the counter
    	   add a1, zero, zero # a1 is the counter of the position
    	   
    loop: lw t1, 0(t0) # t1 = content of the node
    	  lw t0, 4(t0) # t0 = address of next node
    	  bne a1, zero, skip # change to beq to count the odd ones
    	  add a0, a0, t1 # add the value to the result
    	  skip: xori a1, a1, 1 # a1 switches between 1 and zero
    	  bne t0, zero, loop # end if it's the last element
    	  jalr ra
    
    	  
    # without position skipper -> iterative
    count_2: add t0, zero, a0 # move a0 (address of the head) in t0
    	     add a0, zero, zero # reset the counter
    ciclo: lw t1, 0(t0) # t1 =  content of the node
    	   add a0, a0, t1 # add to result
    	   lw t0, 4(t0) # next addess
    	   beq t0, zero, end
    	   lw t0, 4(t0) # second next address
    	   bne t0, zero, ciclo
    	   end: jalr ra
    
    # without position counter -> recursive
    count_rec: lw t0, 4(a0) # t0 = address of next node
    	       beq t0, zero, list_end
    	       lw t0, 4(t0) # t0 = address of second next node
    	       lw t1, 0(t0) # t1 = value of the second position
    # project aborted cause it makes no sense to do it recursively

# create a function that gets as input a pointer to a linked list and returns the sum of the elements

.data
    list: .word node1
    node1: .word -1, node2
    node3: .word 7, 0 # last node
    node2: .word 8, node3
.text
    lw a0, list # a0 is now the pointer to the first element
    jal ra, sum
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
    
    # use label sum to call the function
    sum: add a1, zero, zero # initialize the sum
    loop: lw t0, 0(a0)
    	add a1, a1, t0
    	lw a0, 4(a0)
    	bne a0, zero, loop
    add a0, zero, a1 # put the sum in the return value
    jalr zero, ra, 0 # jump back to line 11
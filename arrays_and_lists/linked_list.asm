# count the number of nodes in a linked lists

.data # each node contains 2 words (8 bytes) to indicate its value and the address of the next node
# by using lables is easier, otherwise we'd have to specify the address everytime
    node1: .word -2, node2
    node3: .word 0, node4
    node2: .word 1, node2
    node4: .word 7, 0 # last element
.text
    lui s0, 0x10010
    # lw s0, 0(s0)
    add a0, zero, zero # initialize the counter
    loop: lw s0, 4(s0) # load the address of the pointer in s0
    	  addi a0, a0, 1 # add 1 to the node counter
    	  bne s0, zero, loop
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
    
# add s0, t0, zero # move the pointer (t0) in the new address (s0)
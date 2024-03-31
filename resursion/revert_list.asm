# reverse a linked list recursively
# every node stays in the same position in the memory, only the pointers switch
# the function returns the head of the new list

.data
    list:  .word node1
    node3: .word 0, node4
    node1: .word -2, node2
    node2: .word 1, node2
    node4: .word 7, 0 # last element
.text
    lw a0, list
    jal ra, reverse
    
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    reverse: lw t0, 4(a0) # list with one node is base case
    	     bne t0, zero, rec
    	     jalr, zero, ra, 0
    rec: addi sp, sp, -8
         sw ra, 0(sp)
         sw a0, 4(sp)
         lw a0, 4(a0)
         jal ra, reverse
         lw t0, 4(sp)
         lw t1, 4(t0)
         sw t0, 4(t1)
         sw zero, 4(t0)
         
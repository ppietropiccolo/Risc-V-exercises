# count occurrences of y in a linked list

.data
    y: .word 1
    list:  .word node1
    node3: .word 0, node4
    node1: .word -2, node2
    node2: .word 1, node2
    node4: .word 7, 0 # last element
.text
    lui s0, 0x10010 # load initial address
    lw s1, 0(s0) # s1 = y
    lw a0, 4(s0) # t0 = node1 address
    jal ra, count
    
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    count: bne a0, zero, rec # base case, zero elements, return 0
    	   jalr zero, ra, 0 # return at addres ra + 0, storing this address in zero (nothing happens)
    rec: addi sp, sp, -8 # stack pointer -= 8
         sw ra, 0(sp) # store return address in first position of the stack
         sw, a0, 4(sp) # store a0 in second position of the stack
         lw a0, 4(a0) # load in a0 the address to the next element
         jal ra, count # recursive call
         lw t0, 4(sp) # load the original a0 into t0
         lw t1, 0(t0) # load the respactive item (pointed by t0 = element skipped in the prevoius call)
         bne t1, a1, jump
         addi a0, a0, 1
         jump: lw ra, 0(sp)
               addi sp, sp, 8
               jalr zero, ra, 0 # jump back to the beginning
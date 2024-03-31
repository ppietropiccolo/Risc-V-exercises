.data
    list: .word node1
    node1: .word -1, node2
    node3: .word 7, 0 # last node
    node2: .word 8, node3
.text
    # main
    lw a0, list # a0 is now the pointer to the first element
    jal ra, sum
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
    
    # recursive sum
    sum: bne a0, zero, recursive_step
    	jalr zero, ra, 0
    recursive_step: addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    lw a0, 4(a0)
    jal ra, sum # sum just works on a smaller instance
    lw t0, 4(sp)
    lw t0, 0(t0)
    add a0, a0, t0
    lw ra, 0(sp)
    addi sp, sp, 8
    jalr zero, ra, 0

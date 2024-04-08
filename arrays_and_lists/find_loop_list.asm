# given a linked list of positive integers, find if it contains a loop

.data
    list: .word node1
    node3: .word 7, node4
    node1: .word 7, node2
    node4: .word 6, node5
    node2: .word 6, node3
    node5: .word 7, node2
.text
    lui s0, 0x10010
    lw t0, 0(s0)
    jal find_loop_egnald # works by replacing elements with negative ones
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    find_loop_egnald: addi s1, zero, -1
    lw t1 0(t0) # t1 = content, t0 = address
    blt t1, zero, no_loop
    
    no_loop:
    
    # uses a stack with all the past addresses
    find_loop: lw t1 0(t0) # t1 = content, t0 = address
    addi sp, sp, -4
    sw t0, 0(sp) # store the address in the stack
    
    # uses a fast and a slow pointer
    # find_loop_2
# given a linked list of positive integers, find if it contains a loop (in case print 1)

.data
    list: .word node1
    node3: .word 7, node4
    node1: .word 7, node2
    node4: .word 6, node5
    node2: .word 6, node3
    node5: .word 7, 0
.text
    lui s0, 0x10010
    lw a0, 0(s0)
    jal ra, find_loop_egnald
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    # replaces elements with negative ones
    find_loop_egnald: addi s1, zero, -1 # keep a register with -1 to multiply
    ciclo1: lw t0, 0(a0) # t0 = content, a0 = address
    		blt zero, t0, no_loop
    		addi a0, zero, 1 # if t0 is negative print 1 and exit
    		end: jalr zero, ra, 0
    		no_loop: mul t0, t0, s1
    		sw t0, 0(a0) # store the negative value in the list
    		addi a0, a0, 4
    		beq a0, zero, end
    		bne a0, zero, ciclo1
    
    # uses a stack with all the past addresses
    find_loop: lw t1, 0(t0) # t1 = content, t0 = address
    addi sp, sp, -4
    sw t0, 0(sp) # store the address in the stack
    
    # uses a fast and a slow pointer
    find_loop_2: 
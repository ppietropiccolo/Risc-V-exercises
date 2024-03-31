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
    lw t0, 4(s0) # t0 = node1 address
    add a0, zero, zero # initialize result counter
    loop: lw t1, 0(t0) # load element
          bne t1, s1, not_equal
          addi a0, a0, 1
          not_equal: lw t0, 4(t0) # t0 contains next node address
          bne t0, zero, loop
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
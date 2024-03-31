# count the number of items that are equal to y

.data
    y: .word 4
    l: .word 12
    x: .word 5, -1, 4, 3, 55, 2, 4, 0, 3, 5, 11, 4
.text
    lui s0, 0x10010 # load the initial address
    lw s1, 0(s0) # s1 = y
    lw s2, 4(s0) # s2 = length
    addi t0, s0, 8 # t1 = address of x[0]
    add a0, zero, zero # result counter
    add t2, zero, zero # elements counter
    loop: lw t1, 0(t0) # load current element
    	  bne t1, s1, not_equal
    	  addi a0, a0, 1 # skipped if not equal
    	  not_equal: addi t0, t0, 4 # shift address
    	  addi t2, t2, 1
    	  bne t2, s2, loop
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
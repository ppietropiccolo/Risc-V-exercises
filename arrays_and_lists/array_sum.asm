# given an array in the data segment, print the sum
.data
    .word 6 # length
    .word 4, 7, -3, 11, -8, -11 # elements in order
.text
    lui s0, 0x10010
    lw s1, 0(s0) # s1 contains the length
    # now start looping
    loop: addi s2, s2, 1 # add one to s2, which works as a counter
          addi s0, s0, 4
          lw t0, 0(s0) # load current element
          add a0, a0, t0 # add it to the total sum
    blt s2, s1, loop # loop until length and counter are equal
    addi a7, zero, 1 # print code
    ecall
    addi a7, zero, 10 # exit code
    ecall
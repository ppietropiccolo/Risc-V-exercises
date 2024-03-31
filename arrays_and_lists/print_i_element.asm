# print x[i], assuming that i is in the range

.data
    i: .word 4
    l: .word 12
    x: .word 5, -1, 7, 3, 55, 2, 8, 0, 3, 5, 11, 12
.text
    lui s0, 0x10010 # load the initial address
    lw s1, 0(s0) # s1 = i
    addi t0, s0, 8 # t1 = address of x[0]
    slli s1, s1, 2 # multiply i by 4
    add t0, t0, s1 # t0 = right address (address of first element + i*4)
    lw a0, 0(t0) # load the right element in a0
    
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
# count number of zeros in a non-empty array

.data
    len: .word 12
    array: .word 5, 0, 2, 5, 7, 0, 3, 0, 3, 1, 2, 4 # 3 zeros
.text
    lui s0, 0x10010
    lw s1, 0(s0) # s1 holds the length
    add a0, zero, zero # initialize the counter of zeros
    
    loop: addi s0, s0, 4 # t0 += 1
    addi s1, s1, -1 # len -= 1 to keep count of the elements
    lw t0, 0(s0) # load the respective element
    bne t0, zero, skip_count
    	addi a0, a0, 1 # if here count the zero
    skip_count: bne s1, zero, loop
    
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
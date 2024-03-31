# prints the sum of 2 integers

.data
    .word 12
    .word 7
.text
    lui s0, 0x10010# store the first address
    lw t0, 0(s0) # store first value (12) in t0
    lw t1, 4(s0) # store second value (7)in t1
    add a0, t0, t1
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall

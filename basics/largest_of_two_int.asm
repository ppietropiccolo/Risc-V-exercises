# exercise 2: print the largest of two integers

.data
    .word -2
    .word -3
.text
    lui s0, 0x10010
    lw t0, 0(s0)
    lw t1, 4(s0)
    sub t2, t0, t1
    addi a7, zero, 1
    blt t2, zero, second
    add a0, t0, zero
    ecall
    addi a7, zero, 10
    ecall
    second: add a0, t1, zero
    ecall
    addi a7, zero, 10
    ecall
    
# it is better to put the first value in a0 so it either prints it or swap it and prints it
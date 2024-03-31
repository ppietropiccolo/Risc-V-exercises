.text
    add a0, zero, t0
    add a1, zero, t1
    jal ra, sommma
    li a7, 1
    ecall
    somma: add a0, a0, a1
    jalr zero, ra, 0
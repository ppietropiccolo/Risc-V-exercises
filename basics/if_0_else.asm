# if x0 == 0 print y, else print z

.data
    x: .word 1
    y: .word 3
    z: .word 7
.text
    # lui s0, 0x10010
    lw t0, x
    lw a0, y
    lw t2, z
    beq t0, zero, print_y
    add a0, zero, t2 # if not equal it overwrites a0 with z
    print_y: addi a7, zero, 1 # if equal it goes here and in a0 there is y
    ecall
    addi a7, zero, 10
    ecall
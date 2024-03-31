.data
    .word 1 # ziopera
.text
    # this is the part where we call the function f
    addi a0, zero, 5
    jal ra, f
    addi a7, zero, 1
    ecall # print the result
    f: bne a0, zero, rec # recursive case
        addi a0, zero, 1 # if here, it means we are in the base case, so just return one
        rec: addi sp, sp, -8
        sw ra, 0(sp)
        sw a0, 4(sp)
        addi a0, a0, -1
        jal ra, f
    # now a0 contains (x-1)!, we need to multiply by the original x
    lw t0, 4(sp)
    mul a0, a0, t0
    lw ra, 0(sp)
    addi sp, sp, 8 # so we use the stack pointer but we want it to stay to its original value

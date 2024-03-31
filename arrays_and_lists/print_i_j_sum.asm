# print the sum of all the elements x[i:j] (last is j-1)

.data
    i: .word 4
    j: .word 9
    l: .word 12
    x: .word 5, -1, 7, 3, 1, 0, 0, 3, 4, 8, 11, 12 # prints from 1 to 4 (= 8)
.text
    lui s0, 0x10010 # load the initial address
    lw s1, 0(s0) # s1 = i
    lw s2, 4(s0) # s2 = j
    addi t0, s0, 12 # t0 = address of x[0]
    slli t2, s1, 2 # i*4
    add t0, t0, t2 # t0 = right address of x{i]
    add a0, zero, zero
    loop: lw t1, 0(t0) # load ith element
    	  add a0, a0, t1 # add it to the sum
    	  addi s1, s1, 1
    	  addi t0, t0, 4
    	  bne s1, s2, loop
    # if equal
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
    
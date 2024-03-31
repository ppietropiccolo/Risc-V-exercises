# count how many k such that x <= k < y

.data
    len: .word 5
    x: .word 20
    y: .word 30
    array: .word 21, 27, 25, -2, 28
.text
    lw s0, len
    lw, s1, x
    lw, s2, y
    la s3, array
    add a0, zero, zero
    loop: addi s0, s0, -1
    	  lw t0, 0(s3)
    	  addi s3, s3, 4
    	  blt t0, s1, skip # the number is not good if it is smaller than x
    	  bge t0, s2, skip # nor if grater or equal than y
    	  addi a0, a0, 1
    	  skip: bne s0, zero, loop
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
    
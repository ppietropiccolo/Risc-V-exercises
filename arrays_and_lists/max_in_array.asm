# find the maximum in an array
# works with non-empty array of integers

.data
    .word 7
    .word 1, 3, -5, 29, 3, -11, 7 # should print 29
.text
    lui s0, 0x10010
    lw s1, 0(s0) # s1 contains the length
    lw a0, 4(s0) # initialize the maximum with the first element
    add t0, zero, zero # initialize t0 to 0 (counter)
    loop: addi t0, t0, 1 # counter += 1
    	  addi s0, s0, 4 # adjust pointer to the right address
    	  lw t1, 0(s0) # load the next element in t1
    	  blt t1, a0, prev # check if the element is greater than the previous one
    	      add a0, zero, t1 # if the next is bigger, put it in a0
    	  prev: blt t0, s1, loop
    addi a7, zero, 1
    ecall
    addi a7, zero, 10
    ecall
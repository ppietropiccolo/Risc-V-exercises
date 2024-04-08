# print 1 if the array is sorted

.data
    len: .word 10
    sorted_one: .word -3, -2, 2, 3, 4, 4, 5, 5, 5, 5
    unsorted_one: .word -3, 4, 2, -5, 2, 6, 5, 5, 5, 5
.text
    lui t0, 0x10010
    lw s0, 0(t0)
    addi t0, t0, 4
    lw t2, 0(t0) # set the previous element to the first one by default
    addi a0, zero, 1 # initialize a0 to print 1 (sorted)
    jal is_sorted
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    is_sorted: addi s0, s0, -1 
    lw t1, 0(t0) # load an element
    bge t1, t2, still_sorted
    add a0, zero, zero # put 0 in a0 and exit
    jalr ra
    still_sorted: add t2, zero, t1 # set t2 to the previous item
    addi t0, t0, 4
    bne s0, zero, is_sorted
    jalr ra
    
    
    
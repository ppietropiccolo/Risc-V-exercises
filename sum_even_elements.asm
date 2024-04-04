# print the sum of the element of the list skipping the ones in an even position (result = 5)

.data
    len: .word 7
    x: .word 4, -2, 3, 4, 4, 3, 1
.text
    lui t0, 0x10010
    lw t1, 0(t0) # length
    add a0, zero, zero # result counter
    addi t0, t0, 8 # t0 points to the first element of the array
    loop: lw t2, 0(t0)
    add a0, a0, t2
    addi t0, t0, 8
    addi t1, t1, -2
    bgt t1, zero, loop
    
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
# fix the file name and do it in a linked list (sum_odd_elements_list.asm)
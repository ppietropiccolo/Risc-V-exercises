# mirror a binary tree

.data
    tree: .word node1
    node3: .word 7, node4, node5
    node1: .word 7, node2, node3
    node4: .word 6, 0, 0
    node2: .word 6, node8, 0
    node5: .word 7, 0, node6
    node6: .word 2, node7, 0
    node7: .word 1, 0, 0
    node8: .word 6, 0, 0
    char: .ascii "-"
.text
    lui a0, 0x10010
    lw a0, 0(a0)
    jal ra, mirror
    addi a7, zero, 10
    ecall # exit
    
    mirror: bne a0, zero, rec
    		jalr zero, ra, 0
    rec: addi sp, sp, -8
    	 sw ra, 0(sp) # store the return address
    	 lw t0, 4(a0) # load left child address
    	 lw t1, 8(a0) # load right child address
    	 sw t1, 4(a0) # store riglt into left
    	 sw t0, 8(a0) # store left into right
    	 add a0, zero, t1 # move left child in a0
    	 sw t0, 4(sp) # save right child in the stack
    	 jal ra, mirror # recursive call: mirror the left child
    	 lw a0, 4(sp) # load the right child
    	 jal ra, mirror # now mirror the right child
    	 lw ra, 0(sp) # load the correct return address
    	 addi sp, sp, 8
    	 jalr zero, ra, 0
    	 
    print_tree: bne a0, zero, rec
    
    
    print_char: addi a0, x0, 1 # 1 = StdOut
    la a1, char # load address of char
    addi  a2, x0, 14 # length of our string
    addi  a7, x0, 64 # linux write system call (code to print string instances of lenght a2 <- only if a0 contains 1)
    ecall # Call linux to output the string
    jalr ra
    	   

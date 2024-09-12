# print 1 if linked list is sorted in increasing order
# this was the midterm exercise!

.data
    list: .word node1
    node2: .word -2, node3
    node1: .word -100, node2
    node3: .word 1025, node4
    node4: .word 1024, 0
.text
    lw a0, list
    jal is_sorted
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    is_sorted: 	lw a1, 0(a0) 	 # load first element
    		add t0, zero, a1 # t0 = first element, initialization of the prev value
    loop: lw a1, 0(a0) 		# load element
    	  ble t0, a1, good 	# if prev is less or equalthan current then jump
    	  addi a0, zero, 0	# put 0 in a0 because it's not sorted
    	  jalr ra 		# exit from the function
    	  good: lw a0, 4(a0) 	# a0 = next address
    	  add t0, zero, a1 	# prev = current element
    	  bne a0, zero, loop
    addi a0, zero, 1 # if here then the list is sorted so put 1 in a0
    jalr ra # and exit
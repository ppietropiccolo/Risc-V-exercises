# find the sum of all the nodes of a genral tree

# a general tree is made by nodes which contain 3 values each:
# the node value, a pointer to the right brother, a pointer to the most left of the children
# (forest of right brothers and forest of children)

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
.text
    lw a0, tree
    jal ra, sum_tree
    addi a7, zero, 1
    ecall # print
    addi a7, zero, 10
    ecall # exit
    
    sum_tree: bne a0, zero, rec
    			  jalr zero, ra, 0
	rec: add...
    
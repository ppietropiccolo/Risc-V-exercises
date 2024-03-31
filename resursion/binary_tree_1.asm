# just the data structure of a tree, maybe sum its values??

.data
    tree: .word node1 #                 7
    node1: .word 7, node2, node3 #     / \
    node2: .word 3, 0, 0 #           3    5
    node3: .word 5, node4, 0 #           /
    node4: .word 8, 0, 0 #             8
    
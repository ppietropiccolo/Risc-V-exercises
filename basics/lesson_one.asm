.data
    .word 5 # 0x 00 00 00 05 -> depending on the computer it can be stored starting from the left or from the right
    .word 8 # if msf first it is called little endian, if lsb first it's called big endian
.text
    lui s0, 0x10010
    addi t0, s0, 0
    lw t1, 4(s0)
    addi a0, zero, 1 # this because there is no instruction to put a value in a register (w/o adding or oring)
    beq t0, t1, 24 # i guess that ziopera instruciton = line 6
    addi a0, zero, 0 # the purpose is to skip this line
    addi a7, zero, 1 # ziopera instruction
    # a7 is x17 and 1 is the code to print (always print a0 so put smth in it)
    ecall # the system reads a7 and in this case prints a0
    addi a7, zero, 10 # the code to exit    
    ecall # now the system exits
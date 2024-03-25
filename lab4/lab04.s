# NAME:
# Q1: 
# Q3: 
.data
foo:    .word 15
.text

#TODO Q1:
#Two instructions to compare on the processor would be addi x5 x0 10(li t0, 10) that 
#happens in main, and add x10 x10 x11, for starters the instruction indicated in 
#the instruction memory differ, the first containing 00a00293 and the second 
#00b50533. But the main difference is the inputs on the mux connected to the ALU, 
#for the first instruction the mux select a register and an imm, reg1 being
# x0(0x00000000) and the imm 10(0x0000000a) and nothing for reg2, while on the second
#the mux select both register re1(a0, 0x00000000) and reg2(a1, 0x00000002).   

main:
    sw a0 0(zero)	  
    li a1, 2
    li t0, 10
begin: 	  
    add a0, a0, a1
    and a2, a0, a1
    
# TODO Q2: For this question the screenshot signals a branch instruction, so to implement this
#I wrote beq a0 a2 end because registers a0 and a2 are equal after the instructions above. The
#main indicator of this type of instruction on the processor is in the branch functional unit
#branch taken is enabled. 
    beq a0 a2 end
end:
    lw a0, foo
    li a7, 10
    ecall
    
#TODO Q3: If write enable is low/red in the registers functional unit then this means nothing 
#is being written on registers, and in the screenshot, written enable is on in the the data memory
#which means data is being written is memory which means this screenshot corresponds to a storing
#instruction such as sw x10 0 x0(sw a0 0(zero)) which loads 0 onto a0. 
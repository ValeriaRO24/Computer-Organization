# NAME:
# Q1:
# 1. 
# a. IF
# b. Instruction fetch from memory
# c. Instruction Memory
# 2. 
# a. ID
# b. Instruction decode & register read
# c.  Decode, Registers
# 3. 
# a. EX
# b. Execute operation or calculate address
# c. Mux, ALU
# 4. 
# a. MEM
# b. Access memory operand
# c. Data Memory
# 5. 
# a. WB
# b. Write result back to register
# c. Registers
#
# Q2: 
# c. Yes it runs without the nops
# d.
# Num_Cycles 5-stage w/o forwarding or hazard detection: 25
# Num_Cycles 5-stage: 16
# Speedup: 1.56
#
# Q3:
# Single-Cycle Processor:
#    a. 1050
#    b. 1050
#    c. 0
# 5-stage Processor w/o Forwarding Unit
#    a. 300
#    b. 1800
#    c. 1.74
# 5-stage Processor (Pipelined)
#    a. 300
#    b. 1500
#    c. 1.94

.text     
main:
    # TODO Q2a.: Write the value of the array next to each corresponding sw instruction.
    # TODO Q2b.: Add noops to make this work as expected.
    auipc s0, 0x10000 # load the memory address at which we store the array
    li x3, 7
    li x4, 15
    #nop
    sw x3, 0(s0) # 7
    

    addi x3, x3, 2
 
    #nop
    #nop
    sw x3, 4(s0) # 9
  
    addi x3, x3, 2
    #nop
    #nop
    sw x3, 8(s0) # 11
 
    addi x3, x3, 2
   # nop
   # nop
    sw x3, 12(s0) # 13
   
    addi x3, x3, 2
   # nop
   # nop
    sw x3, 16(s0) # 15
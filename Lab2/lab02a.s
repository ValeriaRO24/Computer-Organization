.data

newline: .string "\n"
array1:    .word    5, 8, 3, 4, 7, 2



.globl main
.text

main:
    
    li t0, 0
    la t1, array1
    
    li t5, 1 #Integer to be multipled
    
    li t3 21
    
    
    
LOOPSTART:
   
    
    add t2, t1, t0 #Offset
    
    lw t4 0(t2) 
    
    mul t5, t5, t4

    li a7 1
    mv a0 t5
    ecall 
    
    
    li a7, 4
	la a0, newline
	ecall
    
    
    
    addi t0, t0, 4
    
    blt t0 t3 LOOPSTART




    
DONE:
    #PRINT t5
    li a7, 1
	mv a0, t5
	ecall

	li a7, 4
	la a0, newline
	ecall

	li a7, 10
	ecall

# You can ignore how this part works. You will eventually
# be able to understand most of this in later labs, but we won't
# expect you to deal with file IO in this course.

# Use this to read an integer from the console into a0. You're free
# to use this however you see fit.
readInt:
    addi sp, sp, -12
    li a0, 0
    mv a1, sp
    li a2, 12
    li a7, 63
    ecall
    li a1, 1
    add a2, sp, a0
    addi a2, a2, -3
    mv a0, zero
parse:
    blt a2, sp, parseEnd
    lb a7, 0(a2)
    addi a7, a7, -48
    li a3, 9
    bltu a3, a7, error
    mul a7, a7, a1
    add a0, a0, a7
    li a3, 10
    mul a1, a1, a3
    addi a2, a2, -1
    j parse
parseEnd:
    addi sp, sp, 12
    ret

error:
    li a7, 93
    li a0, 1
    ecall

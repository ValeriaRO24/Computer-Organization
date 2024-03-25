.data
# TODO: What are the following 5 lines doing?
promptA: .string "Enter an int \n"
promptN: .string "Enter an int N\n"
newline: .string "\n"



.globl main
.text

main:
    
    li t1, 1 #Integer to be multipled
    li t2, 0 #Counter
    
    li a7, 4
	la a0, promptN
	ecall

    call readInt
	mv t4, a0 #N is held inside t4
    
    
LOOPSTART:
    bge t2, t4, DONE
    
	li a7, 4
	la a0, promptA
	ecall

 
	call readInt
	mv t0, a0
    mul t1, t1, t0
    addi t2, t2, 1
    
    j LOOPSTART




    
DONE:
    #PRINT t1
    li a7, 1
	mv a0, t1
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

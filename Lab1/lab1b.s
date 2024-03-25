.data
# TODO: What are the following 5 lines doing?
promptA: .string "Enter an int A\n"
promptB: .string "Enter an int B\n"
promptC: .string "Enter an int C\n"
resultAdd: .string "A + 42 = "
resultSub: .string "B - A = "
resultnew: .string "A + B + C = "
newline: .string "\n"

.globl main
.text

main:
    #Prompt A
	li a7, 4
	la a0, promptA
	ecall

  
	call readInt
	mv t0, a0

    #Prompt B
	li a7, 4
	la a0, promptB
	ecall

   
	call readInt
	mv t1, a0

    #Prompt C
	li a7, 4
	la a0, promptC
	ecall

	call readInt
	mv t2, a0




	#Adding
    add t3, t0, t1
    add t4, t3, t2

	li a7, 4
	la a0, resultnew
	ecall

   
	li a7, 1
	mv a0, t4
	ecall

    # TODO: Why is the next block of three lines needed?
    # Remove them and explain what happens.
	#li a7, 4
	#la a0, newline
	#ecall

	#li a7, 4
	#la a0, resultSub
	#ecall

    #CHANGED THIS ONE
	#mv a0, t4
	#li a7, 1
	#ecall

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

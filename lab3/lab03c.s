
.data
prompt: .string "Enter a number\n"
result: .string "The result is "

newline: .string "\n"

.globl main
.text

main:
	

	li a7, 4
	la a0, prompt
	ecall

	call readInt
	mv t0, a0

    li s1, 0
    
    mv a0, t0
    
    jal FUNC
    
    mv t0 a0
    
    li a7, 4
	la a0, result
	ecall
    
    li a7 1
    mv a0 t0
    ecall
    
    li a7 4
    la a0 newline
    ecall

	
DONE:
    
    li a7 10
    ecall
 	 
 
 
 
 FUNC:
     beq a0 s1 BC
     
     addi sp sp -4
     sw ra (0)sp
     
     addi sp sp -4
     sw a0 (0)sp
     
     
     addi a0 a0 -1
     jal FUNC
     
     lw t1 (0)sp
     addi sp sp 4
     
     lw ra (0)sp
     addi sp sp 4
     
     li t2 2
     
     mul t1 t1 t2
     addi t1 t1 -1
     add a0 a0 t1
     
     
     
     

FUNCDONE:
    
    ret
    
BC:
    ret
    
    

 
 
 
 
 
 
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

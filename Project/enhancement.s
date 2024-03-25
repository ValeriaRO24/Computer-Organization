.data
sequence:  .byte 0,0,0,0
count:     .word 4
check: .string "Reached end of squence\n"
ending: .string "Reached end of squence\n"
opening: .string "Simone says Welcome to the game!\n"
wrongmessage: .string "INCORRECT, failed the squence, Simon is disappointment.\n"
rightmessage: .string "CORRECT, Simon approves, you may continue.\n"
prompt: .string "If you want to play again click UP\nIf you would like to reattempt the sequence press DOWN\nIf want to end the game click any other pad key\n"
exitmessage: .string "Simon says Thank you for playing!\n"
victorymessage: .string "Simon says Congratulations! You have bested Simon!\n"
totalv: .string "Total number of victory rounds during game is "


.globl main
.text

main:
    # TODO: Before we deal with the LEDs, we need to generate a random
    # sequence of numbers that we will use to indicate the button/LED
    # to light up. For example, we can have 0 for UP, 1 for DOWN, 2 for
    # LEFT, and 3 for RIGHT. Store the sequence in memory. We provided 
    # a declaration above that you can use if you want.
    # HINT: Use the rand function provided to generate each number
    
    li a5 500
    li x25 1000
    li x27 0
    STARTOVER:
        li a7, 4
	    la a0, opening
	    ecall

        li x16 0
     
    
    #Load the squence
    #The squence is under t3
    la t3 sequence
    li a0 4
    jal rand
    sw a0 0(t3)
    
    li a0 4
    jal rand
    sw a0 4(t3)
    
    li a0 4
    jal rand
    sw a0 8(t3)
    
    li a0 4
    jal rand
    sw a0 16(t3)
    

   
    # TODO: Now read the sequence and replay it on the LEDs. You will
    # need to use the delay function to ensure that the LEDs light up 
    # slowly. In general, for each number in the sequence you should:
    # 1. Figure out the corresponding LED location and colour
    # 2. Light up the appropriate LED (with the colour)
    # 2. Wait for a short delay (e.g. 500 ms)
    # 3. Turn off the LED (i.e. set it to black)
    # 4. Wait for a short delay (e.g. 1000 ms) before repeating
    
    SAMESQUENCE:
    la t3 sequence
    lw t4 0(t3)
  
    li x20 0
    li x21 1
    li x22 2
    li x23 3
    
    FIRST:
    beq t4 x20 FTL
    beq t4 x21 FTR
    beq t4 x22 FBL
    beq t4 x23 FBR
    
    SECOND:
    lw t4 4(t3)
    beq t4 x20 STL
    beq t4 x21 STR
    beq t4 x22 SBL
    beq t4 x23 SBR
    
    THIRD:
    lw t4 8(t3)
    beq t4 x20 TTL
    beq t4 x21 TTR
    beq t4 x22 TBL
    beq t4 x23 TBR
    
    FOURTH:
    lw t4 16(t3)
    beq t4 x20 FFTL
    beq t4 x21 FFTR
    beq t4 x22 FFBL
    beq t4 x23 FFBR
    
     FTL:
         
        jal TOPLEFT
        j SECOND
        
    FTR:
        jal TOPRIGHT
        j SECOND
        
    FBL:
        jal BOTTEMLEFT
        j SECOND
        
    FBR:
        jal BOTTEMRIGHT
        j SECOND
        
    #----------------
        
     STL:
        jal TOPLEFT
        j THIRD
        
    STR:
        jal TOPRIGHT
        j THIRD
        
    SBL:
        jal BOTTEMLEFT
        j THIRD
        
    SBR:
        jal BOTTEMLEFT
        j THIRD
        
     #----------------
        
     TTL:
        jal TOPLEFT
        j FOURTH
        
    TTR:
        jal TOPRIGHT
        j FOURTH
        
    TBL:
        jal BOTTEMLEFT
        j FOURTH
        
    TBR:
        jal BOTTEMRIGHT
        j FOURTH
        
    #----------------
        
     FFTL:
        jal TOPLEFT
        j END
        
    FFTR:
        jal TOPRIGHT
        j END
        
    FFBL:
        jal BOTTEMLEFT
        j END
        
    FFBR:
        jal BOTTEMRIGHT
        j END
        
        
    
    
    TOPLEFT:
         addi sp sp -4
         sw ra (0)sp
        
        li a0 1161975
        li a1 0
        li a2 0
        jal setLED
        
        li a0 1161975
        li a1 1
        li a2 0
        jal setLED
        
        li a0 1161975
        li a1 0
        li a2 1
        jal setLED
        
        li a0 1161975
        li a1 1
        li a2 1
        jal setLED
    
        add a0 x0 a5
        jal delay
    
    
        li a0 0
        li a1 0
        li a2 0
        jal setLED
        
        li a0 0
        li a1 1
        li a2 0
        jal setLED
        
        li a0 0
        li a1 0
        li a2 1
        jal setLED
        
        li a0 0
        li a1 1
        li a2 1
        jal setLED
    
        add a0 x0 x25
        jal delay
        li t6 1
        
        lw ra (0)sp
        addi sp sp 4
        
        ret
        
    TOPRIGHT:
        addi sp sp -4
         sw ra (0)sp
         
       li a0 16751851
        li a1 2
        li a2 0
        jal setLED
        
        li a0 16751851
        li a1 3
        li a2 0
        jal setLED
        
        li a0 16751851
        li a1 2
        li a2 1
        jal setLED
        
        li a0 16751851
        li a1 3
        li a2 1
        jal setLED
    
        add a0 x0 a5
        jal delay
    
    
        li a0 0
        li a1 2
        li a2 0
        jal setLED
        
        li a0 0
        li a1 3
        li a2 0
        jal setLED
        
        li a0 0
        li a1 2
        li a2 1
        jal setLED
        
        li a0 0
        li a1 3
        li a2 1
        jal setLED
    
        add a0 x0 x25
        jal delay
         li t6 1
         
         lw ra (0)sp
        addi sp sp 4
        
        ret
        
    BOTTEMLEFT:
        addi sp sp -4
         sw ra (0)sp
         
        li a0 16744737
        li a1 0
        li a2 2
        jal setLED
        
        li a0 16744737
        li a1 1
        li a2 2
        jal setLED
        
        li a0 16744737
        li a1 0
        li a2 3
        jal setLED
        
        li a0 16744737
        li a1 1
        li a2 3
        jal setLED
    
        add a0 x0 a5
        jal delay
    
    
        li a0 0
        li a1 0
        li a2 2
        jal setLED
        
        li a0 0
        li a1 1
        li a2 2
        jal setLED
        
        li a0 0
        li a1 0
        li a2 3
        jal setLED
        
        li a0 0
        li a1 1
        li a2 3
        jal setLED
        
        add a0 x0 x25
        jal delay
         li t6 1
         
         lw ra (0)sp
        addi sp sp 4
        ret
        
    BOTTEMRIGHT:
        addi sp sp -4
         sw ra (0)sp
         
        li a0 11361264
        li a1 2
        li a2 2
        jal setLED
        
        li a0 11361264
        li a1 2
        li a2 3
        jal setLED
        
        li a0 11361264
        li a1 3
        li a2 2
        jal setLED
        
        li a0 11361264
        li a1 3
        li a2 3
        jal setLED
    
    
        add a0 x0 a5
        jal delay
    
    
       li a0 0
        li a1 2
        li a2 2
        jal setLED
        
        li a0 0
        li a1 2
        li a2 3
        jal setLED
        
        li a0 0
        li a1 3
        li a2 2
        jal setLED
        
        li a0 0
        li a1 3
        li a2 3
        jal setLED
    
        add a0 x0 x25
        jal delay
         li t6 1
         lw ra (0)sp
        addi sp sp 4
        
        ret
 
        
        
        
    END:
        li a7, 4
	    la a0, ending
	    ecall
         li a6 16777062
         jal FLASHALL

        

    jal pollDpad
    la t3 sequence
    lw t4 0(t3)
    bne t4 a0 WRONG
        li a7, 4
	    la a0, rightmessage
	    ecall

        li a6 655104
         jal FLASHALL
    
    
    
    jal pollDpad
    la t3 sequence
    lw t4 4(t3)
    bne t4 a0 WRONG
    li a7, 4
	    la a0, rightmessage
	    ecall
    
    li a6 655104
         jal FLASHALL
    
    jal pollDpad
    la t3 sequence
    lw t4 8(t3)
    bne t4 a0 WRONG
    li a7, 4
	    la a0, rightmessage
	    ecall

   li a6 655104
         jal FLASHALL
    
    jal pollDpad
    la t3 sequence
    lw t4 16(t3)
    bne t4 a0 WRONG
    li a7, 4
	    la a0, rightmessage
	    ecall

   li a6 655104
         jal FLASHALL
    
    
    
    j VICTORY
    
    WRONG:
         li a7, 4
	    la a0, wrongmessage
	    ecall
        li a6 16711680
         jal FLASHALL
    
        j ROUNDDONE

    
    
    


    # TODO: Ask if the user wishes to play again and either loop back to
    # start a new round or terminate, based on their input.
    
    VICTORY:
        li a7, 4
	    la a0, victorymessage
	    ecall

        li a6 16777062
         jal FLASHALL
         
         li a6 16777062
         jal FLASHALL
         
        li x18 50
        sub a5 a5 x18
        sub x25 x25 x18
        addi x27 x27 1
     
        
        j ROUNDDONE
        
    
    ROUNDDONE:
        li a7, 4
	    la a0, prompt
	    ecall
        jal pollDpad
        li t6 0
        li t5 1
        
        #li a7, 1
	    #mv a0, t6
	   # ecall

        beq t6 a0 STARTAGAIN
        beq t5 a0 TRYAGAIN
        
        
   

exit:
        li a7, 4
	    la a0, exitmessage
	    ecall
        li a7, 4
	    la a0, totalv
	    ecall
        li a7, 1
	    mv a0, x27
	    ecall

    li a7, 10
    ecall
    
      STARTAGAIN:
          li a6 6089466
         jal FLASHALL
         
        
          
            j STARTOVER
            
        TRYAGAIN:
            li a6 15337458
             jal FLASHALL
             
            j SAMESQUENCE
        
      
#Flashes all the LEDs on the board according to the colour stored in a6
FLASHALL:
        addi sp sp -4
        sw ra (0)sp
    #flash colour
        add a0 x0 a6
        li a1 0
        li a2 0
        jal setLED
        
        add a0 x0 a6
        li a1 1
        li a2 0
        jal setLED
        
        add a0 x0 a6
        li a1 0
        li a2 1
        jal setLED
        
        add a0 x0 a6
        li a1 1
        li a2 1
        jal setLED
        
         add a0 x0 a6
        li a1 2
        li a2 0
        jal setLED
        
        add a0 x0 a6
        li a1 3
        li a2 0
        jal setLED
        
        add a0 x0 a6
        li a1 2
        li a2 1
        jal setLED
        
        add a0 x0 a6
        li a1 3
        li a2 1
        jal setLED
        
        add a0 x0 a6
        li a1 0
        li a2 2
        jal setLED
        
        add a0 x0 a6
        li a1 1
        li a2 2
        jal setLED
        
        add a0 x0 a6
        li a1 0
        li a2 3
        jal setLED
        
        add a0 x0 a6
        li a1 1
        li a2 3
        jal setLED
        
         add a0 x0 a6
        li a1 2
        li a2 2
        jal setLED
        
        add a0 x0 a6
        li a1 2
        li a2 3
        jal setLED
        
        add a0 x0 a6
        li a1 3
        li a2 2
        jal setLED
        
        add a0 x0 a6
        li a1 3
        li a2 3
        jal setLED
    
    
    
    #delay
        li a0 500
        jal delay
    
    
    
    #turn off
        li a0 0
        li a1 0
        li a2 0
        jal setLED
        
        li a0 0
        li a1 1
        li a2 0
        jal setLED
        
        li a0 0
        li a1 0
        li a2 1
        jal setLED
        
        li a0 0
        li a1 1
        li a2 1
        jal setLED
        
         li a0 0
        li a1 2
        li a2 0
        jal setLED
        
        li a0 0
        li a1 3
        li a2 0
        jal setLED
        
        li a0 0
        li a1 2
        li a2 1
        jal setLED
        
        li a0 0
        li a1 3
        li a2 1
        jal setLED
        
        
        li a0 0
        li a1 0
        li a2 2
        jal setLED
        
        li a0 0
        li a1 1
        li a2 2
        jal setLED
        
        li a0 0
        li a1 0
        li a2 3
        jal setLED
        
        li a0 0
        li a1 1
        li a2 3
        jal setLED
        
        
        li a0 0
        li a1 2
        li a2 2
        jal setLED
        
        li a0 0
        li a1 2
        li a2 3
        jal setLED
        
        li a0 0
        li a1 3
        li a2 2
        jal setLED
        
        li a0 0
        li a1 3
        li a2 3
        jal setLED
        
        li a0 200
        jal delay
        
        
        
        lw ra (0)sp
        addi sp sp 4
        
        ret
    
    
    
# --- HELPER FUNCTIONS ---
# Feel free to use (or modify) them however you see fit
     
# Takes in the number of milliseconds to wait (in a0) before returning
delay:
    mv t0, a0
    li a7, 30
    ecall
    mv t1, a0
delayLoop:
    ecall
    sub t2, a0, t1
    bgez t2, delayIfEnd
    addi t2, t2, -1
delayIfEnd:
    bltu t2, t0, delayLoop
    jr ra

# Takes in a number in a0, and returns a (sort of) random number from 0 to
# this number (exclusive)
rand:
    mv t0, a0
    li a7, 30
    ecall
    remu a0, a0, t0
    jr ra
    
# Takes in an RGB color in a0, an x-coordinate in a1, and a y-coordinate
# in a2. Then it sets the led at (x, y) to the given color.
setLED:
    li t1, LED_MATRIX_0_WIDTH
    mul t0, a2, t1
    add t0, t0, a1
    li t1, 4
    mul t0, t0, t1
    li t1, LED_MATRIX_0_BASE
    add t0, t1, t0
    sw a0, (0)t0
    jr ra
    
# Polls the d-pad input until a button is pressed, then returns a number
# representing the button that was pressed in a0.
# The possible return values are:
# 0: UP
# 1: DOWN
# 2: LEFT
# 3: RIGHT
pollDpad:
    mv a0, zero
    li t1, 4
pollLoop:
    bge a0, t1, pollLoopEnd
    li t2, D_PAD_0_BASE
    slli t3, a0, 2
    add t2, t2, t3
    lw t3, (0)t2
    bnez t3, pollRelease
    addi a0, a0, 1
    j pollLoop
pollLoopEnd:
    j pollDpad
pollRelease:
    lw t3, (0)t2
    bnez t3, pollRelease
pollExit:
    jr ra

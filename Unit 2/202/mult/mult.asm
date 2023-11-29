// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@9
D = A
@R0 //load 9 into R
M = D
@12 
D = A 
@R1  //load 12 into R1
M = D
@R2 
M = 0
@i //RAM[16] as is a user label set to 0
M = 0 
(LOOP)
@i 
D = M
@R1
D = D - M
@CONT
    D;JGE // jump if great htan or equal to 0 by defult
    @R0
    D = M 
    @R2
    M = M + D
    @i
    M = M + 1 // i++
    @LOOP
    0;JMP  // go back to start of while loop


(CONT)

(END)
	@END
	0;JMP	//inf loop when target sucsessfully reached
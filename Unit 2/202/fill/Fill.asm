// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
/* 
D = 0
@pressed
M = D 

D = 0
@address
M = D 

(INF)

D = 0
@RAM[24576] 
D = D - A 
@INF
D;JGE

D = -1
@address
M = D 

@INF
0;JMP
*/

(INF_LOOP)  // start of infinite loop

    @fill
    M = 0   // set fill type to be white by default (fill = 0)

    @KBD
    D = M   // store keyboard in D (0 when not pressed, >0 when pressed)
    
    @FALSE
    D;JEQ   // if keyboard not pressed (=0) then skip over next bit
    
    @fill
    M = -1    // fill = -1 (1111111111..) to set black pixels
    
    (FALSE)

    @SCREEN
    D = A   // D = 16384 (start address of screen memory map)
    @address
    M = D   // initialise address variable with start address (address = 16384)

    (WHILE)  // while(address - screen_end_address < 0)

        // work out loop condition
        @address
        D = M  // D = current address value
        @KBD   // @KBD    
        D = D - A  // D = current address - 24576 (subtract keyboard address 24576 as that is directly after the screen memory map)

        @END_WHILE
        D;JEQ     // end loop when address is bigger than end address

        @fill     // copy the fill value to D
        D = M

        @address  // copy the VALUE stored in the address variable to... 
        A = M     // ...the A register (M now points at this address in the screen memory map)
        
        M = D     // write the fill value to that location in the screen memory map

        @address
        M = M + 1 // increment that value stored in the address variable (address++)

        @WHILE
        0;JMP   // go back to start of loop
    (END_WHILE)


@INF_LOOP
0;JMP  // unconditional jump back to the start

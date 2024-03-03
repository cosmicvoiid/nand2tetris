// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Initialize variables
@lastkey
M=0

@8192
D=A
@screenSize
M=D
@SCREEN
D=A
@screenSize
M=M+D

(RESET)
@SCREEN
D=A
@lastScreenLocation
M=D
@LISTEN
0;JMP

// Start Loop
(LISTEN)
@KBD
D=M
@lastkey
D=D-M
@LISTEN
D;JEQ

@KBD
D=M
@lastkey
M=D
@LOOPDARKEN
D;JNE
@LOOPLIGHTEN
D;JEQ

(LOOPDARKEN)
@lastScreenLocation
D=M
@screenSize
D=M-D
@RESET
D;JEQ

@lastScreenLocation
A=M
M=-1
@lastScreenLocation
M=M+1

@LOOPDARKEN
0;JMP

(LOOPLIGHTEN)
@lastScreenLocation
D=M
@screenSize
D=M-D
@RESET
D;JEQ

@lastScreenLocation
A=M
M=0
@lastScreenLocation
M=M+1

@LOOPLIGHTEN
0;JMP

(END)
@END
0;JMP

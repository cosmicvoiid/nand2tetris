// Multiply two values in R0 and R1 and
// store in R2

// Initialize variables
@R0
D=M
@num1
M=D

@R1
D=M
@num2
M=D

@R2
M=0

@sum
M=0

@i
M=0

// Run Loop
(LOOP)
@i
D=M
@num2
D=M-D
@STOP
D;JEQ

@sum
D=M
@num1
D=D+M
@sum
M=D

@i
M=M+1

@LOOP
0;JMP

(STOP)
@sum
D=M
@R2
M=D

(END)
@END
0;JEQ

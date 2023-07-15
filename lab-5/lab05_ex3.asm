;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 5
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
.ORIG x3000

LD R0, DATA_PTR ;Loads location x4000 into R0
ADD R3, R3, #10 ;Counter
LD R1, ZERO ;Loads 0 into R1

Do_LOOP
STR R1, R0, #0 ;Stores R0 into R1

ADD R0, R0, #1 ;Moves 1 memory location ahead
ADD R1, R1, #1 ;Adds 1 to the value stored
ADD R3, R3, #-1 ;Subtracts 1 from the counter

BRp Do_LOOP
END_Do_LOOP

LD R0, DATA_PTR ;Loads location x4000 into R0
ADD R3, R3, #10 ;Counter
LDR R1, R0, #0 ;Loads R1 into R0

PWR_LOOP

ADD R1, R1, #0 
BRz #1
ADD R1, R1, #0
BRz #5

ADD R1, R1, #0 
BRp #1
ADD R1, R1, #0
ADD R1, R1, R1 ;Squares the value of R1
BRp #1

ADD R1, R1, #1 ;Stores the value 1 into R1

STR R1, R0, #0 ;Stores R0 into R1
ADD R0, R0, #1 ;Moves 1 memory location ahead
ADD R3, R3, #-1 ;Subtracts 1 from the counter

BRp PWR_LOOP
END_PWR_LOOP

LD R0, DATA_PTR ;Loads location x4000 into R0
ADD R0, R0, #6 ;Moves 6 memory locations ahead
LDR R2, R0, #0 ;Loads R0 into R2

HALT

DATA_PTR .FILL x4000
ZERO .FILL #0

.ORIG x4000

ARRAY_1 .BLKW #10
;x4000 .FILL #0

.END
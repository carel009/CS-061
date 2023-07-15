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

LD R0, DATA_PTR ;loads location x4000 into R0
ADD R3, R3, #10 ;Counter
LD R1, ZERO

Do_LOOP
STR R1, R0, #0
ADD R0, R0, #1 ;Moves 1 memory location ahead
ADD R1, R1, #1 ;Adds 1 to the value stored
ADD R3, R3, #-1 ;Subtracts 1 from the counter

BRp Do_LOOP
END_Do_LOOP

ADD R3, R3, #10
LD R0, DATA_PTR
OUTPUT_LOOP
ADD R0, R0, #15
ADD R0, R0, #15
ADD R0, R0, #15
ADD R0, R0, #3
OUT
ADD R0, R0, #-15
ADD R0, R0, #-15
ADD R0, R0, #-15
ADD R0, R0, #-2
ADD R3, R3, #-1
BRp OUTPUT_LOOP
END_OUTPUT_LOOP

HALT

DATA_PTR .FILL x4000
ZERO .FILL #0

.ORIG x4000

ARRAY_1 .BLKW #10
x4000 .FILL #0

.END
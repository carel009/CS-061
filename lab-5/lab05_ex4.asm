;=================================================
; Name: Christopher Arellano
; Email:  carel009@ucr.edu
; GitHub username: CaliDobie
; 
; Lab: lab 5
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
.ORIG x3000			; Program begins here

; lab05_ex3.asm code
LD R0, DATA_PTR ;Loads location x4000 into R0
ADD R3, R3, #10 ;Counter
LD R1, VAL_ZERO ;Loads 0 into R1

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

;LD R0, DATA_PTR ;Loads location x4000 into R0
;ADD R0, R0, #6 ;Moves 6 memory locations ahead
;LDR R2, R0, #0 ;Loads R0 into R2


;Assignment 3 code
;-------------
;Instructions
;-------------
LD R6, Value_addr		; R6 <-- pointer to value to be displayed as binary
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R5, COUNT ;loads COUNT value into R5

BINARY_LOOP
LEA R0, B
PUTS
LD R3, DEC_4 ;loads DEC_4's value into R3
LD R4, DEC_4 ;loads DEC_4's value into R4
LDR R2, R6, #0			; R2 <-- value to be displayed as binary 

SIXTEEN_LOOP ;loop of all 16 bits
ADD R4, R4, #0

FOUR_LOOP ;loop of first 4 bits

ADD R2, R2, #0 ;adds 0 into R2 value
BRn #1 ;if R1 is negative
ADD R2, R2, #0
LEA R0, ONE
ADD R2, R2, #0
BRn #4

ADD R2, R2, #0
BRp #1 ;if R2 is positive
ADD R2, R2, #0
LEA R0, ZERO

PUTS
ADD R2, R2, R2 ;shifts MSB left
ADD R3, R3, #-1 ;subtracts 1 from R3's value
BRnp FOUR_LOOP
END_FOUR_LOOP

ADD R4, R4, #-1

ADD R4, R4, #0
BRp #1 ;if R4 is positive
ADD R4, R4, #0
LD R3, DEC_4 ;loads DEC_4's value into R3
LEA R0, SPACE
ADD R4, R4, #0
BRp #5

ADD R4, R4, #0
BRz #1 ;if R4 is zero
ADD R4, R4, #0
LD R3, DEC_4 ;loads DEC_4's value into R3
LEA R0, NEWLINE

PUTS

ADD R4, R4, #0
BRnp SIXTEEN_LOOP
END_SIXTEEN_LOOP

ADD R6, R6, #1 ;Moves 1 memory location ahead
ADD R5, R5, #-1 ;Subtracts 1 from the counter

BRp BINARY_LOOP
END_BINARY_LOOP


HALT

DEC_4 .FILL #4
COUNT .FILL #10
ZERO .STRINGZ "0"
ONE .STRINGZ "1"
SPACE .STRINGZ " "
NEWLINE .STRINGZ "\n"
B .STRINGZ "b"

;---------------	
;Data
;---------------

Value_addr .FILL x4000	; The address where value to be displayed is stored
DATA_PTR .FILL x4000
VAL_ZERO .FILL #0

.ORIG x4000					; Remote data
ARRAY_1 .BLKW #10
;---------------	
;END of PROGRAM
;---------------	
.END
;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 6
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
.ORIG x3000

;---------------------------
;main code
;---------------------------

;instructions
LD R1, INPUT_COUNTER ;loads the value 17 into R1
LD R3, DATA_PTR ;loads memory location x4000 into R3

LEA R0, PROMPT_USER
PUTS

INPUT_LOOP

GETC ;gets user input
OUT ;echos user input
STR R0, R3, #0 ;stores R0 where R3 is pointing
ADD R3, R3, #1 ;moves R3 to point to the next place in memory
ADD R1, R1, #-1 ;subtracts 1 from R1

ADD R1, R1, #0
BRp INPUT_LOOP
END_INPUT_LOOP





LD R1, ARRAY_COUNTER ;loads the value 16 into R1
LD R5, PWR_PTR ;loads memory location x4200 into R5
LD R3, DATA_PTR ;loads memory location x4000 into R3
ADD R3, R3, #12 ;moves R3 to memory location x4012


ADD R6, R6, #12 ;stores the value 12 in R6




BINARY_TO_DIGIT_LOOP

ADD R6, R6, #0
BRp #1
ADD R6, R6, #0
BRp #14

ADD R6, R6, #0
BRz #1
ADD R6, R6, #0
ADD R2, R2, R2 ;R2 x1
ADD R2, R2, R2 ;R2 x2
ADD R2, R2, R2 ;R2 x3
ADD R2, R2, R2 ;R2 x4
ADD R6, R6, #4 ;stores the value 4 in R6
LD R3, DATA_PTR ;loads memory location x4000 into R3
ADD R3, R3, #15 ;moves R3 to memory location x4015
ADD R3, R3, #1 ;moves R3 to memory location x4016
LD R5, PWR_PTR ;loads memory location x4200 into R5
ADD R6, R6, #0
BRp #1

ADD R0, R0, #0

LDR R7, R5, #0 ;loads the value that R5 points to into R7
LDR R0, R3, #0 ;loads the value that R3 points to into R0
ADD R0, R0, #-15; converts the character to the value
ADD R0, R0, #-15
ADD R0, R0, #-15
ADD R0, R0, #-3

ADD R0, R0, #0
BRp #1
ADD R0, R0, #0
ADD R0, R0, #0
BRp #5

ADD R0, R0, #0
BRz #1
ADD R0, R0, #0
ADD R0, R0, #0
BRz #1

ADD R2, R2, R7
ADD R2, R2, #0

ADD R3, R3, #-1 ;moves one memory location back
ADD R5, R5, #1 ;moves one memory location ahead
ADD R6, R6, #-1
ADD R1, R1, #-1

ADD R1, R1, #0
BRp BINARY_TO_DIGIT_LOOP
END_BINARY_TO_DIGIT_LOOP


;subroutine call

LD R4, SUB_MAKE_BINARY_3200_ADDR
JSRR R4

HALT

PROMPT_USER .STRINGZ "Enter a 16 bit 2's complement binary number initialized with a 'b' \n"
INPUT_COUNTER .FILL #17
ARRAY_COUNTER .FILL #16
VAL_ZERO .FILL #0
DATA_PTR .FILL x4000
PWR_PTR .FILL x4200
SUB_MAKE_BINARY_3200_ADDR .FILL x3200

.ORIG x4000
ARRARY_1 .BLKW #17

.ORIG x4200
.FILL #1
.FILL #2
.FILL #4
.FILL #8
.FILL #16
.FILL #32
.FILL #64
.FILL #128
.FILL #256
.FILL #512
.FILL #1024
.FILL #2048
;.FILL #4096
;.FILL #8192
;.FILL #16384
;.FILL #-32768


.ORIG x3200

;----------------------------------
;subroutine: SUB_MAKE_BINARY_3200
;----------------------------------

;subroutine instructions
SUB_MAKE_BINARY_3200
ST R7, BACKUP_R7_3200
ST R6, BACKUP_R6_3200
ST R5, BACKUP_R5_3200
ST R4, BACKUP_R4_3200
ST R3, BACKUP_R3_3200




LEA R0, NEWLINE
PUTS
LEA R0, B
PUTS
LD R3, DEC_4 ;loads DEC_4's value into R3
LD R4, DEC_4 ;loads DEC_4's value into R4
ADD R2, R2, #0 ;R2 <-- value to be displayed as binary 

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



LD R7, BACKUP_R7_3200
LD R6, BACKUP_R6_3200
LD R5, BACKUP_R5_3200
LD R4, BACKUP_R4_3200
LD R3, BACKUP_R3_3200

;return

RET

;subroutine data

BACKUP_R7_3200 .BLKW #1
BACKUP_R6_3200 .BLKW #1
BACKUP_R5_3200 .BLKW #1
BACKUP_R4_3200 .BLKW #1
BACKUP_R3_3200 .BLKW #1
DEC_4 .FILL #4
COUNT .FILL #10
ZERO .STRINGZ "0"
ONE .STRINGZ "1"
SPACE .STRINGZ " "
NEWLINE .STRINGZ "\n"
B .STRINGZ "b"

.END
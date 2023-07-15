;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 7
; Lab section: 025
; TA: Kevin Tang
;=================================================
.ORIG x3000

LD R1, SUB_MAKE_BINARY_3200_ADDR
JSRR R1

ADD R6, R6, #1

LD R3, SUB_MAKE_DEC_3600_ADDR
JSRR R3

HALT

SUB_MAKE_BINARY_3200_ADDR .FILL x3200
SUB_MAKE_DEC_3600_ADDR .FILL x3600

.ORIG x3200

;Assignment 4 code
;----------------------------------
;subroutine: SUB_MAKE_BINARY_3200
;----------------------------------

;subroutine instructions
SUB_MAKE_BINARY_3200
ST R7, BACKUP_R7_3200
;ST R6, BACKUP_R6_3200
;ST R5, BACKUP_R5_3200
;ST R4, BACKUP_R4_3200
;ST R3, BACKUP_R3_3200
;ST R2, BACKUP_R2_3200
;ST R1, BACKUP_R1_3200
;ST R0, BACKUP_R0_3200

AND R0, R0, #0 ;input
AND R1, R1, #0 ;input count down
AND R2, R2, #0 ;flag register
AND R3, R3, #0 ;input count up
AND R4, R4, #0
AND R5, R5, #0 ;helps with R6 x 10
AND R6, R6, #0 ;Note: use R6 to store the binary representation of the user entered decimal number
AND R7, R7, #0

ADD R1, R1, #5 ;input counter 

Start_LOOP

LD R0, introMessagePtr
PUTS

;first chacter

GETC ;gets user input
OUT ;echos user input

;check if '+'
ADD R0, R0, #-15 ;subtracts 43 to check if '+'
ADD R0, R0, #-15
ADD R0, R0, #-13

ADD R0, R0, #0
BRp #20 ;jump to check if '-' 

ADD R0, R0, #0
BRn #6 ;jump to LD R0, errorMessagePtr

ADD R0, R0, #0
BRz #1 ;jump to ADD R0, R0, #0

ADD R0, R0, #0
ADD R2, R2, #0 ;positive flag
ADD R0, R0, #0
BRz Middle_LOOP ;jump to next input    *** JUMP TO BEGINNING OF OTHER LOOP ***

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

;check if '-'
ADD R0, R0, #0
ADD R0, R0, #-2 ;subtracts 2 to check if '-'

ADD R0, R0, #0
BRp #20 ;jump to check if '0'

ADD R0, R0, #0
BRn #6 ;jump to LD R0, errorMessagePtr

ADD R0, R0, #0
BRz #1 ;jump to ADD R0, R0, #0

ADD R0, R0, #0
ADD R2, R2, #1 ;negative flag
ADD R0, R0, #0
BRz Middle_LOOP ;jump to next input    *** JUMP TO BEGINNING OF OTHER LOOP ***

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

;check if '0'
ADD R0, R0, #0
ADD R0, R0, #-3 ;subtracts 2 to check if '0'

ADD R0, R0, #0
BRzp #14 ;jump to check if above '9'

ADD R0, R0, #0
BRn #1 ;jump to LD R0, errorMessagePtr

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

;check if above '9'
ADD R0, R0, #0
ADD R0, R0, #-10

ADD R0, R0, #0
BRn #14 ;jump to ADD R0, R0, #10

ADD R0, R0, #0
BRzp #1 ;jump to LD R0, errorMessagePtr

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

ADD R0, R0, #0
ADD R0, R0, #10 ;adds 10 to convert input to value

ADD R6, R6, R0
ADD R1, R1, #-1 ;subtracts 1 from input count down
ADD R3, R3, #1 ;adds 1 to input count up



Middle_LOOP

;rest of the chacters

GETC ;gets user input
OUT ;echos user input

;check if newline character
ADD R0, R0, #-10 ;subtracts 10 to check if newline character

ADD R0, R0, #0
BRp #24 ;jump to check if '0'   *** MAKE A CHANGE IN DESTINATION (#18) ***

ADD R0, R0, #0
BRn #10 ;jump to LD R0, errorMessagePtr

ADD R0, R0, #0
BRz #1 ;jump to check if only sign inputted

;check if only sign inputted
ADD R0, R0, #0
ADD R3, R3, #0
BRz #5 ;jump to ADD R1, R1, #0

ADD R3, R3, #0
BRp #1 ;jump to ADD R0, R0, #0

ADD R3, R3, #0
ADD R0, R0, #0
BRz END_Middle_LOOP   ;*** JUMP TO END OF THIS LOOP ***

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

;check if '0'
ADD R0, R0, #0
ADD R0, R0, #-15 ;subtracts 38 to check if '0'
ADD R0, R0, #-15
ADD R0, R0, #-8

ADD R0, R0, #0
BRzp #14 ;jump to check if above '9'

ADD R0, R0, #0
BRn #1 ;jump to LD R0, errorMessagePtr

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

;check if above '9'
ADD R0, R0, #0
ADD R0, R0, #-10

ADD R0, R0, #0
BRn #14 ;jump to ADD R0, R0, #10

ADD R0, R0, #0
BRzp #1 ;jump to LD R0, errorMessagePtr

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LD R0, errorMessagePtr
PUTS
ADD R0, R0, #0
BRnzp Start_LOOP

ADD R0, R0, #0
ADD R0, R0, #10 ;adds 10 to convert input to value

ADD R3, R3, #0
BRz #14 ;jump to ADD R6, R6, R0

ADD R3, R3, #0
BRp #1 ;LD R5, ZERO

ADD R5, R5, #0
AND R5, R5, #0
ADD R5, R5, R6 ;R6 x 1
ADD R5, R5, R6 ;R6 x 2
ADD R5, R5, R6 ;R6 x 3
ADD R5, R5, R6 ;R6 x 4
ADD R5, R5, R6 ;R6 x 5
ADD R5, R5, R6 ;R6 x 6
ADD R5, R5, R6 ;R6 x 7
ADD R5, R5, R6 ;R6 x 8
ADD R5, R5, R6 ;R6 x 9
ADD R6, R5, R6 ;R6 x 10
ADD R6, R6, #0
ADD R6, R6, R0
ADD R1, R1, #-1 ;subtracts 1 from input count down
ADD R3, R3, #1 ;adds 1 to input count up

ADD R1, R1, #0
BRp Middle_LOOP
END_Middle_LOOP

ADD R2, R2, #0
BRz #5 ;jump to LD R0, NEWLINE

ADD R2, R2, #0
BRp #1 ;jump to negative conversion

;negative conversion
ADD R6, R6, #0
NOT R6, R6
ADD R6, R6, #1

ADD R0, R0, #0
LEA R0, NEWLINE
PUTS

ADD R6, R6, #0
END_Start_LOOP

LD R7, BACKUP_R7_3200
;LD R6, BACKUP_R6_3200
;LD R5, BACKUP_R5_3200
;LD R4, BACKUP_R4_3200
;LD R3, BACKUP_R3_3200
;LD R2, BACKUP_R2_3200
;LD R1, BACKUP_R1_3200
;LD R0, BACKUP_R0_3200

;return

RET

;subroutine data

BACKUP_R7_3200 .BLKW #1
;BACKUP_R6_3200 .BLKW #1
;BACKUP_R5_3200 .BLKW #1
;BACKUP_R4_3200 .BLKW #1
;BACKUP_R3_3200 .BLKW #1
;BACKUP_R2_3200 .BLKW #1
;BACKUP_R1_3200 .BLKW #1
;BACKUP_R0_3200 .BLKW #1
NEWLINE .STRINGZ "\n"
;---------------	
;Data
;---------------
introMessagePtr		.FILL x6000
errorMessagePtr		.FILL x6100
;------------
;Remote data
;------------
.ORIG x6000
;---------------
;messages
;---------------
intro .STRINGZ	"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"
;---------------
;error_messages
;---------------
.ORIG x6100	
error_msg1	.STRINGZ	"ERROR INVALID INPUT\n"



.ORIG x3600

;----------------------------------
;subroutine: SUB_MAKE_DEC_3600
;----------------------------------

;subroutine instructions
SUB_MAKE_DEC_3600
ST R7, BACKUP_R7_3600
;ST R6, BACKUP_R6_3600
;ST R5, BACKUP_R5_3600
;ST R4, BACKUP_R4_3600
;ST R3, BACKUP_R3_3600
;ST R2, BACKUP_R2_3600
;ST R1, BACKUP_R1_3600
;ST R0, BACKUP_R0_3600

;*** START SUB_MAKE_DEC_3600 CODE HERE ***
;START_LOOP
LD R3, ARRAY_PTR ;R3 points to x4000
;check flag
ADD R2, R2, #0
BRz POSITIVE_LOOP

ADD R2, R2, #0
BRp NEGATIVE_LOOP

START_LOOP

POSITIVE_LOOP
LD R4, POS_SYM ;loads into R4 '+'
STR R4, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 10k
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_10k ;loads into R4 -10k
ADD R6, R6, R4 ;subtracts 10k from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_10k ;loads into R4 10k
ADD R6, R6, R4 ;adds 10k to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 1k
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_1k ;loads into R4 -1k
ADD R6, R6, R4 ;subtracts 1k from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_1k ;loads into R4 1k
ADD R6, R6, R4 ;adds 1k to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 100
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_100 ;loads into R4 -100
ADD R6, R6, R4 ;subtracts 100 from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_100 ;loads into R4 100
ADD R6, R6, R4 ;adds 100 to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 10
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_10 ;loads into R4 -10
ADD R6, R6, R4 ;subtracts 10 from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_10 ;loads into R4 10
ADD R6, R6, R4 ;adds 10 to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 1
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_1 ;loads into R4 -1
ADD R6, R6, R4 ;subtracts 10 from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_1 ;loads into R4 1
ADD R6, R6, R4 ;adds 1 to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

END_POSITIVE_LOOP
BRnzp END_LOOP


NEGATIVE_LOOP

;Make into positive value
NOT R6, R6
ADD R6, R6, #1

LD R4, NEG_SYM ;loads into R4 '-'
STR R4, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 10k
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
; ***NEW***
LD R4, NEG_10k ;loads into R4 -10k
ADD R6, R6, R4 ;subtracts 10k from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_10k ;loads into R4 10k
ADD R6, R6, R4 ;adds 10k to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 1k
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_1k ;loads into R4 -1k
ADD R6, R6, R4 ;subtracts 1k from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_1k ;loads into R4 1k
ADD R6, R6, R4 ;adds 1k to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 100
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_100 ;loads into R4 -100
ADD R6, R6, R4 ;subtracts 100 from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_100 ;loads into R4 100
ADD R6, R6, R4 ;adds 100 to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 10
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_10 ;loads into R4 -10
ADD R6, R6, R4 ;subtracts 10 from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_10 ;loads into R4 10
ADD R6, R6, R4 ;adds 10 to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

;check for 1
LD R5, VAL_ZERO ;loads the value 0 into R5
ADD R6, R6, #0
LD R4, NEG_1 ;loads into R4 -1
ADD R6, R6, R4 ;subtracts 10 from R6

ADD R6, R6, #0
BRzp #2 ;jump down 2 places

ADD R6, R6, #0
BRn #3 ;jump down 3 places

ADD R6, R6, #0
ADD R5, R5, #1 ;adds 1 to R5
BRzp #-8 ;jump up 8 places

ADD R6, R6, #0
LD R4, POS_1 ;loads into R4 1
ADD R6, R6, R4 ;adds 1 to R6
STR R5, R3, #0
ADD R3, R3, #1 ;moves 1 memory location ahead

END_NEGATIVE_LOOP

END_LOOP

LD R5, VAL_48 ;loads into R5 48
LD R3, ARRAY_PTR
LDR R0, R3, #0
ADD R0, R0, #0 ;adds 0 to R0 value
OUT
ADD R3, R3, #1
LDR R0, R3, #0

ADD R0, R0, #0
BRz #5

ADD R0, R0, #0
BRp #1

ADD R0, R0, #0
ADD R0, R0, R5 ;adds 48 to R0 value
OUT

ADD R0, R0, #0

ADD R3, R3, #1
LDR R0, R3, #0
ADD R0, R0, R5 ;adds 48 to R0 value
OUT
ADD R3, R3, #1
LDR R0, R3, #0
ADD R0, R0, R5 ;adds 48 to R0 value
OUT
ADD R3, R3, #1
LDR R0, R3, #0
ADD R0, R0, R5 ;adds 48 to R0 value
OUT
ADD R3, R3, #1
LDR R0, R3, #0
ADD R0, R0, R5 ;adds 48 to R0 value
OUT

LD R7, BACKUP_R7_3600
;LD R6, BACKUP_R6_3600
;LD R5, BACKUP_R5_3600
;LD R4, BACKUP_R4_3600
;LD R3, BACKUP_R3_3600
;LD R2, BACKUP_R2_3600
;LD R1, BACKUP_R1_3600
;LD R0, BACKUP_R0_3600

;return

RET

ARRAY_PTR .FILL x4000
VAL_48 .FILL #48
VAL_ZERO .FILL #0
POS_SYM .FILL #43
NEG_SYM .FILL #45
NEG_10k .FILL #-10000
POS_10k .FILL #10000
NEG_1k .FILL #-1000
POS_1k .FILL #1000
NEG_100 .FILL #-100
POS_100 .FILL #100
NEG_10 .FILL #-10
POS_10 .FILL #10
NEG_1 .FILL #-1
POS_1 .FILL #1
;subroutine data
BACKUP_R7_3600 .BLKW #1
;BACKUP_R6_3600 .BLKW #1
;BACKUP_R5_3600 .BLKW #1
;BACKUP_R4_3600 .BLKW #1
;BACKUP_R3_3600 .BLKW #1
;BACKUP_R2_3600 .BLKW #1
;BACKUP_R1_3600 .BLKW #1
;BACKUP_R0_3600 .BLKW #1

.ORIG x4000
ARRARY .BLKW #6
.END
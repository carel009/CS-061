;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 9
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
.ORIG x3000

LEA R0, PROMPT
PUTS

AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

LD R4, BASE
LD R5, MAX
LD R6, TOS

GETC
OUT
ADD R0, R0, #-16 ;convert to decimal before push
ADD R0, R0, #-16
ADD R0, R0, #-16
LD R1, SUB_STACK_PUSH_3200_ADDR
JSRR R1

GETC
OUT
ADD R0, R0, #-16 ;convert to decimal before push
ADD R0, R0, #-16
ADD R0, R0, #-16
LD R1, SUB_STACK_PUSH_3200_ADDR
JSRR R1

GETC
OUT

LD R2, SUB_RPN_MULTIPLY_3600_ADDR
JSRR R2

LD R3, SUB_STACK_POP_3400_ADDR
JSRR R3

LD R4, SUB_PRINT_DECIMAL_4000_ADDR
JSRR R4

HALT

PROMPT .STRINGZ "Input two single digit numbers followed by *\n"
BASE .FILL xA000
MAX .FILL xA002
TOS .FILL xA000
SUB_STACK_PUSH_3200_ADDR .FILL x3200
SUB_RPN_MULTIPLY_3600_ADDR .FILL x3600
SUB_STACK_POP_3400_ADDR .FILL x3400
SUB_PRINT_DECIMAL_4000_ADDR .FILL x4000

.ORIG xA001
STACK .BLKW #2


.ORIG x3200
;------------------------------------------------------------------------------------------
; Subroutine: SUB_STACK_PUSH
; Parameter (R0): The value to push onto the stack
; Parameter (R4): BASE: A pointer to the base (​ one less than​​ the lowest available address) of the stack
; Parameter (R5): MAX: The "highest" available address in the stack
; Parameter (R6): TOS (Top of Stack): A pointer to the ​ current ​ top of the stack
; Postcondition: The subroutine has pushed (R0) onto the stack (i.e to address TOS+1).
;If the stack was already full (TOS = MAX), the subroutine has printed an overflow error message and terminated.
; Return Value: R6 ← updated TOS
;------------------------------------------------------------------------------------------

;subroutine instructions
SUB_STACK_PUSH_3200
ST R7, BACKUP_R7_3200
;ST R6, BACKUP_R6_3200
;ST R5, BACKUP_R5_3200
;ST R4, BACKUP_R4_3200
;ST R3, BACKUP_R3_3200
;ST R2, BACKUP_R2_3200
;ST R1, BACKUP_R1_3200
;ST R0, BACKUP_R0_3200

;*** START HERE ***
;initializes all registers to 0
;AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
;AND R4, R4, #0
;AND R5, R5, #0
;AND R6, R6, #0
AND R7, R7, #0

PUSH_LOOP

NOT R5, R5 ;make negative
ADD R5, R5, #1

ADD R1, R6, R5

ADD R1, R1, #0
BRz #2 ;jump to overflow error message

ADD R1, R1, #0
BRn #4 ;jump to restore R5

ADD R1, R1, #0
LEA R0, OVERFLOW_MESSAGE
PUTS
TRAP x25

ADD R1, R1, #0
NOT R5, R5 ;restore origianl value
ADD R5, R5, #1
ADD R6, R6, #1 ;adds 1 to TOS
STR R0, R6, #0 ;stores R0 where R6 points

END_PUSH_LOOP

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

;data
OVERFLOW_MESSAGE .STRINGZ "\nError due to stack overflow\n"


.ORIG x3400
;------------------------------------------------------------------------------------------
; Subroutine: SUB_STACK_POP
; Parameter (R4): BASE: A pointer to the base (​ one less than​​ the lowest available address) of the stack
; Parameter (R5): MAX: The "highest" available address in the stack
; Parameter (R6): TOS (Top of Stack): A pointer to the ​ current ​ top of the stack
; Postcondition: The subroutine has popped MEM[TOS] off of the stack.
;If the stack was already empty (TOS = BASE), the subroutine has printed an underflow error message and terminated.
; Return Value: R0 ← value popped off of the stack
;R6 ← updated TOS
;------------------------------------------------------------------------------------------

;subroutine instructions
SUB_STACK_POP_3400
ST R7, BACKUP_R7_3400
;ST R6, BACKUP_R6_3400
;ST R5, BACKUP_R5_3400
;ST R4, BACKUP_R4_3400
;ST R3, BACKUP_R3_3400
;ST R2, BACKUP_R2_3400
;ST R1, BACKUP_R1_3400
;ST R0, BACKUP_R0_3400

;*** START HERE ***
;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
;AND R2, R2, #0
;AND R3, R3, #0
;AND R4, R4, #0
;AND R5, R5, #0
;AND R6, R6, #0
AND R7, R7, #0

POP_LOOP

NOT R4, R4 ;make negative
ADD R4, R4, #1

ADD R1, R6, R4

ADD R1, R1, #0
BRz #2 ;jump to underflow error message

ADD R1, R1, #0
BRp #4 ;jump to restore R4

ADD R1, R1, #0
LEA R0, UNDERFLOW_MESSAGE
PUTS
TRAP x25

ADD R1, R1, #0
NOT R4, R4 ;restore origianl value
ADD R4, R4, #1
LDR R0, R6, #0 ;loads R0 where R6 points
ADD R6, R6, #-1 ;adds 1 to TOS
ADD R0, R0, #0

END_POP_LOOP

LD R7, BACKUP_R7_3400
;LD R6, BACKUP_R6_3400
;LD R5, BACKUP_R5_3400
;LD R4, BACKUP_R4_3400
;LD R3, BACKUP_R3_3400
;LD R2, BACKUP_R2_3400
;LD R1, BACKUP_R1_3400
;LD R0, BACKUP_R0_3400

;return

RET

;subroutine data
BACKUP_R7_3400 .BLKW #1
;BACKUP_R6_3400 .BLKW #1
;BACKUP_R5_3400 .BLKW #1
;BACKUP_R4_3400 .BLKW #1
;BACKUP_R3_3400 .BLKW #1
;BACKUP_R2_3400 .BLKW #1
;BACKUP_R1_3400 .BLKW #1
;BACKUP_R0_3400 .BLKW #1

;data
UNDERFLOW_MESSAGE .STRINGZ "\nError due to stack underflow\n"


.ORIG x3600
;------------------------------------------------------------------------------------------
; Subroutine: SUB_RPN_MULTIPLY
; Parameter (R4): BASE: A pointer to the base (​ one less than​​ the lowest available address) of the stack
; Parameter (R5): MAX: The "highest" available address in the stack
; Parameter (R6): TOS (Top of Stack): A pointer to the ​ current ​ top of the stack
; Postcondition: The subroutine has popped off the top two values of the stack, multiplied them together, and pushed the resulting value back onto the stack.
; Return Value: R6 ← updated TOS address
;------------------------------------------------------------------------------------------

;subroutine instructions
SUB_RPN_MULTIPLY_3600
ST R7, BACKUP_R7_3600
;ST R6, BACKUP_R6_3600
;ST R5, BACKUP_R5_3600
;ST R4, BACKUP_R4_3600
;ST R3, BACKUP_R3_3600
;ST R2, BACKUP_R2_3600
;ST R1, BACKUP_R1_3600
;ST R0, BACKUP_R0_3600

;*** START HERE ***
;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
;AND R4, R4, #0
;AND R5, R5, #0
;AND R6, R6, #0
AND R7, R7, #0

LDR R2, R6, #0
LD R1, SUB_STACK_POP_3400_ADDR_SC
JSRR R1

LDR R3, R6, #0
LD R1, SUB_STACK_POP_3400_ADDR_SC
JSRR R1

LD R1, SUB_MULTIPLY_3800_ADDR_SC
JSRR R1

AND R0, R0, #0
ADD R0, R0, R1
;*** CALL PUSH ***
LD R3, SUB_STACK_PUSH_3200_ADDR_SC
JSRR R3

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

;subroutine data
BACKUP_R7_3600 .BLKW #1
;BACKUP_R6_3600 .BLKW #1
;BACKUP_R5_3600 .BLKW #1
;BACKUP_R4_3600 .BLKW #1
;BACKUP_R3_3600 .BLKW #1
;BACKUP_R2_3600 .BLKW #1
;BACKUP_R1_3600 .BLKW #1
;BACKUP_R0_3600 .BLKW #1

;data
SUB_STACK_POP_3400_ADDR_SC .FILL x3400
SUB_MULTIPLY_3800_ADDR_SC .FILL x3800
SUB_STACK_PUSH_3200_ADDR_SC .FILL x3200


.ORIG x3800
;------------------------------------------------------------------------------------------
; Subroutine: SUB_MULTIPLY
;------------------------------------------------------------------------------------------

;subroutine instructions
SUB_MULTIPLY_3800
ST R7, BACKUP_R7_3800
;ST R6, BACKUP_R6_3800
;ST R5, BACKUP_R5_3800
;ST R4, BACKUP_R4_3800
;ST R3, BACKUP_R3_3800
;ST R2, BACKUP_R2_3800
;ST R1, BACKUP_R1_3800
;ST R0, BACKUP_R0_3800

;*** START HERE ***
;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
;AND R2, R2, #0
;AND R3, R3, #0
;AND R4, R4, #0
;AND R5, R5, #0
;AND R6, R6, #0
AND R7, R7, #0

LD R1, DEC_0		;R1<-- #0
ADD R2, R2, #0
ADD R3, R3, #0

DO_WHILE_LOOP
    ADD R1, R1, R2	;R1<-- R1 + R2
    ADD R3, R3, #-1	;R3<-- R3 - #1
    BRp DO_WHILE_LOOP	;if (R3 > 0):goto DO_WHILE_LOOP
  END_DO_WHILE_LOOP

LD R7, BACKUP_R7_3800
;LD R6, BACKUP_R6_3800
;LD R5, BACKUP_R5_3800
;LD R4, BACKUP_R4_3800
;LD R3, BACKUP_R3_3800
;LD R2, BACKUP_R2_3800
;LD R1, BACKUP_R1_3800
;LD R0, BACKUP_R0_3800

;return

RET

;subroutine data
BACKUP_R7_3800 .BLKW #1
;BACKUP_R6_3800 .BLKW #1
;BACKUP_R5_3800 .BLKW #1
;BACKUP_R4_3800 .BLKW #1
;BACKUP_R3_3800 .BLKW #1
;BACKUP_R2_3800 .BLKW #1
;BACKUP_R1_3800 .BLKW #1
;BACKUP_R0_3800 .BLKW #1

;data
DEC_0    .FILL #0	;put #0 into memory here


.ORIG x4000
;------------------------------------------------------------------------------------------
; Subroutine: SUB_PRINT_DECIMAL
;------------------------------------------------------------------------------------------

;subroutine instructions
SUB_PRINT_DECIMAL_4000
ST R7, BACKUP_R7_4000
;ST R6, BACKUP_R6_4000
;ST R5, BACKUP_R5_4000
;ST R4, BACKUP_R4_4000
;ST R3, BACKUP_R3_4000
;ST R2, BACKUP_R2_4000
;ST R1, BACKUP_R1_4000
;ST R0, BACKUP_R0_4000

;*** START HERE ***
;initializes all registers to 0
;AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

ADD R6, R6, R0 ;adds R0 into R6

LD R3, ARRAY_PTR ;R3 points to x5000
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

LEA R0, NEWLINE
PUTS

LD R5, VAL_48 ;loads into R5 48
LD R3, ARRAY_PTR
LDR R0, R3, #0
ADD R0, R0, #0 ;adds 0 to R0 value
;OUT

ADD R3, R3, #1
ADD R0, R0, #0
ADD R0, R0, R5 ;adds 48 to R0 value
;OUT

ADD R3, R3, #1
LDR R0, R3, #0
ADD R0, R0, R5 ;adds 48 to R0 value
;OUT

ADD R3, R3, #1
LDR R0, R3, #0
ADD R0, R0, R5 ;adds 48 to R0 value
;OUT

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

LD R7, BACKUP_R7_4000
;LD R6, BACKUP_R6_4000
;LD R5, BACKUP_R5_4000
;LD R4, BACKUP_R4_4000
;LD R3, BACKUP_R3_4000
;LD R2, BACKUP_R2_4000
;LD R1, BACKUP_R1_4000
;LD R0, BACKUP_R0_4000

;return

RET

ARRAY_PTR .FILL x5000
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
NEWLINE .STRINGZ "\n"
;subroutine data
BACKUP_R7_4000 .BLKW #1
;BACKUP_R6_4000 .BLKW #1
;BACKUP_R5_4000 .BLKW #1
;BACKUP_R4_4000 .BLKW #1
;BACKUP_R3_4000 .BLKW #1
;BACKUP_R2_4000 .BLKW #1
;BACKUP_R1_4000 .BLKW #1
;BACKUP_R0_4000 .BLKW #1

;data

.ORIG x5000
ARRARY .BLKW #6

.END
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

ADD R6, R6, #5 ;moves TOS to MAX

FILLED_LOOP

LD R1, SUB_STACK_POP_3400_ADDR
JSRR R1

BRnzp FILLED_LOOP
END_FILLED_LOOP

HALT

BASE .FILL xA000
MAX .FILL xA005
TOS .FILL xA000
SUB_STACK_POP_3400_ADDR .FILL x3400

;already filled stack
.ORIG xA001
.FILL #49
.FILL #50
.FILL #51
.FILL #52
.FILL #53

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
AND R2, R2, #0
AND R3, R3, #0
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

.END
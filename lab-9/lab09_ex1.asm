;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 9
; Lab section: 025
; TA: Kevin Tang
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

FILL_LOOP

GETC
OUT

LD R1, SUB_STACK_PUSH_3200_ADDR
JSRR R1

BRnzp FILL_LOOP
END_FILL_LOOP

HALT

PROMPT .STRINGZ "Fill the stack until overflow\n"
BASE .FILL xA000
MAX .FILL xA005
TOS .FILL xA000
SUB_STACK_PUSH_3200_ADDR .FILL x3200

.ORIG xA001
STACK .BLKW #5

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

.END
;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 8
; Lab section: 025
; TA: Kevin Tang
;=================================================
.ORIG x3000

;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

LD R1, ARRAY_PTR

LD R2, SUB_GET_STRING_3200_ADDR
JSRR R2

LD R1, ARRAY_PTR
ADD R0, R0, R1
PUTS

HALT

ARRAY_PTR .FILL x4000
SUB_GET_STRING_3200_ADDR .FILL x3200

.ORIG x3200
;----------------------------------------------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING
; Parameter (R1): The starting address of the character array
; Postcondition: The subroutine has prompted the user to input a string,
; terminated by the [ENTER] key (the "sentinel"), and has stored it in an array
; of characters starting at (R1); the array is NULL-terminated.
; Return Value (R5): The number of non-sentinel characters read from the user.
; R1 still contains the starting address of the array.
;-----------------------------------------------------------------------------------------------------------------

;subroutine instructions
SUB_GET_STRING_3200
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
AND R0, R0, #0
;AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

LEA R0, PROMPT_USER
PUTS

INPUT_LOOP
GETC
OUT

ADD R0, R0, #-10 ;check if enter

ADD R0, R0, #0
BRz #2 ;jump to store 0

ADD R0, R0, #0
BRnp #3 ;jump to store input

ADD R0, R0, #0
STR R0, R1, #0 ;stores 0 where R1 is pointing
BRnzp END_INPUT_LOOP

ADD R0, R0, #0
ADD R5, R5, #1 ;counts non sentinel (non enter) characters
ADD R0, R0, #10
STR R0, R1, #0 ;stores input where R1 is pointing
ADD R1, R1, #1 ;moves 1 location ahead
BRnzp INPUT_LOOP

END_INPUT_LOOP

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
PROMPT_USER .STRINGZ "Please input a string then press enter\n"
.ORIG x4000
ARRAY .BLKW #100

.END
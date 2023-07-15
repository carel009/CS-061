;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu
; GitHub username: CaliDobie 
; 
; Lab: lab 8
; Lab section: 025
; TA: Kevin Tang
; 
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

PALIN_LOOP

LD R3, SUB_IS_A_PALINDROME_3400_ADDR
JSRR R3

ADD R4, R4, #0
BRz #2 ;not a palindrome

ADD R4, R4, #0
BRp #4 ;is a palindrome

ADD R4, R4, #0
LEA R0, NOT_PALIN
PUTS
BRnzp END_PALIN_LOOP

ADD R4, R4, #0
LEA R0, PALIN
PUTS

END_PALIN_LOOP

HALT

NOT_PALIN .STRINGZ "\nThe string is not a palindrome\n"
PALIN .STRINGZ "\nThe string is a palindrome\n"
ARRAY_PTR .FILL x4000
SUB_GET_STRING_3200_ADDR .FILL x3200
SUB_IS_A_PALINDROME_3400_ADDR .FILL x3400

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



.ORIG x3400
;------------------------------------------------------------------------------------------------------------------
; Subroutine: SUB_IS_A_PALINDROME
; Parameter (R1): The starting address of a null-terminated string
; Parameter (R5): The number of characters in the array.
; Postcondition: The subroutine has determined whether the string at (R1) is
; a palindrome or not, and returned a flag to that effect.
; Return Value: R4 {1 if the string is a palindrome, 0 otherwise}
;------------------------------------------------------------------------------------------------------------------

;subroutine instructions
SUB_IS_A_PALINDROME_3400
ST R7, BACKUP_R7_3400
;ST R6, BACKUP_R6_3400
;ST R5, BACKUP_R5_3400
;ST R4, BACKUP_R4_3400
;ST R3, BACKUP_R3_3400
;ST R2, BACKUP_R2_3400
;ST R1, BACKUP_R1_3400
;ST R0, BACKUP_R0_3400

;*** START HERE ***
;initializes all registers, except R1 and R5, to 0

LD R6, SUB_TO_UPPER_3600_ADDR
JSRR R6

AND R0, R0, #0
;AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
;AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

ADD R0, R0, R1 ;adds R1 into R0
ADD R0, R0, R5 ;adds R0 and R5 into R0
ADD R0, R0, #-1 ;subtracts 1 from R0 to adjust value

PALINDROME_LOOP

;beginning value of array in R2
LDR R2, R1, #0 ;loads the content of where R1 points

;ending value of array in R3
LDR R3, R0, #0 ;loads the content of where R0 points

;2's complement of R3
NOT R3, R3
ADD R3, R3, #1

ADD R2, R2, R3 ;adds R2 and R3 into R2

ADD R2, R2, #0
BRz #2 ;jump to check

ADD R2, R2, #0
BRnp END_PALINDROME_LOOP ;jump to end

;check
ADD R1, R1, #1
ADD R0, R0, #-1

NOT R0, R0
ADD R0, R0, #1

ADD R1, R1, R0

ADD R1, R1, #0
BRz #2

ADD R1, R1, #0
BRn #3

ADD R1, R1, #0
ADD R4, R4, #1
BRnzp END_PALINDROME_LOOP

ADD R1, R1, #0
ADD R1, R1, #1

ADD R1, R1, #0
BRz #2

ADD R1, R1, #0
BRn #3

ADD R1, R1, #0
ADD R4, R4, #1
BRnzp END_PALINDROME_LOOP

ADD R1, R1, #0
ADD R1, R1, #-1

NOT R0, R0
ADD R0, R0, #1
ADD R1, R1, R0
;ADD R1, R1, #0
;ADD R0, R0, #0
BRnzp PALINDROME_LOOP

END_PALINDROME_LOOP

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
SUB_TO_UPPER_3600_ADDR .FILL x3600

.ORIG x3600
;------------------------------------------------------------------------------------------------------------------
; Subroutine: SUB_TO_UPPER
; Parameter (R1): Starting address of a null-terminated string
; Postcondition: The subroutine has converted the string to upper-case in-place
; i.e. the upper-case string has replaced the original string
; No return value, no output.
;------------------------------------------------------------------------------------------------------------------

;subroutine instructions
SUB_TO_UPPER_3600
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
;AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
;AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

ADD R6, R6, R1

TO_UPPER_LOOP

LDR R0, R6, #0 ;loads the value that R6 is pointing to into R0

ADD R0, R0, #0
BRz END_TO_UPPER_LOOP

ADD R0, R0, #0
BRp #1

ADD R0, R0, #0
LD R2, MASK
AND R0, R0, R2
STR R0, R6, #0
ADD R6, R6, #1
BRnzp TO_UPPER_LOOP

END_TO_UPPER_LOOP

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
MASK .FILL xDF
.END
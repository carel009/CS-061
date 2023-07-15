;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 7
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

LEA R0, INTRO_MESSAGE
PUTS

GETC
OUT

ADD R6, R6, R0 ;loads R0 into R6
ADD R1, R1, R0 ;loads R0 into R1   ***parameter for subroutine***

LD R3, SUB_COUNT_1s_3200_ADDR
JSRR R3

LEA R0, OUTRO_MESSAGE1
PUTS

AND R0, R0, #0
ADD R0, R0, R6
OUT

LEA R0, OUTRO_MESSAGE2
PUTS

AND R0, R0, #0
ADD R0, R0, R2
OUT

HALT

SUB_COUNT_1s_3200_ADDR .FILL x3200
INTRO_MESSAGE .STRINGZ "Please Enter A Single Character\n"
OUTRO_MESSAGE1 .STRINGZ "\nThen Number Of 1's In The Character "
OUTRO_MESSAGE2 .STRINGZ " Are "

.ORIG x3200

;----------------------------------
;subroutine: SUB_COUNT_1s_3200
;----------------------------------

;subroutine instructions
SUB_COUNT_1s_3200
ST R7, BACKUP_R7_3200
;ST R6, BACKUP_R6_3200
;ST R5, BACKUP_R5_3200
;ST R4, BACKUP_R4_3200
;ST R3, BACKUP_R3_3200
;ST R2, BACKUP_R2_3200
;ST R1, BACKUP_R1_3200
;ST R0, BACKUP_R0_3200

AND R3, R3, #0
ADD R3, R3, #15
ADD R3, R3, #1

START_LOOP
ADD R1, R1, #0
BRn #2 ;checks if LMB is 1

ADD R1, R1, #0
BRzp #2 ;checks if LMB is 0

ADD R1, R1, #0 ;if LMB is 1
ADD R2, R2, #1
ADD R1, R1, #0 ;if LMB is 0
ADD R1, R1, R1 ;left shift

ADD R3, R3, #-1
ADD R3, R3, #0
BRp START_LOOP
END_START_LOOP

ADD R2, R2, #15 ;adds 48 to R2
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #3

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

.END
;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu
; GitHub username: CaliDobie
; 
; Assignment name: Assignment 4
; Lab section: 025
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R6
;=================================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
;Example of how to Output Intro Message
;LD R0, introMessagePtr  ; Get pointer to Intro Message
;PUTS

;Example of how to Output Error Message
;LD R0, errorMessagePtr  ; Get pointer to Error Message
;PUTS

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

HALT

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

;---------------
;END of PROGRAM
;---------------
.END
;-------------------
;PURPOSE of PROGRAM
;-------------------

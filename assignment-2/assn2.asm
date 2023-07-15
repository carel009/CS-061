;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu
; GitHub username: CaliDobie
; 
; Assignment name: Assignment 2
; Lab section: 025
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE BELOW
;--------------------------------
GETC ;gets 1st number input
OUT
ADD R1, R0, #0 ;stores 1st number in R1
LD R0, NEWLINE
OUT

GETC ;gets 2nd number input
OUT
ADD R2, R0, #0 ;stores 2nd number in R2
LD R0, NEWLINE
OUT

ADD R0, R1, #0
OUT ;outputs 1st number input
LEA R0, Char1 ;outputs ' - '
PUTS
ADD R0, R2, #0
OUT ;outputs 2nd number input
LEA R0, Char2 ;outputs ' = '
PUTS

ADD R1, R1, #-15 ;converts 1st number to decimal
ADD R1, R1, #-15
ADD R1, R1, #-15
ADD R1, R1, #-3

ADD R2, R2, #-15 ;converts 2nd number to decimal
ADD R2, R2, #-15
ADD R2, R2, #-15
ADD R2, R2, #-3

NOT R2, R2 ;2's complement of 2nd number
ADD R2, R2, #1

ADD R3, R1, R2 ;sum of the two registers

BRzp #4
ADD R3, R3, #-1 ; prepares negative value for correct conversion
NOT R3, R3
LEA R0, Char3 ;outputs '-'
PUTS


ADD R3, R3, #15 ;converts sum back to character
ADD R3, R3, #15
ADD R3, R3, #15
ADD R3, R3, #3

ADD R0, R3, #0
OUT ;outputs converted result
LD R0, NEWLINE
OUT

HALT				; Stop execution of program

Char1 .STRINGZ " - " ;sets Char1 to ' - '
Char2 .STRINGZ " = " ;sets Char2 to ' = '
Char3 .STRINGZ "-"
;------	
;Data
;------
; String to explain what to input 
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with PUTS. Note: already includes terminating newline!
NEWLINE .FILL '\n'	; newline character - use with OUT
;---------------	
;END of PROGRAM
;---------------	
.END


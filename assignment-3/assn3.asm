;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu
; GitHub username: CaliDobie
; 
; Assignment name: Assignment 3
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
LD R6, Value_addr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------

LD R2, DEC_4 ;loads DEC_4's value into R2

FOUR_LOOP ;loop of first 4 bits

ADD R1, R1, #0 ;adds 0 into R1 value
BRn #1 ;if R1 is negative
ADD R1, R1, #0
LEA R0, ONE
ADD R1, R1, #0
BRn #4

ADD R1, R1, #0
BRp #1 ;if R1 is positive
ADD R1, R1, #0
LEA R0, ZERO

PUTS
ADD R1, R1, R1 ;shifts MSB left
ADD R2, R2, #-1 ;subtracts 1 from R2's value
BRnp FOUR_LOOP
END_FOUR_LOOP

LEA R0, SPACE
PUTS
LD R2, DEC_4 ;loads DEC_4's value into R2

EIGHT_LOOP ;loop of first 4 bits

ADD R1, R1, #0 ;adds 0 into R1 value
BRn #1 ;if R1 is negative
ADD R1, R1, #0
LEA R0, ONE
ADD R1, R1, #0
BRn #4

ADD R1, R1, #0
BRp #1 ;if R1 is positive
ADD R1, R1, #0
LEA R0, ZERO

PUTS
ADD R1, R1, R1 ;shifts MSB left
ADD R2, R2, #-1 ;subtracts 1 from R2's value
BRnp EIGHT_LOOP
END_EIGHT_LOOP

LEA R0, SPACE
PUTS
LD R2, DEC_4 ;loads DEC_4's value into R2

TWELVE_LOOP ;loop of first 4 bits

ADD R1, R1, #0 ;adds 0 into R1 value
BRn #1 ;if R1 is negative
ADD R1, R1, #0
LEA R0, ONE
ADD R1, R1, #0
BRn #4

ADD R1, R1, #0
BRp #1 ;if R1 is positive
ADD R1, R1, #0
LEA R0, ZERO

PUTS
ADD R1, R1, R1 ;shifts MSB left
ADD R2, R2, #-1 ;subtracts 1 from R2's value
BRnp TWELVE_LOOP
END_TWELVE_LOOP

LEA R0, SPACE
PUTS
LD R2, DEC_4 ;loads DEC_4's value into R2

SIXTEEN_LOOP ;loop of first 4 bits

ADD R1, R1, #0 ;adds 0 into R1 value
BRn #1 ;if R1 is negative
ADD R1, R1, #0
LEA R0, ONE
ADD R1, R1, #0
BRn #4

ADD R1, R1, #0
BRp #1 ;if R1 is positive
ADD R1, R1, #0
LEA R0, ZERO

PUTS
ADD R1, R1, R1 ;shifts MSB left
ADD R2, R2, #-1 ;subtracts 1 from R2's value
BRnp SIXTEEN_LOOP
END_SIXTEEN_LOOP

LEA R0, NEWLINE
PUTS

HALT

DEC_4 .FILL #4
ZERO .STRINGZ "0"
ONE .STRINGZ "1"
SPACE .STRINGZ " "
NEWLINE .STRINGZ "\n"

;---------------	
;Data
;---------------
Value_addr	.FILL xDA00	; The address where value to be displayed is stored


.ORIG xDA00					; Remote data
Value .FILL xABCD			; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END

;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 4
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
.orig x3000

LD R1, DEC_10

LEA R2, ARRAY_1

DO_WHILE_LOOP

GETC
OUT

STR R0, R2, #0
ADD R2, R2, #1
ADD R1, R1, #-1
BRp DO_WHILE_LOOP

END_DO_WHILE_LOOP

LD R1, DEC_10
LD R0, NEWLINE
OUT
LEA R2, ARRAY_1

DO_output_LOOP
LDR R0, R2, #0
OUT
LD R0, NEWLINE
OUT
ADD R2, R2, #1
ADD R1, R1, #-1
BRp DO_output_LOOP

END_DO_output_LOOP

HALT

ARRAY_1 .BLKW #10
DEC_10 .FILL #10
NEWLINE .FILL x0A

.end
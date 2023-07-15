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

LD R2, ARRAY_1

DO_WHILE_LOOP

GETC
OUT

STR R0, R2, #0
ADD R2, R2, #1
ADD R0, R0, #-10
BRnp DO_WHILE_LOOP

END_DO_WHILE_LOOP

LD R0, NEWLINE
OUT
LEA R2, ARRAY_1

DO_output_LOOP
LDR R0, R2, #0
OUT
ADD R2, R2, #1
BRnp DO_output_LOOP

END_DO_output_LOOP

HALT

ARRAY_1 .FILL x4000
NEWLINE .FILL x0A

.end
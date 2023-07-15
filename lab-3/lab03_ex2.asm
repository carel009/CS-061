;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu 
; GitHub username: CaliDobie
; 
; Lab: lab 3
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
.orig x3000

LDI R3, DEC_65_PTR
LDI R4, HEX_41_PTR

ADD R3, R3, #1
ADD R4, R4, #1

STI R3, DEC_65_PTR
STI R4, HEX_41_PTR

HALT

DEC_65_PTR .FILL x4000
HEX_41_PTR .FILL x4001

; Remote data
.orig x4000
x4000 .FILL #65
x4001 .FILL x41

.end
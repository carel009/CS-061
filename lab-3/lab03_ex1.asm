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

LD R3, DEC_65
LD R4, HEX_41

HALT

DEC_65 .FILL #65
HEX_41 .FILL x41

.end
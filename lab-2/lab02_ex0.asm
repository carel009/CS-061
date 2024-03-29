;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu
; GitHub username: CaliDobie
; 
; Lab: lab 2
; Lab section: 025
; TA: Kevin Tang
; 
;=================================================
;
;Hello world example program
;Also illustrates how to use PUTS (aka:Trap x22)
;
.ORIG x3000
;-------------
;Instructions
;-------------
    LEA R0, MSG_TO_PRINT   ;R0<-- the location of the label: MSG_TO_PRINT
    PUTS		    ;Prints string defined at MSG_TO_PRINT
    
    HALT
;-------------
;Local data
;-------------
    MSG_TO_PRINT    .STRINGZ     "Hello world!!!\n"    ;store 'H' in an adress labelled
						       ;MSG_TO_PRINT and then each
						       ;character ('e','l','l','o','w',...) in
						       ;it's own (consecutive) memory
						       ;address, followed by #0 at the end
						       ;of the string to mark the end of the
						       ;string
.END
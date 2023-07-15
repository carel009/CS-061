;=================================================
; Name: Christopher Arellano
; Email: carel009@ucr.edu
; GitHub username: CaliDobie
; 
; Assignment name: Assignment 5
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
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------

START_LOOP

; *** START CODE HERE ***
;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

;menu
LD R1, SUB_MENU_3200_ADDR
JSRR R1

;*** A FIX ***
LEA R0, NEWLINE_1
PUTS

;check choice
ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_1_LOOP ;jump to option 1 ***

ADD R1, R1, #0
BRp #1 ;jump to next check

ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_2_LOOP ;jump to option 2 ***

ADD R1, R1, #0
BRp #1 ;jump to next check

ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_3_LOOP ;jump to option 3 ***

ADD R1, R1, #0
BRp #1 ;jump to next check

ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_4_LOOP ;jump to option 4 ***

ADD R1, R1, #0
BRp #1 ;jump to next check

ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_5_LOOP ;jump to option 5 ***

ADD R1, R1, #0
BRp #1 ;jump to next check

ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_6_LOOP ;jump to option 6 ***

ADD R1, R1, #0
BRp #1 ;jump to next check

ADD R1, R1, #0
ADD R1, R1, #-1

ADD R1, R1, #0
BRz OPTION_7_LOOP ;jump to option 7 ***



OPTION_1_LOOP
LD R2, SUB_ALL_MACHINES_BUSY_3400_ADDR
JSRR R2

ADD R2, R2, #0
BRz #2 ;jump to ALLNOTBUSY

ADD R2, R2, #0
BRp #4 ;jump to ALLBUSY

ADD R2, R2, #0
LEA R0, ALLNOTBUSY
PUTS
BRnzp END_OPTION_1_LOOP

ADD R2, R2, #0
LEA R0, ALLBUSY
PUTS

END_OPTION_1_LOOP
BRnzp START_LOOP


OPTION_2_LOOP

LD R2, SUB_ALL_MACHINES_FREE_3600_ADDR
JSRR R2

ADD R2, R2, #0
BRz #2 ;jump to NOTFREE

ADD R2, R2, #0
BRp #4 ;jump to FREE

ADD R2, R2, #0
LEA R0, NOTFREE
PUTS
BRnzp END_OPTION_2_LOOP

ADD R2, R2, #0
LEA R0, FREE
PUTS

END_OPTION_2_LOOP
BRnzp START_LOOP


OPTION_3_LOOP

LD R2, SUB_NUM_BUSY_MACHINES_3800_ADDR
JSRR R2

ADD R2, R2, #0

LEA R0, BUSYMACHINE1
PUTS

LD R3, SUB_PRINT_NUM_R2_5200_ADDR
JSRR R3

LEA R0, BUSYMACHINE2
PUTS

END_OPTION_3_LOOP
BRnzp START_LOOP


OPTION_4_LOOP

LD R2, SUB_NUM_FREE_MACHINES_4000_ADDR
JSRR R2

ADD R2, R2, #0

LEA R0, FREEMACHINE1
PUTS

LD R3, SUB_PRINT_NUM_R2_5200_ADDR
JSRR R3

LEA R0, FREEMACHINE2
PUTS

END_OPTION_4_LOOP
BRnzp START_LOOP


OPTION_5_LOOP

LD R1, SUB_GET_INPUT_4600_ADDR
JSRR R1

ADD R1, R1, #0

LD R2, SUB_MACHINE_STATUS_4200_ADDR
JSRR R2

ADD R2, R2, #0
BRz #2 ;jump to busy

ADD R2, R2, #0
BRp #8 ;jump to free

;busy
ADD R2, R2, #0
LEA R0, STATUS1
PUTS
LD R3, SUB_PRINT_NUM_R1_5000_ADDR
JSRR R3
LEA R0, STATUS2
PUTS
BRnzp END_OPTION_5_LOOP

;free
ADD R2, R2, #0
LEA R0, STATUS1
PUTS
LD R3, SUB_PRINT_NUM_R1_5000_ADDR
JSRR R3
LEA R0, STATUS3
PUTS

END_OPTION_5_LOOP
BRnzp START_LOOP


OPTION_6_LOOP

LD R2, SUB_FIRST_FREE_4400_ADDR
JSRR R2

ADD R2, R2, #0

ADD R2, R2, #0
BRn #2 ;jump to FIRSTFREE2

ADD R2, R2, #0
BRzp #4 ;jump to FIRSTFREE1

ADD R2, R2, #0
LEA R0, FIRSTFREE2
PUTS
BRnzp END_OPTION_6_LOOP

ADD R2, R2, #0
LEA R0, FIRSTFREE1
PUTS
LD R3, SUB_PRINT_NUM_R2_5200_ADDR
JSRR R3
LEA R0, NEWLINE_1
PUTS

END_OPTION_6_LOOP
BRnzp START_LOOP


OPTION_7_LOOP

LEA R0, Goodbye
PUTS

END_OPTION_7_LOOP
BRnzp END_START_LOOP


END_START_LOOP

HALT
;---------------	
;Data
;---------------
;Add address for subroutines
SUB_MENU_3200_ADDR .FILL x3200
SUB_ALL_MACHINES_BUSY_3400_ADDR .FILL x3400
SUB_ALL_MACHINES_FREE_3600_ADDR .FILL x3600
SUB_NUM_BUSY_MACHINES_3800_ADDR .FILL x3800
SUB_NUM_FREE_MACHINES_4000_ADDR .FILL x4000
SUB_MACHINE_STATUS_4200_ADDR .FILL x4200
SUB_FIRST_FREE_4400_ADDR .FILL x4400
SUB_GET_INPUT_4600_ADDR .FILL x4600
SUB_PRINT_NUM_R1_5000_ADDR .FILL x5000
SUB_PRINT_NUM_R2_5200_ADDR .FILL x5200

;Other data 

;Strings for options
FIRSTFREE2      .STRINGZ "No machines are free\n"
NEWLINE_1       .STRINGZ "\n"
Goodbye         .STRINGZ "Goodbye!\n"
ALLNOTBUSY      .STRINGZ "Not all machines are busy\n"
ALLBUSY         .STRINGZ "All machines are busy\n"
FREE            .STRINGZ "All machines are free\n"
NOTFREE		.STRINGZ "Not all machines are free\n"
BUSYMACHINE1    .STRINGZ "There are "
BUSYMACHINE2    .STRINGZ " busy machines\n"
FREEMACHINE1    .STRINGZ "There are "
FREEMACHINE2    .STRINGZ " free machines\n"
STATUS1         .STRINGZ "Machine "
STATUS2		.STRINGZ " is busy\n"
STATUS3		.STRINGZ " is free\n"
FIRSTFREE1      .STRINGZ "The first available machine is number "
;FIRSTFREE2      .STRINGZ "No machines are free\n"
;NEWLINE_1       .STRINGZ "\n"



.ORIG x3200
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MENU
; Inputs: None
; Postcondition: The subroutine has printed out a menu with numerical options, allowed the
;                          user to select an option, and returned the selected option.
; Return Value (R1): The option selected:  #1, #2, #3, #4, #5, #6 or #7
; no other return value is possible
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MENU
;--------------------------------

SUB_MENU_3200
;HINT back up
ST R7, BACKUP_R7_3200
;ST R6, BACKUP_R6_3200
;ST R5, BACKUP_R5_3200
;ST R4, BACKUP_R4_3200
;ST R3, BACKUP_R3_3200
;ST R2, BACKUP_R2_3200
;ST R1, BACKUP_R1_3200
;ST R0, BACKUP_R0_3200

; *** START CODE HERE ***

MENU_LOOP
;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

LD R0, Menu_string_addr ;loads menu into R0
PUTS

GETC ;gets input
OUT

LD R2, NEG_48 ;loads #-48 into R2
ADD R0, R0, R2 ;subtracts 48 from input

;check input
ADD R0, R0, #-1

ADD R0, R0, #0
BRn #4 ;jump to incorrect input

ADD R0, R0, #0
BRz #6 ;jump to option 1

ADD R0, R0, #0
BRp #7 ;jump to next check

;incorrect input
ADD R0, R0, #0
LEA R0, Error_msg_1
PUTS
BRnzp MENU_LOOP

;option 1
ADD R0, R0, #0
ADD R1, R1, #1
BRnzp END_MENU_LOOP

;check input
ADD R0, R0, #0
ADD R0, R0, #-1

ADD R0, R0, #0
BRz #2 ;jump to option 2

ADD R0, R0, #0
BRp #3 ;jump to next check

;option 2
ADD R0, R0, #0
ADD R1, R1, #2
BRnzp END_MENU_LOOP

;check input
ADD R0, R0, #0
ADD R0, R0, #-1

ADD R0, R0, #0
BRz #2 ;jump to option 3

ADD R0, R0, #0
BRp #3 ;jump to next check

;option 3
ADD R0, R0, #0
ADD R1, R1, #3
BRnzp END_MENU_LOOP

;check input
ADD R0, R0, #0
ADD R0, R0, #-1

ADD R0, R0, #0
BRz #2 ;jump to option 4

ADD R0, R0, #0
BRp #3 ;jump to next check

;option 4
ADD R0, R0, #0
ADD R1, R1, #4
BRnzp END_MENU_LOOP

;check input
ADD R0, R0, #0
ADD R0, R0, #-1

ADD R0, R0, #0
BRz #2 ;jump to option 5

ADD R0, R0, #0
BRp #3 ;jump to next check

;option 5
ADD R0, R0, #0
ADD R1, R1, #5
BRnzp END_MENU_LOOP

;check input
ADD R0, R0, #0
ADD R0, R0, #-1

ADD R0, R0, #0
BRz #2 ;jump to option 6

ADD R0, R0, #0
BRp #3 ;jump to next check

;option 6
ADD R0, R0, #0
ADD R1, R1, #6
BRnzp END_MENU_LOOP

;check input
ADD R0, R0, #0
ADD R0, R0, #-1

ADD R0, R0, #0
BRz #2 ;jump to option 7

ADD R0, R0, #0
BRp #3 ;jump to incorrect input

;option 7
ADD R0, R0, #0
ADD R1, R1, #7
BRnzp END_MENU_LOOP

ADD R0, R0, #0
LEA R0, Error_msg_1
PUTS
BRnzp MENU_LOOP

END_MENU_LOOP

;HINT Restore
LD R7, BACKUP_R7_3200
;LD R6, BACKUP_R6_3200
;LD R5, BACKUP_R5_3200
;LD R4, BACKUP_R4_3200
;LD R3, BACKUP_R3_3200
;LD R2, BACKUP_R2_3200
;LD R1, BACKUP_R1_3200
;LD R0, BACKUP_R0_3200

RET

BACKUP_R7_3200 .BLKW #1
;BACKUP_R6_3200 .BLKW #1
;BACKUP_R5_3200 .BLKW #1
;BACKUP_R4_3200 .BLKW #1
;BACKUP_R3_3200 .BLKW #1
;BACKUP_R2_3200 .BLKW #1
;BACKUP_R1_3200 .BLKW #1
;BACKUP_R0_3200 .BLKW #1

;--------------------------------
;Data for subroutine MENU
;--------------------------------
Error_msg_1	      .STRINGZ "\nINVALID INPUT\n"
Menu_string_addr  .FILL x6000

NEG_48 .FILL #-48



.ORIG x3400
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_BUSY
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are busy
; Return value (R2): 1 if all machines are busy,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_BUSY
;--------------------------------

SUB_ALL_MACHINES_BUSY_3400
;HINT back up
ST R7, BACKUP_R7_3400
;ST R6, BACKUP_R6_3400
;ST R5, BACKUP_R5_3400
;ST R4, BACKUP_R4_3400
;ST R3, BACKUP_R3_3400
;ST R2, BACKUP_R2_3400
;ST R1, BACKUP_R1_3400
;ST R0, BACKUP_R0_3400

; *** START CODE HERE ***

;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
; *** NOTE: all busy = x0000 ***
LD R1, BUSYNESS_ADDR_ALL_MACHINES_BUSY ;loads memory location xCD00 into R1
LDR R0, R1, #0 ;loads the value that R1 points to into R0

ADD R0, R0, #0
BRz #2 ;jumps to set R2 = 1

ADD R0, R0, #0
BRnp #2 ;jumps to set R2 = 0

ADD R0, R0, #0
ADD R2, R2, #1

ADD R0, R0, #0
ADD R2, R2, #0

;HINT Restore
LD R7, BACKUP_R7_3400
;LD R6, BACKUP_R6_3400
;LD R5, BACKUP_R5_3400
;LD R4, BACKUP_R4_3400
;LD R3, BACKUP_R3_3400
;LD R2, BACKUP_R2_3400
;LD R1, BACKUP_R1_3400
;LD R0, BACKUP_R0_3400

RET

BACKUP_R7_3400 .BLKW #1
;BACKUP_R6_3400 .BLKW #1
;BACKUP_R5_3400 .BLKW #1
;BACKUP_R4_3400 .BLKW #1
;BACKUP_R3_3400 .BLKW #1
;BACKUP_R2_3400 .BLKW #1
;BACKUP_R1_3400 .BLKW #1
;BACKUP_R0_3400 .BLKW #1

;--------------------------------
;Data for subroutine ALL_MACHINES_BUSY
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_BUSY .Fill xCD00



.ORIG x3600
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_FREE
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are free
; Return value (R2): 1 if all machines are free,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_FREE
;--------------------------------

SUB_ALL_MACHINES_FREE_3600
;HINT back up
ST R7, BACKUP_R7_3600
;ST R6, BACKUP_R6_3600
;ST R5, BACKUP_R5_3600
;ST R4, BACKUP_R4_3600
;ST R3, BACKUP_R3_3600
;ST R2, BACKUP_R2_3600
;ST R1, BACKUP_R1_3600
;ST R0, BACKUP_R0_3600

; *** START CODE HERE ***

;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
; *** NOTE: all free = xFFFF ***
LD R1, BUSYNESS_ADDR_ALL_MACHINES_FREE ;loads memory location xCD00 into R1
LDR R0, R1, #0 ;loads the value that R1 points to into R0

ADD R0, R0, #1 ;adds 1 to R0

ADD R0, R0, #0
BRz #2 ;jumps to set R2 = 1

ADD R0, R0, #0
BRnp #2 ;jumps to set R2 = 0

ADD R0, R0, #0
ADD R2, R2, #1

ADD R0, R0, #0
ADD R2, R2, #0

;HINT Restore
LD R7, BACKUP_R7_3600
;LD R6, BACKUP_R6_3600
;LD R5, BACKUP_R5_3600
;LD R4, BACKUP_R4_3600
;LD R3, BACKUP_R3_3600
;LD R2, BACKUP_R2_3600
;LD R1, BACKUP_R1_3600
;LD R0, BACKUP_R0_3600

RET

BACKUP_R7_3600 .BLKW #1
;BACKUP_R6_3600 .BLKW #1
;BACKUP_R5_3600 .BLKW #1
;BACKUP_R4_3600 .BLKW #1
;BACKUP_R3_3600 .BLKW #1
;BACKUP_R2_3600 .BLKW #1
;BACKUP_R1_3600 .BLKW #1
;BACKUP_R0_3600 .BLKW #1

;--------------------------------
;Data for subroutine ALL_MACHINES_FREE
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_FREE .Fill xCD00



.ORIG x3800
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_BUSY_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of busy machines.
; Return Value (R2): The number of machines that are busy
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_BUSY_MACHINES
;--------------------------------

SUB_NUM_BUSY_MACHINES_3800
;HINT back up
ST R7, BACKUP_R7_3800
;ST R6, BACKUP_R6_3800
;ST R5, BACKUP_R5_3800
;ST R4, BACKUP_R4_3800
;ST R3, BACKUP_R3_3800
;ST R2, BACKUP_R2_3800
;ST R1, BACKUP_R1_3800
;ST R0, BACKUP_R0_3800

; *** START CODE HERE ***

;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
LD R1, BUSYNESS_ADDR_NUM_BUSY_MACHINES ;loads memory location xCD00 into R1
LDR R0, R1, #0 ;loads the value that R1 points to into R0

;check 1
ADD R0, R0, #0
BRzp #2 ;jumps to add 1 to R2

ADD R0, R0, #0
BRn #2 ;jumps to add 0 to R0

;adds 1 to R2
ADD R0, R0, #0
ADD R2, R2, #1

;adds 0 to R0
ADD R0, R0, #0

;check 2 - 14
ADD R6, R6, #14 ;adds 14 to R6
CHECK_BUSY_LOOP
ADD R0, R0, R0 ;adds R0 to itself into R0
ADD R0, R0, #0
BRzp #2 ;jumps to add 1 to R2

ADD R0, R0, #0
BRn #2 ;jumps to add 0 to R0

;adds 1 to R2
ADD R0, R0, #0
ADD R2, R2, #1

;adds 0 to R0
ADD R0, R0, #0

ADD R6, R6, #-1
ADD R6, R6, #0
BRp CHECK_BUSY_LOOP
END_CHECK_BUSY_LOOP

;check 16
ADD R0, R0, R0 ;adds R0 to itself into R0
ADD R0, R0, #0
BRzp #2 ;jumps to add 1 to R2

ADD R0, R0, #0
BRn #2 ;jumps to add 0 to R2

;adds 1 to R2
ADD R0, R0, #0
ADD R2, R2, #1

;adds 0 to R2
ADD R0, R0, #0
ADD R2, R2, #0

;HINT Restore
LD R7, BACKUP_R7_3800
;LD R6, BACKUP_R6_3800
;LD R5, BACKUP_R5_3800
;LD R4, BACKUP_R4_3800
;LD R3, BACKUP_R3_3800
;LD R2, BACKUP_R2_3800
;LD R1, BACKUP_R1_3800
;LD R0, BACKUP_R0_3800

RET

BACKUP_R7_3800 .BLKW #1
;BACKUP_R6_3800 .BLKW #1
;BACKUP_R5_3800 .BLKW #1
;BACKUP_R4_3800 .BLKW #1
;BACKUP_R3_3800 .BLKW #1
;BACKUP_R2_3800 .BLKW #1
;BACKUP_R1_3800 .BLKW #1
;BACKUP_R0_3800 .BLKW #1

;--------------------------------
;Data for subroutine NUM_BUSY_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_BUSY_MACHINES .Fill xCD00



.ORIG x4000
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_FREE_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of free machines
; Return Value (R2): The number of machines that are free 
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_FREE_MACHINES
;--------------------------------

SUB_NUM_FREE_MACHINES_4000
;HINT back up
ST R7, BACKUP_R7_4000
;ST R6, BACKUP_R6_4000
;ST R5, BACKUP_R5_4000
;ST R4, BACKUP_R4_4000
;ST R3, BACKUP_R3_4000
;ST R2, BACKUP_R2_4000
;ST R1, BACKUP_R1_4000
;ST R0, BACKUP_R0_4000

; *** START CODE HERE ***

;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
LD R1, BUSYNESS_ADDR_NUM_FREE_MACHINES ;loads memory location xCD00 into R1
LDR R0, R1, #0 ;loads the value that R1 points to into R0

;check 1
ADD R0, R0, #0
BRn #2 ;jumps to add 1 to R2

ADD R0, R0, #0
BRzp #2 ;jumps to add 0 to R0

;adds 1 to R2
ADD R0, R0, #0
ADD R2, R2, #1

;adds 0 to R0
ADD R0, R0, #0

;check 2 - 14
ADD R6, R6, #14 ;adds 14 to R6
CHECK_FREE_LOOP
ADD R0, R0, R0 ;adds R0 to itself into R0
ADD R0, R0, #0
BRn #2 ;jumps to add 1 to R2

ADD R0, R0, #0
BRzp #2 ;jumps to add 0 to R0

;adds 1 to R2
ADD R0, R0, #0
ADD R2, R2, #1

;adds 0 to R0
ADD R0, R0, #0

ADD R6, R6, #-1
ADD R6, R6, #0
BRp CHECK_FREE_LOOP
END_CHECK_FREE_LOOP

;check 16
ADD R0, R0, R0 ;adds R0 to itself into R0
ADD R0, R0, #0
BRn #2 ;jumps to add 1 to R2

ADD R0, R0, #0
BRzp #2 ;jumps to add 0 to R2

;adds 1 to R2
ADD R0, R0, #0
ADD R2, R2, #1

;adds 0 to R2
ADD R0, R0, #0
ADD R2, R2, #0

;HINT Restore
LD R7, BACKUP_R7_4000
;LD R6, BACKUP_R6_4000
;LD R5, BACKUP_R5_4000
;LD R4, BACKUP_R4_4000
;LD R3, BACKUP_R3_4000
;LD R2, BACKUP_R2_4000
;LD R1, BACKUP_R1_4000
;LD R0, BACKUP_R0_4000

RET

BACKUP_R7_4000 .BLKW #1
;BACKUP_R6_4000 .BLKW #1
;BACKUP_R5_4000 .BLKW #1
;BACKUP_R4_4000 .BLKW #1
;BACKUP_R3_4000 .BLKW #1
;BACKUP_R2_4000 .BLKW #1
;BACKUP_R1_4000 .BLKW #1
;BACKUP_R0_4000 .BLKW #1

;--------------------------------
;Data for subroutine NUM_FREE_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_FREE_MACHINES .Fill xCD00



.ORIG x4200
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MACHINE_STATUS
; Input (R1): Which machine to check
; Postcondition: The subroutine has returned a value indicating whether the machine indicated
;                          by (R1) is busy or not.
; Return Value (R2): 0 if machine (R1) is busy, 1 if it is free
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MACHINE_STATUS
;--------------------------------

SUB_MACHINE_STATUS_4200
;HINT back up
ST R7, BACKUP_R7_4200
;ST R6, BACKUP_R6_4200
;ST R5, BACKUP_R5_4200
;ST R4, BACKUP_R4_4200
;ST R3, BACKUP_R3_4200
;ST R2, BACKUP_R2_4200
;ST R1, BACKUP_R1_4200
;ST R0, BACKUP_R0_4200

; *** START CODE HERE ***
;initializes all registers, except R1, to 0
AND R0, R0, #0
;AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

LD R5, BUSYNESS_ADDR_MACHINE_STATUS ;loads memory location xCD00 into R5
LDR R6, R5, #0 ;loads the value that R5 points to into R6

ADD R3, R3, R1 ;adds R1's value to R3
ADD R3, R3, #1 ;adds 1 to R3
ADD R0, R0, #15 ;adds 16 to R0
ADD R0, R0, #1
NOT R3, R3 ;two's complement of R3
ADD R3, R3, #1
ADD R0, R0, R3 ;adds R3 to R0

ADD R0, R0, #0
BRz END_SHIFT_LOOP

ADD R0, R0, #0
SHIFT_LOOP

ADD R6, R6, R6 ;adds R6 to itself into R6

ADD R0, R0, #-1
ADD R0, R0, #0
BRp SHIFT_LOOP
END_SHIFT_LOOP

ADD R6, R6, #0
BRn #2 ;jump to add 1 to R2

ADD R6, R6, #0
BRzp #2 ;jump to add 0 to R2

ADD R6, R6, #0
ADD R2, R2, #1

ADD R6, R6, #0
ADD R2, R2, #0

;HINT Restore
LD R7, BACKUP_R7_4200
;LD R6, BACKUP_R6_4200
;LD R5, BACKUP_R5_4200
;LD R4, BACKUP_R4_4200
;LD R3, BACKUP_R3_4200
;LD R2, BACKUP_R2_4200
;LD R1, BACKUP_R1_4200
;LD R0, BACKUP_R0_4200

RET

BACKUP_R7_4200 .BLKW #1
;BACKUP_R6_4200 .BLKW #1
;BACKUP_R5_4200 .BLKW #1
;BACKUP_R4_4200 .BLKW #1
;BACKUP_R3_4200 .BLKW #1
;BACKUP_R2_4200 .BLKW #1
;BACKUP_R1_4200 .BLKW #1
;BACKUP_R0_4200 .BLKW #1

;--------------------------------
;Data for subroutine MACHINE_STATUS
;--------------------------------
BUSYNESS_ADDR_MACHINE_STATUS .Fill xCD00



.ORIG x4400
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: FIRST_FREE
; Inputs: None
; Postcondition: 
; The subroutine has returned a value indicating the lowest numbered free machine
; Return Value (R2): the number of the free machine
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine FIRST_FREE
;--------------------------------

SUB_FIRST_FREE_4400
;HINT back up
ST R7, BACKUP_R7_4400
;ST R6, BACKUP_R6_4400
;ST R5, BACKUP_R5_4400
;ST R4, BACKUP_R4_4400
;ST R3, BACKUP_R3_4400
;ST R2, BACKUP_R2_4400
;ST R1, BACKUP_R1_4400
;ST R0, BACKUP_R0_4400

; *** START CODE HERE ***

;initializes all registers to 0
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
LD R1, BUSYNESS_ADDR_FIRST_FREE ;loads memory location xCD00 into R1
LDR R0, R1, #0 ;loads the value that R1 points to into R0

BEGIN_LOOP

;allows check 0-15
ADD R6, R6, #15 ;adds 16 to R6
ADD R6, R6, #1
INVERT_LOOP

;circular shift of RMB to LMB
ADD R5, R5, #15 ;adds 15 to R5
RMB_TO_LMB_LOOP

ADD R0, R0, #0
BRz #4

ADD R0, R0, #0
BRn #5

ADD R0, R0, #0
BRp #7

ADD R0, R0, #0
ADD R2, R2, #-1 ; *** FLAG ***
BRnzp END_BEGIN_LOOP

ADD R0, R0, #0
ADD R0, R0, R0
ADD R0, R0, #1
BRnzp #3

ADD R0, R0, #0
ADD R0, R0, R0
ADD R0, R0, #0

ADD R0, R0, #0
ADD R5, R5, #-1
ADD R5, R5, #0
BRp RMB_TO_LMB_LOOP
END_RMB_TO_LMB_LOOP

;*** check LMB and determine if first free ***
ADD R0, R0, #0
BRn #2

ADD R0, R0, #0
BRp #3

ADD R0, R0, #0
ADD R0, R0, #0
BRn END_INVERT_LOOP

ADD R0, R0, #0
ADD R6, R6, #-1
ADD R6, R6, #0
BRp INVERT_LOOP
END_INVERT_LOOP

ADD R2, R2, #15
ADD R2, R2, #1
NOT R6, R6
ADD R6, R6, #1
ADD R2, R2, R6
ADD R2, R2, #0

; *** check if R2 is within 0-15 ***
;ADD R2, R2, #-16

;ADD R2, R2, #0
;BRn #2 ;

;ADD R2, R2, #0
;BRz #4 ;

;ADD R2, R2, #0
;ADD R2, R2, #15
;ADD R2, R2, #1
;BRnzp END_BEGIN_LOOP

;ADD R2, R2, #0
;ADD R2, R2, #15

END_BEGIN_LOOP

;HINT Restore
LD R7, BACKUP_R7_4400
;LD R6, BACKUP_R6_4400
;LD R5, BACKUP_R5_4400
;LD R4, BACKUP_R4_4400
;LD R3, BACKUP_R3_4400
;LD R2, BACKUP_R2_4400
;LD R1, BACKUP_R1_4400
;LD R0, BACKUP_R0_4400

RET

BACKUP_R7_4400 .BLKW #1
;BACKUP_R6_4400 .BLKW #1
;BACKUP_R5_4400 .BLKW #1
;BACKUP_R4_4400 .BLKW #1
;BACKUP_R3_4400 .BLKW #1
;BACKUP_R2_4400 .BLKW #1
;BACKUP_R1_4400 .BLKW #1
;BACKUP_R0_4400 .BLKW #1

;--------------------------------
;Data for subroutine FIRST_FREE
;--------------------------------
BUSYNESS_ADDR_FIRST_FREE .Fill xCD00



.ORIG x4600
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: Get input
; Inputs: None
; Postcondition: 
; The subroutine get up to a 5 digit input from the user within the range [-32768,32767]
; Return Value (R1): The value of the contructed input
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to get input from the user, except the prompt is different.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------

SUB_GET_INPUT_4600
;HINT back up
ST R7, BACKUP_R7_4600
;ST R6, BACKUP_R6_4600
;ST R5, BACKUP_R5_4600
;ST R4, BACKUP_R4_4600
;ST R3, BACKUP_R3_4600
;ST R2, BACKUP_R2_4600
;ST R1, BACKUP_R1_4600
;ST R0, BACKUP_R0_4600

; *** START CODE HERE ***

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

LEA R0, prompt
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
BRn #6 ;jump to LEA R0, Error_msg_2

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
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

;check if '-'
ADD R0, R0, #0
ADD R0, R0, #-2 ;subtracts 2 to check if '-'

ADD R0, R0, #0
BRp #20 ;jump to check if '0'

ADD R0, R0, #0
BRn #6 ;jump to LEA R0, Error_msg_2

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
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

;check if '0'
ADD R0, R0, #0
ADD R0, R0, #-3 ;subtracts 2 to check if '0'

ADD R0, R0, #0
BRzp #14 ;jump to check if above '9'

ADD R0, R0, #0
BRn #1 ;jump to LEA R0, Error_msg_2

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

;check if above '9'
ADD R0, R0, #0
ADD R0, R0, #-10

ADD R0, R0, #0
BRn #14 ;jump to ADD R0, R0, #10

ADD R0, R0, #0
BRzp #1 ;jump to LEA R0, Error_msg_2

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
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
BRn #10 ;jump to LEA R0, Error_msg_2

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
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

;check if '0'
ADD R0, R0, #0
ADD R0, R0, #-15 ;subtracts 38 to check if '0'
ADD R0, R0, #-15
ADD R0, R0, #-8

ADD R0, R0, #0
BRzp #14 ;jump to check if above '9'

ADD R0, R0, #0
BRn #1 ;jump to LEA R0, Error_msg_2

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

;check if above '9'
ADD R0, R0, #0
ADD R0, R0, #-10

ADD R0, R0, #0
BRn #14 ;jump to ADD R0, R0, #10

ADD R0, R0, #0
BRzp #1 ;jump to LEA R0, Error_msg_2

ADD R1, R1, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
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

ADD R6, R6, #0
BRn #2 ;jump to error

ADD R6, R6, #0
BRzp #12 ;next check

ADD R6, R6, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

ADD R6, R6, #0
ADD R6, R6, #-15

ADD R6, R6, #0
BRp #2 ;jump to error

ADD R6, R6, #0
BRnz #12 ;set R1 value

ADD R6, R6, #0
AND R1, R1, #0
ADD R1, R1, #5
AND R2, R2, #0
AND R3, R3, #0
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
LEA R0, Error_msg_2
PUTS
;ADD R0, R0, #0
BRnzp Start_LOOP

ADD R6, R6, #0
AND R1, R1, #0
ADD R1, R1, #15
ADD R1, R1, R6
ADD R1, R1, #0

;HINT Restore
LD R7, BACKUP_R7_4600
;LD R6, BACKUP_R6_4600
;LD R5, BACKUP_R5_4600
;LD R4, BACKUP_R4_4600
;LD R3, BACKUP_R3_4600
;LD R2, BACKUP_R2_4600
;LD R1, BACKUP_R1_4600
;LD R0, BACKUP_R0_4600

RET

BACKUP_R7_4600 .BLKW #1
;BACKUP_R6_4600 .BLKW #1
;BACKUP_R5_4600 .BLKW #1
;BACKUP_R4_4600 .BLKW #1
;BACKUP_R3_4600 .BLKW #1
;BACKUP_R2_4600 .BLKW #1
;BACKUP_R1_4600 .BLKW #1
;BACKUP_R0_4600 .BLKW #1

;--------------------------------
;Data for subroutine Get input
;--------------------------------
NEWLINE .STRINGZ "\n"
Error_msg_2 .STRINGZ "ERROR INVALID INPUT\n"
prompt .STRINGZ "Enter which machine you want the status of (0 - 15), followed by ENTER: "
;Error_msg_2 .STRINGZ "ERROR INVALID INPUT\n"
;NEWLINE .STRINGZ "\n"



.ORIG x5000	
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: print number
; Inputs: 
; Postcondition: 
; The subroutine prints the number that is in 
; Return Value : 
; NOTE: This subroutine should print the number to the user WITHOUT 
;		leading 0's and DOES NOT output the '+' for positive numbers.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------

SUB_PRINT_NUM_R1_5000
;HINT back up
ST R7, BACKUP_R7_5000
;ST R6, BACKUP_R6_5000
;ST R5, BACKUP_R5_5000
;ST R4, BACKUP_R4_5000
;ST R3, BACKUP_R3_5000
;ST R2, BACKUP_R2_5000
;ST R1, BACKUP_R1_5000
;ST R0, BACKUP_R0_5000

; *** START CODE HERE ***

;initializes all registers, except R1, to 0
AND R0, R0, #0
;AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

R1_LOOP
ADD R1, R1, #0
ADD R1, R1, #-10 ;subtracts 10 from R1

ADD R1, R1, #0
BRn #4 ;add 58 to R1

ADD R1, R1, #0
BRz #10 ;add 49 to R1, add 48 to R1

ADD R1, R1, #0
BRp #24 ;add 49 to R1

ADD R1, R1, #0
ADD R1, R1, #15 ;adds 58 to R1
ADD R1, R1, #15
ADD R1, R1, #15
ADD R1, R1, #13
ADD R0, R0, R1
OUT
BRnzp END_R1_LOOP ;*8*

ADD R1, R1, #0
ADD R1, R1, #15 ;adds 49 to R1
ADD R1, R1, #15
ADD R1, R1, #15
ADD R1, R1, #4
ADD R0, R0, R1
OUT
AND R0, R0, #0
AND R1, R1, #0
ADD R1, R1, #15 ;adds 48 to R1
ADD R1, R1, #15
ADD R1, R1, #15
ADD R1, R1, #3
ADD R0, R0, R1
OUT
BRnzp END_R1_LOOP ;*24*

ADD R2, R2, #0
ADD R2, R2, #15 ;adds 49 to R2
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #4
ADD R0, R0, R2
OUT
AND R0, R0, #0
ADD R1, R1, #15 ;adds 48 to R1
ADD R1, R1, #15
ADD R1, R1, #15
ADD R1, R1, #3
ADD R0, R0, R1
OUT
BRnzp END_R1_LOOP

END_R1_LOOP

;HINT Restore
LD R7, BACKUP_R7_5000
;LD R6, BACKUP_R6_5000
;LD R5, BACKUP_R5_5000
;LD R4, BACKUP_R4_5000
;LD R3, BACKUP_R3_5000
;LD R2, BACKUP_R2_5000
;LD R1, BACKUP_R1_5000
;LD R0, BACKUP_R0_5000

RET

BACKUP_R7_5000 .BLKW #1
;BACKUP_R6_5000 .BLKW #1
;BACKUP_R5_5000 .BLKW #1
;BACKUP_R4_5000 .BLKW #1
;BACKUP_R3_5000 .BLKW #1
;BACKUP_R2_5000 .BLKW #1
;BACKUP_R1_5000 .BLKW #1
;BACKUP_R0_5000 .BLKW #1

;--------------------------------
;Data for subroutine print number
;--------------------------------



.ORIG x5200	
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: print number
; Inputs: 
; Postcondition: 
; The subroutine prints the number that is in 
; Return Value : 
; NOTE: This subroutine should print the number to the user WITHOUT 
;		leading 0's and DOES NOT output the '+' for positive numbers.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------

SUB_PRINT_NUM_R2_5200
;HINT back up
ST R7, BACKUP_R7_5200
;ST R6, BACKUP_R6_5200
;ST R5, BACKUP_R5_5200
;ST R4, BACKUP_R4_5200
;ST R3, BACKUP_R3_5200
;ST R2, BACKUP_R2_5200
;ST R1, BACKUP_R1_5200
;ST R0, BACKUP_R0_5200

; *** START CODE HERE ***

;initializes all registers, except R2, to 0
AND R0, R0, #0
AND R1, R1, #0
;AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

R2_LOOP
ADD R2, R2, #0
ADD R2, R2, #-10 ;subtracts 10 from R2

ADD R2, R2, #0
BRn #4 ;add 58 to R2

ADD R2, R2, #0
BRz #10 ;add 49 to R2, add 48 to R2

ADD R2, R2, #0
BRp #24 ;add 49 to R2

ADD R2, R2, #0
ADD R2, R2, #15 ;adds 58 to R2
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #13
ADD R0, R0, R2
OUT
BRnzp END_R2_LOOP ;*8*

ADD R2, R2, #0
ADD R2, R2, #15 ;adds 49 to R2
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #4
ADD R0, R0, R2
OUT
AND R0, R0, #0
AND R2, R2, #0
ADD R2, R2, #15 ;adds 48 to R2
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #3
ADD R0, R0, R2
OUT
BRnzp END_R2_LOOP ;*24*

ADD R1, R1, #0
ADD R1, R1, #15 ;adds 49 to R1
ADD R1, R1, #15
ADD R1, R1, #15
ADD R1, R1, #4
ADD R0, R0, R1
OUT
AND R0, R0, #0
ADD R2, R2, #15 ;adds 48 to R2
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #3
ADD R0, R0, R2
OUT
BRnzp END_R2_LOOP

END_R2_LOOP

;HINT Restore
LD R7, BACKUP_R7_5200
;LD R6, BACKUP_R6_5200
;LD R5, BACKUP_R5_5200
;LD R4, BACKUP_R4_5200
;LD R3, BACKUP_R3_5200
;LD R2, BACKUP_R2_5200
;LD R1, BACKUP_R1_5200
;LD R0, BACKUP_R0_5200

RET

BACKUP_R7_5200 .BLKW #1
;BACKUP_R6_5200 .BLKW #1
;BACKUP_R5_5200 .BLKW #1
;BACKUP_R4_5200 .BLKW #1
;BACKUP_R3_5200 .BLKW #1
;BACKUP_R2_5200 .BLKW #1
;BACKUP_R1_5200 .BLKW #1
;BACKUP_R0_5200 .BLKW #1

;--------------------------------
;Data for subroutine print number
;--------------------------------



.ORIG x6000
MENUSTRING .STRINGZ "**********************\n* The Busyness Server *\n**********************\n1. Check to see whether all machines are busy\n2. Check to see whether all machines are free\n3. Report the number of busy machines\n4. Report the number of free machines\n5. Report the status of machine n\n6. Report the number of the first available machine\n7. Quit\n"

.ORIG xCD00			; Remote data
BUSYNESS .FILL xABCD		; <----!!!VALUE FOR BUSYNESS VECTOR!!!

;---------------	
;END of PROGRAM
;---------------	
.END

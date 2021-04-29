; Assignment 4 - Question 1
; Author:  John-Michael O'Brien 
; ID:      w1890922
; Date:    2/14/21
; This program takes in how many miles that a car can drive on a full tank of gas (range),
; and the number of gallons the tank can hold and then calculates the MPG the car gets.

.586
.MODEL FLAT

INCLUDE io.h                    ; header file for input/output

.STACK 4096

.DATA
tankCapacity        DWORD       ?
string              BYTE        40 DUP (?)
promptCapacity      BYTE        "Enter number of gallons the car's tank can hold:", 0
promptRange         BYTE        "Enter number of miles car can be driven on full tank:", 0
resultLbl           BYTE        "MPG the car gets:", 0
MPG                 BYTE        11 DUP (?), 0

.CODE
_MainProc PROC
        input       promptCapacity, string, 40              ; read ASCII characters
        atod        string                                  ; convert to integer, and store in EAX register
        mov         tankCapacity, eax                       ; move from EAX and store in tankCapacity variable

        input       promptRange, string, 40                 ; read ASCII characters
        atod        string                                  ; convert to integer, and store in EAX register

        cdq						    ; since idiv uses EDX:EAX, cdq extends the sign of EAX to EDX
        idiv	    tankCapacity			    ; divide EAX (vehicle range) by tankCapacity
        dtoa        MPG, eax			            ; convert to ASCII characters and store in MPG variable
        output      resultLbl, MPG		            ; output label and MPG

        mov         eax, 0                                  ; exit with return code 0
        ret

_MainProc ENDP
END                                                         ; end of source code

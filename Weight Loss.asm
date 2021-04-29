; Assignment 5 - Weight Loss
; Author:  John-Michael O'Brien 
; Date:    3/9/21
; This program asks a user to enter their weight and then displays
; their weight (losing 4lbs/month) at the end of each month for a 
; period of 6 months.

.586
.MODEL FLAT

INCLUDE io.h                    ; header file for input/output

.STACK 4096

.DATA 
weight          DWORD   ?
string          BYTE    40 DUP (?)
promptWeight    BYTE    "Enter weight:", 0
resultLblMonth  BYTE    "End of Month:", 0
resultLblWeight BYTE    "Weight:", 0
monthString     BYTE    11 DUP (?), 0
weightString    BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   promptWeight, string, 40            ; prompt to get user weight
        atod    string                              ; convert to integer, store in EAX
        mov     ecx, 1                              ; count

    repeatLoop:	
        sub     eax, 4                              ; sub 4 from eax (user's entered weight)
        mov     weight, eax                         ; move eax value into weight variable for storage
        dtoa    monthString, ecx                    ; convert ecx (really month) to ASCII characters  
        dtoa    weightString, weight                ; convert weight to ASCII characters
        output  resultLblMonth, monthString         ; output the month to console
        output  resultLblWeight, weightString       ; output the weight to the console
        inc     ecx                                 ; increment counter
        cmp     ecx, 6                              ; loop until ecx (essentially month) is 6
        jng     repeatLoop                          ; jump to repeat loop

    endUntilLoop:
        mov     eax, 0                              ; exit with return code 0
        ret
        
_MainProc ENDP
END                                                 ; end of source code
; Assignment 5 - Leap Year
; Author:  John-Michael O'Brien 
; Date:    3/4/21
; This program asks the user to input a year and then 
; determines whether or not it was a leap year.


.586
.MODEL FLAT

INCLUDE io.h                ; header file for input/output

.STACK 4096

.DATA 
year            DWORD       ?
string          BYTE        40 DUP (?)
promptYear      BYTE        "Enter a year:", 0
resultLbl       BYTE        "The entered year is:", 0
isLeapYear      BYTE        "a leap year", 0
notLeapYear     BYTE        "NOT a leap year", 0

.CODE
_MainProc PROC      
        input   promptYear, string, 40      ; read ASCII characters, get year input from user
        atod    string                      ; convert to integer, move to EAX
        mov     year, eax                   ; store EAX value in year variable
        
        mov     edx, 0                      ; clear EDX register
        mov     ebx, 100                    ; move 100 into EBX for future division
        cdq				    ; since idiv uses EDX:EAX, cdq extends the sign of EAX to EDX
        idiv    ebx                         ; see if year (EAX value) is divisible by 100 (current EBX value)
        
        cmp     edx, 0                      ; check if remainder is 0
        jne     Test2                       ; if there is a remainder, jump to Test2, else move onto Test1

    Test1: ; the year was divisble by 100, so now check if divisble by 400
        mov     eax, year                   ; move year back into EAX
        mov     edx, 0                      ; clear EDX register
        mov     ebx, 400                    ; move 400 into EBX for future division
        cdq				    ; since idiv uses EDX:EAX, cdq extends the sign of EAX to EDX
        idiv    ebx                         ; check if year is divisible by 400 (current EBX value)

        cmp     edx, 0                      ; check if remainder is 0
        jne     notLeap                     ; if remainder is NOT 0, jump to notLeap
        jmp     leap                        ; if remainder is 0, jump to leap

    Test2: ; the year was NOT divisble by 100, so check if it is divisble by 4
        mov     eax, year                   ; move year back into EAX
        mov     edx, 0                      ; clear EDX register
        mov     ebx, 4                      ; move 4 into EBX for future division
        cdq				    ; since idiv uses EDX:EAX, cdq extends the sign of EAX to EDX
        idiv    ebx                         ; check if year is divisible by 4

        cmp     edx, 0                      ; check if remainder is 0
        jne     notLeap                     ; if remainder is NOT 0, jump to notLeap
        jmp     leap                        ; if remainder is 0, jump to leap

    notLeap:
        output  resultLbl, notLeapYear      ; display if it is not a leap year
        jmp     endLoop                     ; jump to endLoop

    leap:
        output  resultLbl, isLeapYear       ; display if it is a leap year
        jmp     endLoop                     ; jump to endLoop

    endLoop:
        mov     eax, 0                      ; exit with return code 0  
        ret

_MainProc ENDP
END                                         ; end of source code

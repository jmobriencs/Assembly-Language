; Assignment 4 - Question 3
; Author:  John-Michael O'Brien 
; ID:      w1890922
; Date:    3/4/21
; This program asks the user to input how man cookies they ate and then
; calculates how many total calories were consumed.

.586
.MODEL FLAT

INCLUDE io.h                    ; header file for input/output

.STACK 4096

.DATA
cookiesEaten        DWORD       ?
servingSize         DWORD       ?
caloriesPerCookie   DWORD       ?
cookiesPerBag       DWORD       30
servingsPerBag      DWORD       10
caloriesPerServing  DWORD       240
string              BYTE        40 DUP (?)
promptCookiesEaten  BYTE        "Enter how many cookies you ate (max 30):", 0
resultLbl           BYTE        "Total calories consumed:", 0
totalCalories       DWORD       11 DUP (?), 0

.CODE
_MainProc PROC
        input       promptCookiesEaten, string, 40          ; read ASCII characters
        atod        string                                  ; convert to integer, store in EAX
        mov         cookiesEaten, eax                       ; move from EAX and store in cookiesEaten variable for later
        
        mov         eax, cookiesPerBag                      ; move cookiesPerBag into EAX
        mov         ebx, servingsPerBag                     ; move servingsPerBag into EBX
        cdq				                                    ; since idiv uses EDX:EAX, cdq extends the sign of EAX to EDX
        idiv        ebx                                     ; divide EAX by EBX (30/10)
        mov         servingSize, eax                        ; move whats in EAX to servingSize variable (now 3 cookies)
        
        mov         eax, caloriesPerServing                 ; move caloriesPerServing to EAX
        cdq				                                    ; since idiv uses EDX:EAX, cdq extends the sign of EAX to EDX
        idiv        servingSize                             ; divide EAX by servingSize (240/3)
        mov         caloriesPerCookie, eax                  ; move from EAX and store in caloriesPerCookie variable

        mov         eax, cookiesEaten                       ; move cookiesEaten back into EAX
        imul        eax, caloriesPerCookie                  ; multiply what is in the EAX (cookiesEaten) by number of caloriesPerCookie
        dtoa        totalCalories, eax                      ; move whats in EAX to totalCalories variable      
        output      resultLbl, totalCalories		        ; output label and total calories user consumed
        
        mov         eax, 0                                  ; exit with return code 0
        ret

_MainProc ENDP
END                                                         ; end of source code

; Assignment 3
; Author:  John-Michael O'Brien 
; ID:      w1890922
; Date:    2/14/21
; This program takes in a student name, degree name, credits earned and credits needed
; and calculates the remaining number of credits needed to earn a degree.

.586
.MODEL FLAT

INCLUDE io.h        ; header file for input/output

.STACK 4096         ; reserve 4096 byte stack

.DATA               ; reserve storage for data
creditsEarned       DWORD   ?
creditsNeeded       DWORD   ?
studentName         BYTE    40 DUP (?)
degreeName          BYTE    40 DUP (?)
string              BYTE    40 DUP (?)
promptName          BYTE    "Enter student name:", 0
promptDegree        BYTE    "Enter degree name:", 0
promptEarned        BYTE    "Enter number of credits earned:", 0
promptNeeded        BYTE    "Enter number of credits needed for degree:", 0
resultLbl           BYTE    "Credits remaining to graduate:", 0
sum                 BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   promptName, studentName, 40         ; get studentName

        input   promptDegree, degreeName, 40        ; get degreeName

        input   promptEarned, string, 40            ; get credits earned
        atod    string                              ; to DWORD
        mov     creditsEarned, eax                  ; store in creditsEarned

        input   promptNeeded, string, 40            ; get credits needed
        atod    string                              ; to DWORD
        mov     creditsNeeded, eax                  ; store in creditsNeeded
        
        mov     eax, creditsNeeded                  ; move creditsNeeded to EAX
        sub     eax, creditsEarned                  ; subtract creditsEarned from creditsNeeded
        dtoa    sum, eax                            ; convert to ASCII characters
        output  resultLbl, sum                      ; output number of remaining credits

        mov     eax, 0                              ; exit with return code 0
        ret
_MainProc ENDP
END                                         ; end of source code
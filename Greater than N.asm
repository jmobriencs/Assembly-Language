; Assignment 8 - Elements Greater than 'n'
; Author:  John-Michael O'Brien 
; ID:      w1890922
; Date:    4/10/21
; This program defines an array of doubleword numbers and then reads
; 2 values: number of array elements, and a number n. The program then
; displays all values in the array that are greater than the number n.

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
array           DWORD        24, 8, 33, 77, 23, 88, 69, 17, 42, 101
arraySize       DWORD        10                                
n               DWORD        30                                            
promptArray     BYTE         "Predefined Array:", 0   			
arrayElements   BYTE         "24, 8, 33, 77, 23, 88, 69, 17, 42, 101", 0
promptN         BYTE         "Value of 'n':", 0                            
valueN          BYTE         "30", 0                                       
outputLbl       BYTE         "Number in array greater than 'n':", 0        
string          BYTE         40 DUP (?)                               

.CODE
_MainProc PROC
        output  promptArray, arrayElements              ; displays the array to be read
        output  promptN, valueN                         ; displays the value of n to be read
        lea     ebx, array                              ; load array address into EBX
        mov     ecx, arraySize                          ; load array size into ECX (iterator)

    arrayLoop:
        mov     eax, [ebx]                              ; move current array element into EAX
        cmp     eax, n                                  ; compare EAX to variable n
        jle     nextElement                             ; if current element is <= n, jump to nextElement block
        dtoa    string, [ebx]                           ; else current number is > n, convert to ascii
        output  outputLbl, string                       ; display number larger than n

    nextElement:
        add     ebx, 4                                  ; point at the next element
        loop    arrayLoop                               ; continue the loop

    endProgram:
        mov     eax, 0                                  ; exit with return code 0
        ret

_MainProc ENDP
END                                                     ; end of source code
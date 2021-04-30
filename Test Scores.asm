; Assignment 8 - Test Scores
; Author:  John-Michael O'Brien 
; Date:    4/10/21
; This program asks a user to enter up to 10 integer test scores in the 
; range of 0 to 100 from the user and stores them in an array of words. 
; Then the program should report how many perfect scores were entered.

.586
.MODEL FLAT

INCLUDE io.h                ; header file for input/output

.STACK 4096

.DATA
perfScores      WORD        ?
scores          WORD        10 DUP (?)
prompt          BYTE        "Enter exam score:", 0
promptError     BYTE        "ERROR!", 0
promptBad       BYTE        "Enter scores between 0-100", 0
outputLbl       BYTE        "Number of perfect scores:", 0
string          BYTE        40 DUP (?)

.CODE
_MainProc PROC
        lea     ebx, scores                     ; load array address into EBX register
        mov     ecx, 10                         ; number of elements
        jmp     doWhile                         ; jump to the do while loop (skip over badScore)
    
    badScore: 
        output  promptError, promptBad          ; output Error message and badScore prompt

    doWhile:
        input   prompt, string, 40              ; prompt the user to enter a test score
        atod    string                          ; convert to integer
        mov     [ebx], eax                      ; move user inputted number into the array element

        cmp     eax, 0                          ; compare current score to 0
        jl      badScore                        ; if score is less than 0, jump to badScore

        cmp     eax, 100                        ; compare current score to 100 again
        jg      badScore                        ; if score is larger than 100, jump to badScore
    
        cmp     eax, 100                        ; compare current score to 100 to see if perfect score
        jne     nextScore                       ; if not equal, jump over increment and go to next index

        inc     perfScores                      ; else, increment perfScores before continuing

    nextScore:
        add     ebx, 2                          ; point at next element
        loop    doWhile                         ; continue in the while loop

    displayAndExit:
        wtoa    string, perfScores              ; convert perfScores to ASCII
        output  outputLbl, string               ; display the number of perfect scores
        mov     eax, 0                          ; exit with return code 0
        ret

_MainProc ENDP
END                                             ; end of source code
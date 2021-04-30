; Assignment 10 - Concatenate Two Strings
; Author:  John-Michael O'Brien 
; Date:    4/25/21
; This program takes in two strings from the user as an input and then
; concatenates the two strings and displays a joined string as the output.

.586
.MODEL FLAT

.STACK 4096

INCLUDE io.h            ; header file for input/output          

.DATA
string1         BYTE    100 DUP (?)
string2         BYTE    100 DUP (?)
prompt1         BYTE    "Enter the first string:", 0
prompt2         BYTE    "Enter the second string:", 0
resultLbl       BYTE    "The concatenated string is:", 0

.CODE
_MainProc PROC
        input   prompt1, string1, 100  ; get user input for first string
        lea     edi, string1           ; EDI used for destination string elements
        input   prompt2, string2, 100  ; get user input for second string
        lea     esi, string2           ; ESI used for source string elements

    WhileNotNull:
        cmp     BYTE PTR [edi], 0      ; check for null byte (in destination)
        je      Concatenate            ; jump to Concatenate if null
        inc     edi                    ; move to next element address
        jmp     WhileNotNull           ; check next byte (jump to beg WhileNotNull loop)

    Concatenate:
        movsb                          ; copy one byte (from source to destination)
        cmp     BYTE PTR [esi], 0      ; check for null byte (in source)
        jne     Concatenate            ; if next byte is not null, jump to Concatenate

    OutputAndExit:  
        output  resultLbl, string1     ; display concatenated string
        mov     eax, 0                 ; exit with return code 0
        ret

_MainProc ENDP
END                                    ; end of source code

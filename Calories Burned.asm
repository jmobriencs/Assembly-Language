; Assignment 5 - Calories Burned
; Author:  John-Michael O'Brien 
; Date:    3/9/21
; This program uses a loop to display the number of calories
; burned after 5, 10, 15, 20, 25, and 30 min.

.586
.MODEL FLAT

INCLUDE io.h		; header file for input/output

.STACK 4096

.DATA
minsExercise	DWORD	?
caloriesBurned	DWORD	?
N		DWORD	7
resultLblmin	BYTE	"Minutes Exercised:", 0
resultLblcal	BYTE	"Calories Burned:", 0
minString	BYTE	11 DUP (?), 0
calString	BYTE	11 DUP (?), 0

.CODE
_MainProc PROC
	mov	ecx, 1					; count
	mov	eax, 0					; sum

    whileN:		
	cmp	ecx, N					; while (count<N) loop
	jnl	endWhileN				; jump if not less
	mov	eax, ecx				; add the value of ECX to sum
	imul	eax, 5					; multiply EAX by 5 every time
	mov	minsExercise, eax			; move EAX value into minsExercise variable
	imul	eax, 4					; multiply the EAX by 4 (burning 4 cals per min)
	mov	caloriesBurned, eax			; move EAX value into caloriesBurned variable
	dtoa	minString, minsExercise			; convert minsExercise to ASCII characters
	dtoa	calString, caloriesBurned		; convert caloriesBurned to ASCII characters
	output	resultLblmin, minString			; output minutes exercised 
	output	resultLblcal, calString			; output calories burned
	inc	ecx					; add 1 to count
	jmp	whileN					; jump back to top of loop
	
    endWhileN:
	mov	eax, 0                          	; exit with return code 0
        ret

_MainProc ENDP
END							; end of source code

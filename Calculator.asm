; Assignment 7 - Calculator
; Author:  John-Michael O'Brien 
; Date:    3/20/21
; This program asks a user to enter a mathematical operator (+, -, *, /).
; Then it asks the user to enter two numbers and then displays the result 
; based on what operator the user selected. Entering 'e' ends the program.

.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096

.DATA
number1		DWORD	?
number2		DWORD	?
string		BYTE	40 DUP (?)
operation	BYTE	40 DUP (?)
promptCalc	BYTE	"Enter mathematical operator (+, -, *, /) or enter e to exit:", 0
promptNum1	BYTE	"Enter number 1:", 0
promptNum2	BYTE	"Enter number 2:", 0
outputLbl	BYTE	"Result:", 0
result		BYTE	11 DUP (?), 0

.CODE
_MainProc PROC
	calcLoop:						; this program loops until user enters 'e'
		input	promptCalc, operation, 2		; prompt user to enter operation symbol
		cmp	operation, 'e'				; compare user entry to 'e'
		je	endProgram				; if user enters 'e' exit the program

		input	promptNum1, string, 40			; prompt user to enter number 1
		atod	string					; convert to dec, store in eax
		mov	number1, eax				; store eax value in number1 variable

		input	promptNum2, string, 40			; prompt user to enter number 2
		atod	string					; convert to dec, store in eax
		mov	number2, eax				; store eax value in number2 variable

		push	number2					; push number2 onto the stack
		push	number1					; push number1 onto the stack

		cmp	operation, '+'				; compare user entry to addition symbol
		je	Addition				; if symbols match, jump to Addition block

		cmp	operation, '-'				; compare user entry to subtraction symbol
		je	Subtraction				; if symbols match, jump to Subtraction block

		cmp	operation, '*'				; compare user entry to multiplication symbol
		je	Multiplication				; if symbols match, jump to Multiplication block

		cmp	operation, '/'				; compare user entry to division symbol
		je	Division				; if symbols match, jump to Division block

		jne	calcLoop				; if no symbol match is found, jump back to beginning of loop 

	Addition:
		call	add2					; call the add2 procedure
		add	esp, 8					; remove parameters from stack
		jmp	calcResult				; jump to calcResult block

	Subtraction:
		call	sub2					; call the sub2 procedure
		add	esp, 8					; remove parameters from stack
		jmp	calcResult				; jump to calcResult block	
		
	Multiplication:
		call	mul2					; call the mul2 procedure		
		add	esp, 8					; remove parameters from stack
		jmp	calcResult				; jump to calcResult block

	Division:
		call	div2					; call the div2 procedure
		add	esp, 8					; remove parameters from stack
		jmp	calcResult				; jump to calcResult block

	calcResult:
		dtoa	result, eax				; convert result to ascii
		output	outputLbl, result			; display the result
		jmp	calcLoop				; jump back to the start of calcLoop

	endProgram:
		mov	eax, 0					; exit with return code 0
		ret
_MainProc ENDP

add2 PROC							; add two dwords passed on the stack
		push	ebp					; save EBP
		mov	ebp, esp				; establish stack frame
		mov	eax, [ebp+8]				; copy first parameter value
		add	eax, [ebp+12]				; add second parameter value
		pop	ebp					; restore EBP
		ret						; return
add2 ENDP

sub2 PROC							; subtract two dwords passed on the stack
		push	ebp					; save EBP
		mov	ebp, esp				; establish stack frame
		mov	eax, [ebp+8]				; copy first parameter value
		sub	eax, [ebp+12]				; subtract second parameter value
		pop	ebp					; restore EBP
		ret						; return
sub2 ENDP

mul2 PROC							; multiply two dwords passed on the stack
		push	ebp					; save EBP
		mov	ebp, esp				; establish stack frame
		mov	eax, [ebp+8]				; copy first parameter value
		imul	eax, [ebp+12]				; multiply second parameter value
		pop	ebp					; restore EBP
		ret						; return
mul2 ENDP

div2 PROC							; divide two dwords passed on the stack
		push	ebp					; save EBP
		mov	ebp, esp				; establish stack frame
		mov	eax, [ebp+8]				; move first parameter into eax
		mov	ebx, [ebp+12]				; move second parameter into ebx
		cdq						; extend sign to edx
		idiv	ebx					; divide eax by ebx
		pop	ebp					; restore EBP
		ret						; return
div2 ENDP
END

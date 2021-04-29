; Assignment 4 - Question 2
; Author:  John-Michael O'Brien 
; Date:    3/4/21
; This program takes in a rent/mortgage payment, utilities, phone, and cable bills.
; It then displays the monthly cost of these expenses as well as the annual cost. 

.586
.MODEL FLAT

INCLUDE io.h                    ; header file for input/output

.STACK 4096

.DATA 
housingCost         DWORD       ?
utilitiesBill       DWORD       ?
phoneBill           DWORD       ?
cableBill           DWORD       ?
string              BYTE        40 DUP (?)
promptHousing       BYTE        "Enter your monthly rent/mortgage payment:", 0
promptUtilities     BYTE        "Enter your monthly utilities bill:", 0
promptPhone         BYTE        "Enter your monthly phone bill:", 0
promptCable         BYTE        "Enter your monthly cable bill:", 0
resultLblMonthly    BYTE        "Monthly expenses:", 0
resultLblAnnual     BYTE        "Annual expenses:", 0
monthlyCost         BYTE        11 DUP (?), 0
annualCost          BYTE        11 DUP (?), 0

.CODE
_MainProc PROC
        input       promptHousing, string, 40           ; read ASCII characters
        atod        string                              ; convert to integer
        mov         housingCost, eax                    ; move from EAX and store in housingCost variable

        input       promptUtilities, string, 40         ; read ASCII characters
        atod        string                              ; convert to integer
        mov         utilitiesBill, eax                  ; move from EAX and store in utilitiesBill variable

        input       promptPhone, string, 40             ; read ASCII characters
        atod        string                              ; convert to integer
        mov         phoneBill, eax                      ; move from EAX and store in phoneBill variable                              

        input       promptCable, string, 40             ; read ASCII characters
        atod        string                              ; convert to integer
        mov         cableBill, eax                      ; move from EAX and store in cableBill variable

        mov         eax, housingCost                    ; move housingCost back into EAX               
        add         eax, utilitiesBill                  ; add utilitiesBill to EAX
        add         eax, phoneBill                      ; add phoneBill to EAX
        add         eax, cableBill                      ; add cableBill to EAX
        dtoa        monthlyCost, eax                    ; convert to ASCII characters and store in monthlyCost variable
        output      resultLblMonthly, monthlyCost       ; output label and monthly cost
        imul        eax, 12                             ; multiply current EAX (monthly cost) by 12
        dtoa        annualCost, eax                     ; convert to ASCII characters and store in annualCost variable
        output      resultLblAnnual, annualCost         ; output label and annual cost

        mov         eax, 0                              ; exit with return code 0
        ret

_MainProc ENDP
END                                                     ; end of source code

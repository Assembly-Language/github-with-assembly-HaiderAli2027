; Name : Haider Ali
; Reg no: 23-NTU-CS-1164
; Section BS-SE A (3rd) 


include irvine32.inc
.data
array sword -11,12,-13,14,-15,16,-17,18,-19,20      ; Declare an Array
sumMsg byte "Sum of positive Numbers is: ",0
CountMsg byte "Total number of positive numbers are: ",0

.code
main proc

mov esi, offset array          ; Pass The Address of array to esi
mov ecx, lengthof array        ; Pass the length of array to ecx fo loop counter
mov eax,0                      ; Clear the Eax
mov ebx,0                      ; Clear the Ebx

next:
    mov dx,word ptr [esi]       ; dx = The Value of array on that index esi is pointing
    test dx,8000h               ; Test dx with 8000h to find the positive number
    jnz negative                ; JUm to negative on the basis of Zero Flag 
    add ax,dx                   ; Add the positive numbers in eax
    inc ebx                      ; Count the total positive numbers in ebx
    Negative:
        add esi,type array      ; move to next index of array
loop Next                       ; LOOP until ecx = 0

; DISPLAY THE STRING MESSAGE
mov edx,offset sumMsg
call writestring 
; DISPLAY THE SUM OF NUMBERS
call writedec
call crlf
;DISPLAY THE STRING MESSAGE 
mov edx,offset CountMsg
call writestring 
;DISPLAY THE TOTAL NUMBERS
mov eax,ebx
call writedec


exit
main endp


end main
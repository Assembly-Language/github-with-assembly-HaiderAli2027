; Name : Haider Ali
; Reg no: 23-NTU-CS-1164
; Section BS-SE A (3rd)

include irvine32.inc
.data
array sword 1,2,3,4,5,6,7,8,9,10,11,12,13
sumMsg byte "Sum of Even Numbers is: ",0
CountMsg byte "Total number of Even numbers are: ",0

.code
main proc

mov esi, offset array          ; Pass The Address of array to esi
mov ecx, lengthof array        ; Pass the length of array to ecx fo loop counter
mov eax,0                      ; Clear the Eax
mov ebx,0                      ; Clear the Ebx

Next:
    mov dx,word ptr[esi]        ; dx = The Value of array on that index esi is pointing
    test dx,0001h               ; Test dx with 0001h to find the even number
    jnz skip                    ; JUm to Skip on the basis of Zero Flag 

    add ax,dx                   ; Add the Even numbers in eax
    inc ebx                     ; Count the total Even numbers in ebx

    skip:
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
.686 
.model flat,stdcall 
 
.stack 100h 
 
.data 
X dd 1,2,3,4,5;двумерный массив
  dd 4,5,6,7,8
  dd 1,4,3,9,2


lines dd 3   ;количество строк    
columns dd 5 ;количество столбцов 

bufer dd 0

.code 
ExitProcess PROTO STDCALL :DWORD 
Start: 


mov ecx, 0 ;счетчик байтов
mov eax, 0 ;сумма
mov ebx, 0 ;счетчик столбцов
mov edx, 0 ;счетчик строк

for_lines:
mov ebx, 0
cmp edx, lines
jnl second_step
call for_line
mov bufer, ecx
mov ecx,4
imul ecx, columns
add ecx, bufer
add edx, 2
jmp for_lines
ret

for_line:     
    cmp ebx, columns         
    jnl for_end         ; условие - если счетчик больше или равен пределу, выход из цикла
    add eax, [X+ecx]
    add ecx, 4
    add ebx, 1
    jmp for_line       
for_end:
    ret
ret

second_step:
mov ebx, 0
mov edx, 0
mov ecx, 0
mov bufer, 0
jmp for_columns
ret

for_column:     
    cmp edx, lines         
    jnl for_endm         
    add eax, [X+ecx]
    mov bufer, ecx
    mov ecx, 4
    imul ecx, columns
    add ecx, bufer
    add edx, 1
    jmp for_column       
for_endm:
    ret
ret


for_columns:
cmp ebx, columns
jnl finish
call for_column
mov edx, 0
add ebx, 2
mov ecx, 4
imul ecx, ebx
jmp for_columns
ret


finish:
ret

exit: 
Invoke ExitProcess, eax; /*вывод результата на экран*/
End Start


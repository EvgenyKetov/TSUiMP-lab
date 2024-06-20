.586
.XMM
.MODEL flat, C
.DATA
fly dd 0.0
sum dd 1.2
.CODE
extern func:near
public asfun; /*Объявление функции, которую будет вызывать код С++*/
asfun proc C x:dword, k:dword, n:dword; /*Объявление переменных, которые будут переданы из С++*/
mov eax, x; /*Передача в регистр ах*/
push eax; /*Добавление в стек*/
mov eax, k; /*Передача в регистр ах*/
push eax; /*Добавление в стек*/
mov ebx, k
call func; /*Вызов функции из кода C++ из Assembler*/
fst fly; /*Передача расчитанного значения из стека в переменную*/

cmp ebx, 1
jg s_step
je f_step

f_step:
fld st[0]
jmp m1
ret


s_step:
cmp ebx, 4
jge l_step
fadd st[0], st[1]
fld st[0]
jmp m1
ret

l_step:
FCHS
fadd st[0], st[1]
fld st[0]

m1:




Exit:
ret
asfun endp; /*Конец функции вызова, возврат значения в C++*/
End

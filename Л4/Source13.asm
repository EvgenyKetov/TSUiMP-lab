.586
.XMM
.MODEL flat, C
.DATA
fly dd 0.0
sum dd 1.2
.CODE
extern func:near
public asfun; /*���������� �������, ������� ����� �������� ��� �++*/
asfun proc C x:dword, k:dword, n:dword; /*���������� ����������, ������� ����� �������� �� �++*/
mov eax, x; /*�������� � ������� ��*/
push eax; /*���������� � ����*/
mov eax, k; /*�������� � ������� ��*/
push eax; /*���������� � ����*/
mov ebx, k
call func; /*����� ������� �� ���� C++ �� Assembler*/
fst fly; /*�������� ������������ �������� �� ����� � ����������*/

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
asfun endp; /*����� ������� ������, ������� �������� � C++*/
End

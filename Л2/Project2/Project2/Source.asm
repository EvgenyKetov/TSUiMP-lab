.686
.model flat,stdcall
.stack 100h
.data
M dw ?;
R dw ?;
N1 dw 60961, 17049, 38212, 21594;
.code
ExitProcess PROTO STDCALL :DWORD
Start:
xor eax, eax
xor ebx, ebx
xor ecx, ecx


mov ax,1
mov cx,4
mov bx,0
l1: 
sub [N1+bx],ax
add bx,2
loop l1 ; ���������� �����

mov ax,[N1+0]
mov bx,[N1+4]
AND ax, bx
mov bx,[N1+2]
mov cx,[N1+6]
xor bx, cx
or ax, bx
mov M, ax

cmp M,0 ; ���������
jl if_11 ; ������� ���� ������
jmp if_12 ; ����������� �������

if_11:
call M1
jmp end_if_1

if_12:
call M2
jmp end_if_1

end_if_1:
cmp R, 12728 ; ���������
jl if_21 ;  ����������� �������
jmp if_22 ; ������� ���� ������ ��� �����

if_21:
call adr1
jmp adr3

if_22:
call adr2
jmp adr3

adr3:
mov R,ax

exit:
Invoke ExitProcess,R


m1: ;���� M<0
mov ax,2
imul ax,M; ��������� ����� �� 2
sub ax, 2348 ; M*2 - Y
mov R, ax
ret

m2:;  ���� M>=0
mov ax,M
mov bx,2
div ax
add ax, 4932
mov R, ax
ret

adr1:; ������������
mov ax,R
xor ax, 37180
mov R,ax
ret 

adr2:; ����������� �������
mov ax,R
add ax, 8731
mov R,ax
ret 

End Start


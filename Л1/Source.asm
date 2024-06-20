.686 
.model flat,stdcall 
.stack 100h 
.data 
 X dw 18;
 Y dw 33;
 Z dw 8;
 M dw ?;
.code 
ExitProcess PROTO STDCALL :DWORD 
Start: 
mov ax,X;
mov bx,Y;
mov cx,Z;
IMUL ax,4;
RCL cx,5;
IMUL cx,4;
IMUL bx,4;
ADD ax,cx;
SUB ax,bx;
mov M,ax;
exit: 
Invoke ExitProcess, M; 
End Start 
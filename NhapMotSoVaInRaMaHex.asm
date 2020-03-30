;nhap mot so kieu word, in ra man hinh max Hex
.model tiny
.stack 100h
.data
tb1 db "nhap so: $"
tb2 db 10, 13, "ma Hex la: $"
num dw 0
.code
mov ax, @data
mov ds, ax

;thong bao nhap so
lea dx, tb1
mov ah, 09h
int 21h

;nhap so
nhap:
mov ah, 01h
int 21h   
cmp al, 13
je xuat  
xor dx, dx  
mov ah, 0 
sub ax, 30h
mov cx, ax
mov ax, num
mov bx, 10
mul bx
add ax, cx
mov num, ax
jmp nhap
  
soHex:
mov ax, num    
mov ah, 0
mov bx, 16        
xor cx, cx
chia:
xor dx, dx
div bx
push dx
inc cx
cmp al, 0
je inkq
jmp chia  

inkq:
pop dx
add dl, 30h
mov ah, 02h
int 21h 
loop inkq
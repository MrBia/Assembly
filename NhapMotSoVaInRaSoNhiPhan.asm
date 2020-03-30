;nhap mot so va in ra so nhi phan cua no
.model tiny
.stack 100h
.data
tb1 db "nhap so: $"
tb2 db 10, 13, "ma nhi phan la: $"
num dw 0      
.code
mov ax, @data
mov ds, ax

;in thong bao nhap
lea dx, tb1
mov ah, 09h
int 21h

;nhap so
nhap:
mov ah, 01h
int 21h   
cmp al, 13
je nhiphan   
sub al, 30h
mov cl, al
mov ax, num
mov bx, 10
mul bx    
add ax, cx
mov num, ax
jmp nhap


nhiphan:  
mov ax, num
mov bx, 2
xor cx, cx
chianhiphan:
xor dx, dx
div bx
push dx  
inc cx
cmp al, 0
je xuat
jmp chianhiphan


xuat:
lea dx, tb2
mov ah, 09h
int 21h

inra:
pop dx
add dx, 30h
mov ah, 02h
int 21h
loop inra   

;exit
mov ah, 4ch
int 21h
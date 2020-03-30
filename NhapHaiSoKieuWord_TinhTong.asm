;nhap vao 2 so kieu word, in ra man hinh tong 2 so vua nhap 
.model tiny
.stack 100h
.data
tb1 db "nhap so a: $"
tb2 db 10, 13, "nhap so b: $"
tb3 db 10, 13, "tong hai so vua nhap la: $"
so1 dw 0
so2 dw 0
tong dw 0
.code
mov ax, @data
mov ds, ax

;thong bao nhap so a
lea dx, tb1
mov ah, 09h
int 21h

;nhap so a  
nhapa:
mov ah, 01h
int 21h
cmp al, 13
je nhapb   
sub al, 30h
mov ah, 0
mov dx, ax
mov ax, so1
mov bl, 10
mul bl  
add ax, dx    
mov so1, ax
jmp nhapa  

nhapb:       
;thong bao nhap b
lea dx, tb2
mov ah, 09h
int 21h
nhap:
mov ah, 01h
int 21h
cmp al, 13
je tinhtong
sub al, 30h ;chuyen qua kieu byte
mov ah, 0
mov dx, ax
mov ax, so2
mov bl, 10
mul bl
add ax, dx  
mov so2, ax
jmp nhap

tinhtong:     
xor ax, ax
xor dx, dx
mov ax, so1
mov dx, so2
add ax, dx
mov tong, ax

;thong bao ket qua
lea dx, tb3
mov ah, 09h
int 21h

;mov ax, tong 
mov ax, tong
xor cx, cx  
xor dx, dx
chia:
mov bx, 10
div bx
push dx
inc cx
cmp al, 0
je inketqua
xor dx, dx
jmp chia

    
inketqua:    
lap:
pop dx
add dl, 30h
mov ah, 02h
int 21h
loop lap   

;exit
mov ah, 4ch
int 21h
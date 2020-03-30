; nhap hai so kieu byte va tinh tich hai so vua nhap
.model tiny
.stack 100h
.data
tb1 db "nhap so a: $"
tb2 db 10, 13, "nhap so b: $"
tb3 db 10, 13, "tich 2 so la: $"
so1 db 0
so2 db 0
.code
mov ax, @data
mov dx, ax

;thong bao nhap so thu 1
lea dx, tb1
mov ah, 09h
int 21h

nhap1:
mov ah, 1
int 21h
cmp al, 13
je nhap2
sub al, 30h 
mov dl, al
mov al, so1
mov bl, 10
mul bl
add al, dl
mov so1, al
jmp nhap1

nhap2:
;thong bao nhap so thu 2
lea dx, tb2
mov ah, 09h
int 21h
nhap:
mov ah, 1
int 21h
cmp al, 13
je tinhtich
sub al, 30h
mov dl, al
mov al, so2
mov bl, 10
mul bl
add al, dl
mov so2, al
jmp nhap

tinhtich:
mov al, so1
mul so2
mov bx, ax
;jmp tinhtich

;thong bao ket qua
lea dx, tb3
mov ah, 09h
int 21h

mov ax, bx
mov bx, 10
xor cx, cx
chia:
xor dx, dx
div bx
push dx
inc cx
cmp ax, 0
ja chia

mov ah, 2
lay:
pop dx
add dl, 30h
int 21h
loop lay

;exit
mov ah, 4ch
int 21h

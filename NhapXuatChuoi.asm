;nhap xuat chuoi
.model small
.stack 100h
.data
nhap db "nhap chuoi: $"
xuat db 10, 13 , "chuoi vua nhap la: $"
MAX db 20
str db 30 dup('$')    

.code
mov ax, @data
mov ds, ax

;in thong bao
lea dx, nhap
mov ah, 9
int 21h

;nhap chuoi
mov ah, 0ah
lea dx, MAX
int 21h

;in thong bao
lea dx, xuat
mov ah, 9
int 21h

;in chuoi
lea dx, MAX+2 ;byte dau chua max, byte 2 chua max thuc te
mov ah, 9
int 21h
             
mov ah, 8
int 21h
             
;exit
mov ah, 4ch
int 21h
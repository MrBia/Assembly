.model small
.stack 100h
.data
nhap db "nhap ki tu hoa: $"
xuat db 0dh, 0ah, "ki tu thuong la: $"
kitu db ?
.code
mov ax, @data
mov ds, ax

;xuat thong bao
lea dx, nhap
mov ah, 9
int 21h

;nhap ki tu
mov ah, 1
int 21h
mov kitu, al

;xuat ki tu
lea dx, xuat
mov ah, 9
int 21h

mov dl, kitu
add dl, 20h
mov ah, 2
int 21h

;exit
mov ah, 4ch
int 21h
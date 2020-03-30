.model small
.stack 100h
.data
str1 db "nhap 1 ki tu: $"
str2 db 0dh, 0ah, "ki tu vua nhap: $"
Kitu db ?

.code
mov ax, @data
mov ds, ax

lea dx, str1
mov ah, 9
int 21h

mov ah, 1
int 21h
mov Kitu, al

lea dx, str2
mov ah, 9
int 21h

mov ah, 2
mov dl, Kitu
int 21h

mov ah, 4ch
int 21h
end
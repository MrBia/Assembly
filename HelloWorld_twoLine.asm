.model small
.stack 100h

.data
str1 db "chao mung den voi$"
str2 db 0dh, 0ah, "assembly$"

.code
mov ax, @data
mov ds, ax

lea dx, str1
mov ah, 9
int 21h

lea dx, str2
mov ah, 9
int 21h

mov ah, 4ch
int 21h
end
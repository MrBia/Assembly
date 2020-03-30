.model small
.stack 100h

.data
str db "hello world$"

.code
mov ax, @data
mov ds, ax
mov dx, offset str
mov ah, 9
int 21h
mov ah, 4ch
int 21h
end
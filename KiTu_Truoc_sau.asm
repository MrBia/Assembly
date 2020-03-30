.model small
.stack 100h
.data
nhap_kt db "nhap ki tu: $"
kt_truoc db 0dh, 0ah, "ki tu dung truoc: $"
kt_sau db 0dh, 0ah, "ki tu dung sau: $" 
KiTu db ?

.code
mov ax, @data
mov ds, ax

lea dx, nhap_kt
mov ah, 9
int 21h

;nhap ki tu
mov ah, 1
int 21h
mov KiTu, al
            
;so dung truoc
lea dx, kt_truoc
mov ah, 9
int 21h

mov ah, 2
mov dl, KiTu
dec dl
int 21h

;so dung sau
lea dx, kt_sau
mov ah, 9
int 21h

mov ah, 2
mov dl, KiTu
inc dl
int 21h

mov ah, 4ch
int 21h             
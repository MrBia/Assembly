; tinh tong cac phan tu chia het cho 7 trong mang
.model tiny
.stack 100h
.data
tb1 db "tong cac phan tu chia het cho 7 la: $"
arr db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
sum db 0
.code
mov ax, @data
mov ds, ax

;thong bao 1
lea dx, tb1
mov ah, 09h
int 21h

mov cx, 20
lea si, arr
mov sum, 0
duyet:
mov al, [si]
mov bl, 7
mov ah, 0
div bl
cmp ah, 0
je tong
jmp tiep

tong:
mov al, [si]
mov bl, sum
add al, bl
mov sum, al

tiep:
inc si
;inc dl
loop duyet  

;in ket qua
mov al, sum
mov bl, 10
mov cx, 0

chia:  
;xor dx, dx
mov ah, 0
div bl   
;mov dl, ah
push dx
inc cx
cmp al, 0
je inkq
jmp chia

inkq:
pop dx
add dx, 30h
mov ah, 02h
int 21h
loop inkq

;exit 
mov ah, 4ch
int 21h
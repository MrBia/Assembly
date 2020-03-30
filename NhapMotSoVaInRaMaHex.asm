;nhap mot so kieu word, in ra man hinh max Hex
.model tiny
.stack 100h
.data
tb1 db "nhap so: $"
tb2 db 10, 13, "ma Hex la: $"
num dw 0
.code
mov ax, @data
mov ds, ax

;thong bao nhap so
lea dx, tb1
mov ah, 09h
int 21h

;nhap so
nhap:
mov ah, 01h
int 21h   
cmp al, 13
je soHex  
xor dx, dx  
mov ah, 0 
sub ax, 30h
mov cx, ax
mov ax, num
mov bx, 10
mul bx
add ax, cx
mov num, ax
jmp nhap
  
soHex:        

;thong bao in ket qua
lea dx, tb2
mov ah, 09h
int 21h

mov ax, num 
mov bx, 16        
xor cx, cx
chia:
xor dx, dx
div bx
push dx
inc cx
cmp al, 0
je inkq
jmp chia        
      
inkq:
pop dx
cmp dl, 9
ja big
jb small
je small
tiep:
mov ah, 02h
int 21h 
loop inkq

cmp cx, 0
je exit  
       
big:
add dl, 55
jmp tiep
small:
add dl, 48
jmp tiep
       
;exit
exit: 
mov ah, 4ch
int 21h        

;success
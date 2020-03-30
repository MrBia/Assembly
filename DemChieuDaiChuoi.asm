.model small
.stack 100h
.data
nhap_chuoi db "nhap chuoi: $"
chieu_dai_chuoi db 10, 13, "chieu dai chuoi: $"
str db 100,?,101 dup('$')

.code
BEGIN:
mov ax, @data
mov ds, ax

;thong bao nhap chuoi
lea dx, nhap_chuoi
mov ah, 09h
int 21h

;nhap chuoi
mov ah, 0ah
lea dx, str
int 21h

;thong bao chieu dai chuoi
lea dx, chieu_dai_chuoi
mov ah, 09h
int 21h

CALL ChieuDaiChuoi

;exit 
mov ah, 4ch
int 21h

ChieuDaiChuoi PROC
    xor ax, ax
    mov al, str+1  
    mov cx, 0
    mov bx, 10
    LapDem1:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jnz LapDem1
    
    ;xuat chieu dai chuoi
    mov ah, 2
    LapDem2:
    pop dx
    or dl, '0' ;chuyen chu so thanh so
    int 21h
    loop LapDem2
    
    ChieuDaiChuoi ENDP  
END BEGIN

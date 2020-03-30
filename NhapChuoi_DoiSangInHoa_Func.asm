.model small
.stack 100h
.data
nhap db "nhap chuoi: $"
chuoi_thuong db 10, 13, "chuoi thuong: $"
chuoi_hoa db 10, 13, "chuoi in: $"
str db 100,?, 101 dup('$')
.code
BEGIN:
mov ax, @data
mov ds, ax

;thong bao nhap chuoi
lea dx, nhap
mov ah, 09h
int 21h

;nhap chuoi 
mov ah, 0ah
lea dx, str
int 21h

;in ra chuoi thuong
lea dx, chuoi_thuong
mov ah, 09h
int 21h
;;chuong trinh con in chuoi thuong
CALL InChuoiThuong

;in ra chuoi hoa
lea dx, chuoi_hoa  
mov ah, 09h
int 21h
;; chuong trinh con in chuoi hoa
CALL InChuoiHoa

;exit
mov ah, 4ch
int 21h

;****************************
;doi thanh chuoi ki tu thuong
InChuoiThuong PROC
    lea si, str+1
    xor cx,cx
    mov cl, [si]
    inc si
    LapThuong:
    mov ah, 02h
    mov dl,[si]
    cmp dl, 'A'
    jb LT1
    cmp dl, 'Z'
    ja LT1
    add dl, 32
    LT1: inc si
    int 21h
    loop LapThuong
    ret
    InChuoiThuong ENDP

;doi thanh chuoi ki tu hoa   
InChuoiHoa PROC
    lea si, str+1
    xor cx, cx
    mov cl, [si]
    inc si
    LapHoa:
    mov ah, 02h
    mov dl, [si]
    cmp dl, 'a'
    jb LH1
    cmp dl, 'z'
    ja LH1
    sub dl, 32
    LH1: inc si
    int 21h
    loop LapHoa
    ret
    InChuoiHoa ENDP
END BEGIN
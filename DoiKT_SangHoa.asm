.model small
.stack 100h
.data

nhapKT db "nhap ki tu: $"
KTHoa db 0dh, 0ah, "ki tu hoa: $"
KiTu db ?

.code
mov ax, @data
mov ds, ax

;nhap ki tu
lea dx, nhapKT
mov ah, 9
int 21h

mov ah, 1
int 21h
mov KiTu, al

;xuat ki tu hoa
lea dx, KTHoa
mov ah, 9
int 21h

mov ah, 2
mov dl, KiTu
sub dl, 32
int 21h

mov ah, 4ch
int 21h
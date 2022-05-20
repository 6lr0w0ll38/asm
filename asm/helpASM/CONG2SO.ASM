Title Cong hai so cho truoc
.model small
.stack 100h
.data
    A DB 030H, 0A7H
    B DB 048H, 065H
    C DW 0

.code
 C2SO:
    mov ax,@data
    mov ds,ax  ; ds = segment(data)

    ; Cong 2 so

    mov al,A
    add al,b
    mov ah,0
    mov c,ax

    mov al,A[1]
    add al,B[1]
    mov ah,0
    adc ah,0
    mov c[3],ax

    mov ah,4ch
    int 21h

end C2So
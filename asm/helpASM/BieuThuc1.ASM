TITLE BieuThuc.ASM
.MODEL small
.STACK 100
.DATA
   
    MSG1  DB 'Vao SO THU NHAT tu ban phim : $'
    MSG2  DB 'Vao SO THU HAI  tu ban phim : $'
    num1  DB ?  
    num2  DB ?      
    
    

.CODE
 Vd5:   
    mov ax,@data
    mov ds,ax
; nap offset MSG1 vao dx
    lea dx,MSG1

; hien thi MSG1
    mov ah,9
    int 21h



; doc vao 1 ki tu tu ban phim, ki tu doc vao nam trong al

    mov ah,1
    int 21h 
        mov num1,al


;XUONG DONG VE DAU DONG
    mov ah,2
    mov dl,0Dh
    int 21h
    MOV DL,0AH
    int 21h

; nap offset MSG2 vao dx
    lea dx,MSG2

; hien thi MSG2
    mov ah,9
    int 21h



; doc vao 1 ki tu tu ban phim, ki tu doc vao nam trong al

    mov ah,1
    int 21h 
        mov num2,al



        
; Tinh tong hai so vua nhap vao, chinh thap phan ma ascii
    mov al,num1
    add al,num2
    aaa
    
    mov num2+1,AH

    mov num2+2,AL

; Dua ket qua ra man hinh
    add ah,30h
    mov dl,ah

    mov ah,2
    int 21h

    
    mov AL,num2+2
    ADD AL,30H
    MOV DL,AL

    mov ah,2
    int 21h

    
 ;Ve Dos
    mov ah,4ch
        int 21h     
    
 END vd5
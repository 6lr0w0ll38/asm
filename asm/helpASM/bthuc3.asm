TITLE Bthuc3.ASM
.MODEL small
.STACK 100
.DATA
   
    MSG1  DB 'Vao 1 Bieu thuc (VD: 3 x 9 =) tu ban phim : $' 

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


;Hien thi mot dau trong len man hinh
    mov ah,2
    mov dl,' '
    int 21h
    

    ;Hien thi mot dau x len man hinh
    ;mov ah,2
    mov dl,'x'
    int 21h
    
;Hien thi mot dau trong len man hinh
    mov ah,2
    mov dl,' '
    int 21h
    
; doc vao 1 ki tu tu ban phim, ki tu doc vao nam trong al

    mov ah,1
    int 21h 
    mov num2,al
              
;Hien thi mot dau trong len man hinh
    mov ah,2
    mov dl,20h
    int 21h
    

;Hien thi mot dau = len man hinh
    mov ah,2
    mov dl,'='
    int 21h

;Hien thi mot dau trong len man hinh
    mov ah,2
    mov dl,' '
    int 21h
        
    ; Tinh tich hai so vua nhap vao, chinh thap phan sau khi nhan
    mov al,num1
    sub al,30h
    mov bl,num2
    sub bl,30h
    mul bl
    aam
    
    ;mov num2+1,AH

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
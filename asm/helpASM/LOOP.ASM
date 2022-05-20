TITLE LOOP.ASM
.MODEL small
.STACK 100

.CODE
 Vd3:   
 mov cx,9
 v_lap:
    mov dl,30h
    add dl,cl
    
 ;hien thi 1 ki tu nam trong dl
    mov ah,2
    int 21h

;xuong dong
    mov ah,2
    mov dl,0ah
    INT 21h
 

;Ve dau dong
    mov ah,2
    mov dl,0dh
    int 21h
 
loop v_lap ; cx=cx-1, -> v_lap cho den khi cx=0
 ;Ve Dos
    mov ah,4ch
    int 21h     
    
 END vd3
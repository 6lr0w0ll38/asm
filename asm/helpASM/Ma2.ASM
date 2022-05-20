TITLE Ma2.ASM
.MODEL small
.STACK 100
.DATA
   
    MSG1  DB 'Vao 1 Ki tu tu ban phim : $'
    MSG2  DB '  --->  $'
   
    keyb  DB ?      
      
    

.CODE
 Vd4:   
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
    mov keyb,al


;ve dau dong va xuong dong
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h


 ; Hien thi ki tu vua nhap vao

    mov dl,keyb
    mov ah,2
    int 21h
; Hien thi dau  ---->
    lea dx,MSG2
    mov ah,9
    int 21h

; Hien thi gia tri nhi phan cua ki tu nhap vao
    mov bl,keyb
    mov cx,8
 v_lap: 
    
    rcl bl,1
    jc  so1
    
    mov dl,'0'
    jmp hienthi

    So1:mov dl,'1'
    ;inc Dem1
    
Hienthi:mov ah,2   ; Hien thi so 0 hay 1 
    int 21h       
    loop v_lap ; cx=cx-1, -> v_lap neu cx<>0 
    
 ;Ve Dos
    mov ah,4ch
        int 21h     
    
 END vd4
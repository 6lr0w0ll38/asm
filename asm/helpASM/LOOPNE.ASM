TITLE LOOPNE.ASM
.MODEL small
.STACK 100
.DATA
    ASCII DB '0123456789'
    MSG1  DB 'Vao 1 so 0 -> 9 : $'
    MSG2  DB 'Ban vao so : $'
    MSG3  DB 'Ban da vao ki tu:  $'
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


        
    lea si,ASCII
    mov cx,11
    
 v_lap: 
    mov bl,[si]
    
    inc si
    cmp keyb,bl ; Tim xem ki tu nhap vao co phai la so tu 1->9 khong?        
loopne v_lap ; cx=cx-1, -> v_lap neu cx<>0 va ZF=0
    
    
    cmp cx,0
    je  khongso

; ra thong bao ban da vao 1 so tu 1->9


    lea dx,MSG2
    mov ah,9
    int 21h
    
    jmp ketthuc

; ra thong bao ban da vao 1 ki tu khac so
 
khongso:
    lea dx,MSG3
    mov ah,9
    int 21h
    
 ;Hien thi ky tu nhap va ve Dos
 ketthuc:
    mov dl,keyb
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h     
    
 END vd4
TITLE BieuThuc.ASM
.MODEL small
.STACK 100h
.DATA
   
    M     DB 3H, 0fcH 
    MSG2  DB 'Vao SO THU HAI  tu ban phim : $'
    MSG3  DB 'Tong So : $'
    num1  DB ?	
    num2  DB ?		
	
	

.CODE
 Vd5:   
	mov ax,@data
	mov ds,ax
; Tinh tong hai so vua nhap vao, chinh thap phan ma ascii

	mov al,m
	mov bl,m+1;
	add al,bl;	
 ;Ve Dos
 	mov ah,4ch
        int 21h     
	
 END vd5
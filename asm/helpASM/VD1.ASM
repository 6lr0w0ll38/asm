.model small
.stack 100H

.data
     a dw 1
     b dw 2
     c dw 0


.code

start:

     mov ax,@data
     mov ds,ax

    
     lea si,a
     lea di,b
     lea bx,c
 
     ;mov al,a
     ;add al,b
     ;mov c,al

     mov ah,4ch
     int 21h

     end start


.model small
.stack 100h
.DATA 
     a db 79H, 27H, 91H
     Muiten db "  --->  $"



.code      
start:

     mov ax,@data
     mov ds,ax

; Mang co 3 so hexa decimal 
     mov cx,3
     lea si,a	; si cho den dia chi dau tien cua mang

 vLap1:
     mov bl,[si]
     mov bh,bl
     mov di,cx	; di luu gia tri cua cx

; Xuat so co 2 chu so

     mov cx,4
     shr bl,cl

; Xuat chu so hecxa decimal dau tien	
     add bl,30h
     mov dl,bl
     mov ah,2
     int 21h

; Xuat chu so hecxa decimal thu hai
     mov bl,bh
     and bl,0fh
     add bl,30h
     mov dl,bl
     mov ah,2	
     int 21h

; Xuat mui ten 
     lea dx,MuiTen
     mov ah,9
     int 21h

; Xuat ma nhi phan cua so hecxa decimal
     mov cx,8
     mov bl,bh

 Vlap2:
     rcl bl,1
     
     jnc zero
     
     mov dl,31h
     jmp print

 zero:mov dl,30h
print:mov ah,2
     int 21h

     
     loop vlap2

     mov dl,0ah
     int 21h
     mov dl,0dh
     int 21h

; Xuat so tiep theo

     mov cx,di
     inc si
     loop vlap1


     mov ah,4ch
     int 21h

     end start



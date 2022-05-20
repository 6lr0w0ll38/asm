
.MODEL small
.STACK 100
.DATA 
    A DB 16, 41, 197, 88
    B DB 34, 37, 125, 93
   
.CODE
 
start: 
   mov ax, @data
   mov ds, ax
   
   mov es,5000H
   mov di,100H
   
   lea si, A
   mov cx,4
   
   
TinhTong:
   mov ax,0
   add al, A[si]
   JP xuly
   jmp tieptuc

xuly:
   mov bx,ax
   mov ax,0
   add al,B[si]
   JNP xuly1
   jmp tieptuc
   
xuly1:   
   add ax,bx
   mov [es:di], ax

tieptuc:   
   inc si 
   add di,2
   loop TinhTong  

   
 ;Ve Dos
   mov ah,4ch
   int 21h     
    
END start
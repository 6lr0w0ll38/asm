
.MODEL small
.STACK 100
.DATA 
    A DB 160, 210,89, 171
    Tong DW 0 
.CODE
 
start: 
   mov ax, @data
   mov ds, ax
   
   lea si, A
   mov cx,4
   
   mov ax, 0

 TinhTong:
   add al, A[si]
   adc ah,0
   inc si
   loop TinhTong  
   mov Tong, ax
   
 ;Ve Dos
   mov ah,4ch
   int 21h     
    
END start
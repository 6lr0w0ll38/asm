.model small
.stack 100H

.data
     a db 1
     b db 2
     c db 0
extrn ctc:far

.code

start:

     mov ax,@data
     mov ds,ax

     mov al,a
     add al,b
     mov c,al

    

     end start


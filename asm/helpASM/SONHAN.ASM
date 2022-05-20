;Title NHAN 3 SO
.MODEL SMALL
.STACK 100

     const1 equ 10
DATA SEGMENT
     const2 equ 12
     A DB 6CH
     B DW 0A1B9H
     C DB 0D7H
     Z DW 2 DUP (0)

DATA ENDS

CODE SEGMENT

     ASSUME CS:CODE, DS:DATA
START:     MOV AX,DATA
     MOV DS,AX

     MOV AL,A
     add al,Const1
     add al,const2
     MOV Z+2,DX
     MOV Z,AX

     MOV AH,4CH
     INT 21H
CODE ENDS
     END START
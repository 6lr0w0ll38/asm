TITLE HELLO
.MODEL  SMALL
.STACK  100H
.DATA   
 MSG    DB  "HELLO!$"
 Luyen  DB  "Le Van Luyen la thang Luyen"
 n      equ  $ - Luyen
.CODE
 Start:
 ; Nap dia chi segment cua DATA vao DS
    MOV AX,@DATA
    MOV DS,AX


 ; Hien Thi Chuoi Luyen
    LEA     SI,lUYEN
   
    MOV     CX,N

    MOV AX,3000H
    MOV ES, AX
    MOV DI, 100H
 REP MOVSB

    ;MOV     AH,9
    ;INT     21H
 ; Tro ve DOS
    MOV AH,4CH
    INT 21H
 END Start
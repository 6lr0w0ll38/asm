TITLE HELLO
.MODEL  SMALL
.STACK  100
.DATA   
 MSG    DB  "HELLO!$"
 Luyen  DB  "Le Van Luyen la thang Luyen$"
.CODE
 Start:
 ; Nap dia chi segment cua DATA vao DS
    MOV AX,@DATA
    MOV DS,AX
 ; Nap Offset cua MSG vao DX
    LEA DX,MSG
 ; Hien thi chuoi MSG
    MOV AH,9
    INT 21H

 ; Hien Thi Chuoi Luyen
    LEA     DX,lUYEN
    MOV     AH,9
    INT     21H
 ; Tro ve DOS
    MOV AH,4CH
    INT 21H
 END Start
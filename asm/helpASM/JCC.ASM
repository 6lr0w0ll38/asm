TITLE JCC
.MODEL  SMALL
.STACK  100
.DATA   
 MSG1   DB  "A>B$"
 MSG2   DB  "A=B$"
 MSG3   DB  "A<B$"
 MSG4   DB  "Nap Gia Tri Vao AX Va BX$"

.CODE
 Start:
 ; Nap dia chi segment cua DATA vao DS
    MOV AX,@DATA
    MOV DS,AX
        

 ; Nap Offset cua MSG4 vao DX
    LEA DX,MSG4
 ; Hien thi chuoi
    MOV AH,9
    INT 21H

    CMP AX,BX
    JA  above
    JE  equal
 ; Nap Offset cua MSG3 vao DX
    LEA DX,MSG3
 ; Hien thi chuoi
    MOV AH,9
    INT 21H
    JMP     done
  above:
 ; Nap Offset cua MSG1 vao DX
    LEA DX,MSG1
 ; Hien thi chuoi
    MOV AH,9
    INT 21H
    JMP     done

 equal: 
 ; Nap Offset cua MSG2 vao DX
    LEA DX,MSG2
 ; Hien thi chuoi
    MOV AH,9
    INT 21H
    

 ; Tro ve DOS
  done: MOV AH,4CH
    INT 21H
 END Start
TITLE max.asm
.MODEL  SMALL
.STACK  100
.DATA   
 A   DB  66H, 78H, 56H, 79H, 30H, 79H, 79H, 60H
 MAX DB ?
 PT  DB ?
 
.CODE
 Start:
 ; Nap dia chi segment cua DATA vao DS
    MOV AX,@DATA
    MOV DS,AX
  ; TIM MAX
  
  MOV SI, 0
  MOV CX, 8
  MOV AL, A[SI]
  INC SI
  LAP:
     CMP AL, A[SI]
     JAE NEXT
     MOV AL, A[SI]
     NEXT:
     INC SI
     LOOP LAP
     MOV MAX, AL
  
     
     ; Tim phan tu dau tien cua mang = max  
    MOV DL,0 
    MOV CX, 8
    MOV SI, 0
    NEXT1:
      MOV AL, A[SI]
      INC SI
      INC DL
      CMP AL, MAX
      LOOPNE NEXT1
      DEC DL
      MOV PT, DL
     
      
     MOV AH,4CH
     INT 21H
 END Start
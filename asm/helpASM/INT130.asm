

PUBLIC TINH_TICH_FAR

DATA SEGMENT WORD PUBLIC
    EXTRN NUM1:BYTE, NUM2:BYTE, TICH:BYTE
DATA ENDS 

INT_PROC SEGMENT PUBLIC
    TINH_TICH_FAR PROC FAR
    ASSUME CS:INT_PROC;, DS:DATA
    ;MOV AX,DATA        
    ;MOV DS,AX
        MOV AX, 0      
        MOV BX, 0
        MOV AL, NUM1 
        SHL AL, 4
        SHR AL, 4   
        MOV NUM1, AL
        MOV BL, NUM2   
        SHL BL, 4
        SHR BL, 4 
        MOV NUM2, BL
        MUL BL 
        MOV TICH, AL
        
        IRET                ;Tro ve chuong trinh goi
    TINH_TICH_FAR  ENDP
INT_PROC ENDS
         END
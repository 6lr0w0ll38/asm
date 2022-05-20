;NHAP SO 5
;NHAP SO 6
;HIEN THI 30


.MODEL large

DATA SEGMENT
    MSG1 DB 0DH,0AH,"Nhap so thu nhat: $"
    MSG2 DB 0DH,0AH,"Nhap so thu hai: $"
    MSG3 DB 0DH,0AH,"Ket qua: $"
    NUM1 DB 5
    NUM2 DB 6
    TICH DB ?
DATA ENDS

STACK_SEG SEGMENT STACK
    DW 100 DUP(0) ;100 tu danh cho stack
    TOP_STACK LABEL WORD
STACK_SEG ENDS

PUBLIC NUM1, NUM2, TICH

INT_PROC SEGMENT WORD PUBLIC
    EXTRN TINH_TICH_FAR:FAR
INT_PROC ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
START: 
    MOV AX,DATA ;Khoi tao segment cho thanh ghi
    MOV DS,AX ;doan du lieu DS
    MOV AX,STACK_SEG ;Khoi tao thanh ghi SS
    MOV SS,AX
    MOV SP, OFFSET TOP_STACK ;Khoi tao SP
    
    MOV AX,0
    MOV ES,AX
    MOV WORD PTR ES:522, SEG TINH_TICH_FAR ;OR TINH_TICH
    MOV WORD PTR ES:520, OFFSET TINH_TICH_FAR ;OR TINH_TICH
              
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    MOV AH,1
    INT 21h 
    MOV NUM1,AL
       
    LEA DX, MSG2
    MOV AH, 9
    INT 21H  
    
    MOV AH,1
    INT 21h 
    MOV NUM2,AL 
    
    INT 130
    
    LEA DX, MSG3
    MOV AH, 9
    INT 21H  
    CALL HIEN_THI
    
      
    ;Tro ve DOS
    MOV AH,4CH
    INT 21H

TINH_TICH PROC NEAR
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
    RET
TINH_TICH ENDP    

    
HIEN_THI PROC NEAR
    XOR AX,AX
    MOV AL, TICH   
    CALL CHUYEN_DOI ; HIEN THI ARRAY
    RET
HIEN_THI ENDP
    
CHUYEN_DOI PROC NEAR
    PUSH CX
    XOR CX,CX ; XOA CX DE TI NUA TANG CX DE LAP CAC SO TRONG STACK (IN RA 2,3,4 SO)
    
    MOV BX,10 ; CHIA CHO A DE RA HE SO 10
@CHUYEN_DOI_10:
    XOR DX,DX ; BAT BUOC PHAI LAM SACH DX, VI DX = MSG1, HOAC NHUNG THU LINH TINH
    
    DIV BX ; AX/BX => SO DU = DX ; KET QUA CHIA = AX
    PUSH DX ; SO DU VAO STACK
    INC CX ; SET ZF = 0
    OR AX,AX ; KHI AX = 0 THI ZF = 0 ( AX =1,2,3,4 THI ZF = 1 ) van con so thuong thi lap tiep
    ; VD: 55/10 AX = 5 DX = 5 thi show DX lay AX chia tiep cho 10, show AX => 55
    
    JNE @CHUYEN_DOI_10 ; jump to label @CHUYEN_DOI_10 if ZF=0
    @IN_RA:
    MOV AH,2 ; IN RA 1 CON SO DL
    POP DX
    OR DL, 30H
    INT 21H
    LOOP @IN_RA
    POP CX
    RET
CHUYEN_DOI ENDP

    CODE ENDS
END START
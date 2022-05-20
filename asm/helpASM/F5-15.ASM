;8086 PROGRAM F5-15.ASM
;chuong trinh chuyen doi so BCD thanh so nhi phan
;trong chuong trinh co su dung chuong trinh con chuyen doi so BCD thanh so nhi phan
;chuong trinh su dung cac thanh ghi SI, DI de truyen tham so cho chuong trinh con
;REGISTERS : Uses CS, DS,SS, SP,AX, SI, DI
;PORTS  : Khong su dung
;PROCEDURES: BCD_BIN




.MODEL SMALL

DATA        SEGMENT
        BCD_INPUT   DB  17H,18H,19H,20H, 21H, 27H
    ;Luu gia tri BCD
        BIN_VALUE   DB  6 DUP(0) ;Luu gia tri nhi phan
DATA        ENDS

STACK_SEG   SEGMENT     STACK
                DW 100 DUP(0)   ;100 tu danh cho stack
        TOP_STACK   LABEL   WORD
STACK_SEG   ENDS

CODE        SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
START:      MOV AX,DATA         ;Khoi tao segment cho thanh ghi
        MOV DS,AX               ;doan du lieu DS
        MOV AX,STACK_SEG        ;Khoi tao thanh ghi SS
        MOV SS,AX
        MOV SP, OFFSET TOP_STACK    ;Khoi tao SP

        MOV SI, OFFSET BCD_INPUT
        MOV DI, OFFSET BIN_VALUE  
        
        MOV CX,6
    Chuyen: CALL BCD_BIN
        INC SI
        INC DI
        LOOPNE Chuyen
        

;Tro ve DOS
        MOV AH,4CH
        INT 21H

;PROCEDURE: BCD_BIN - Chuyen so BCD thanh nhi phan
;INPUT:     AL chua so BCD can chuyen doi
;OUTPUT:    AL chua gia tri nhi phan 
;DESTROYS:  AX  

BCD_BIN     PROC    NEAR
        PUSHF               ;Luu thanh ghi co vao stack
        PUSH AX             ;va cac thanh ghi duoc su dung trong thu tuc
        PUSH BX
        PUSH CX
 
        
;Thuc hien chuyen doi
        MOV AL,[SI]
        MOV BL,AL           ;COPY so BCD vao BL
        AND BL,0FH          ;Che 4 bit cao, (lay 4 bit thap)
        AND AL,0F0H         ;Che 4 bit thap (lay 4 bit cao)
        MOV CL,04           ;Chuyen so BCD cao thanh thap
        ROR AL,CL           ;de nhan
        MOV BH,0AH          ;Nap he so chuyen doi vao BH
        MUL BH              ;Nhan so BCD cao trong AL voi 0AH trong BH
                        ;luu ket qua vao AL
        ADD AL,BL           ;Cong so BCD thap voi ket qua MUL trong AL
        MOV [DI],AL 
;Ket thuc chuyen doi, ket qua so nhi phan nam trong [DI] cho
      
        POP CX
        POP BX
        POP AX
        POPF
        RET             ;Tro ve chuong trinh goi
BCD_BIN     ENDP

CODE        ENDS
        END START


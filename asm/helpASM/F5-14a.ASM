;8086 PROGRAM F5-14a-ASM
;chuong trinh chuyen doi so BCD thanh so nhi phan
;trong chuong trinh co su dung chuong trinh con chuyen doi so BCD thanh so nhi phan
;chuong trinh su dung 2 o nho de truyen tham so cho chuong trinh con
;REGISTERS : Uses CS, DS,SS, SP,AX
;PORTS  : Khong su dung
;PROCEDURES: BCD_BIN




.MODEL SMALL


DATA        SEGMENT
                BCD_INPUT   DB  17H     ;Luu gia tri BCD
                BIN_VALUE   DB  ?       ;Luu gia tri nhi phan
DATA        ENDS

STACK_SEG   SEGMENT     STACK
     DW 5 DUP(0)   ;5 tu danh cho stack
     TOP_STACK   LABEL   WORD
STACK_SEG   ENDS

CODE        SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
START:      MOV AX,DATA         ;Khoi tao segment cho thanh ghi
        MOV DS,AX           ;doan du lieu DS
        MOV AX,STACK_SEG        ;Khoi tao thanh ghi SS
        MOV SS,AX
        MOV SP, OFFSET TOP_STACK    ;Khoi tao SP
        mov bx,1298H
        mov cx,3476H


        CALL BCD_BIN
        

;Tro ve DOS
        MOV AH,4CH
        INT 21H

;PROCEDURE: BCD_BIN - Chuyen so BCD thanh nhi phan
;INPUT:     AL chua so BCD can chuye doi
;OUTPUT:    AL chua gia tri nhi phan 
;DESTROYS:  AX  




BCD_BIN     PROC    near
        PUSHF           ;Luu thanh ghi co vao stack
        PUSH BX         ;va cac thanh ghi duoc su dung trong thu tuc
        PUSH CX

        ;Thuc hien chuyen doi
        mov AL,BCD_INPUT
        MOV BL,AL           ;COPY so BCD vao BL
        AND BL,0FH          ;Che 4 bit cao, (lay 4 bit thap)
        AND AL,0F0H         ;Che 4 bit thap (lay 4 bit cao)
        MOV CL,04           ;Chuyen so BCD cao thanh thap
        ROR AL,CL           ;de nhan
        MOV BH,0AH          ;Nap he so chuyen doi vao BH
        MUL BH              ;Nhan so BCD cao trong AL voi 0AH trong BH
                        ;luu ket qua vao AL
        ADD AL,BL
        MOV BIN_VALUE,AL

        POP bX          ;Khoi phuc cac thanh ghi
        POP cX
        POPF
        RET         ;Tro ve chuong trinh goi
BCD_BIN     ENDP

CODE        ENDS
        END START


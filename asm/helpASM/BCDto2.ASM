;8086 PROGRAM BCDTO2.asm
;chuong trinh chuyen doi so BCD thanh so nhi phan
;trong chuong trinh co su dung chuong trinh con chuyen doi so BCD thanh so nhi phan
;chuong trinh su dung thanh ghi AL de truyen tham so cho chuong trinh con
;REGISTERS : Uses CS, DS,SS, SP,AX
;PORTS  : Khong su dung
;INT 100: BCD_BIN




.MODEL large

DATA   SEGMENT public
          BCD_INPUT   DB  17H     ;Luu gia tri BCD
          BIN_VALUE   DB  ?       ;Luu gia tri nhi phan
DATA   ENDS

STACK_ SEGMENT STACK
          DW 100 DUP(0)   ;100aS tu danh cho stack
          TOP_STACK   LABEL   WORD
STACK_ ENDS

    ;Int_Proc Segment Public
        EXTRN BCD_BIN:FAR
    ;Int_Proc Ends

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK_
START:  MOV AX,DATA         ;Khoi tao segment cho thanh ghi
        MOV DS,AX           ;doan du lieu DS
        MOV AX,STACK_        ;Khoi tao thanh ghi SS
        MOV SS,AX
        MOV SP, OFFSET TOP_STACK    ;Khoi tao SP

        MOV AX,0
        MOV ES,AX
        MOV WORD PTR ES:402, SEG BCD_BIN
        MOV WORD PTR ES:400, OFFSET BCD_BIN


        MOV AL,BCD_INPUT        
        INT 100
        MOV BIN_VALUE,AL

        ;Tro ve DOS
        MOV AH,4CH
        INT 21H
CODE ENDS
     END START
        



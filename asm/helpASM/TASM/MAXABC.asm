;8086 PROGRAM BCDTO2.asm
;chuong trinh chuyen doi so BCD thanh so nhi phan
;trong chuong trinh co su dung chuong trinh con chuyen doi so BCD thanh so nhi phan
;chuong trinh su dung thanh ghi AL de truyen tham so cho chuong trinh con
;REGISTERS : Uses CS, DS,SS, SP,AX
;PORTS  : Khong su dung
;INT 100: BCD_BIN




.MODEL large

DATA   SEGMENT public
            A   DB  10H, 20H, 5, 8
            B   DB  22H, 12H, 21H, 6
            C   DB  11H, 10H, 33H, 43H
            n   EQU C - $
            MAXA DB ?
            MAXB DB ?
            MAXC DB ?
DATA   ENDS

STACK_ SEGMENT STACK
          DW 100 DUP(0)   ;100aS tu danh cho stack
          TOP_STACK   LABEL   WORD
STACK_ ENDS

    ;Int_Proc Segment Public
        EXTRN MAX:FAR
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
        MOV WORD PTR ES:502, SEG MAX
        MOV WORD PTR ES:500, OFFSET MAX

        MOV CL, n ; Mang co n phan tu
        ; MAX MANG A
        LEA SI, A       
        INT 125
        MOV MAXA,AL

        ;Tro ve DOS
        MOV AH,4CH
        INT 21H
CODE ENDS
     END START
        



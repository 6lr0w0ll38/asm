;8086 PROGRAM HoanDoi.asm

;REGISTERS : Uses CS, DS,SS, SP,AX
;PORTS  : Khong su dung
;INT 120: SWAP




.MODEL large

DATA   SEGMENT
            A   DB  36H, 74H, 35H, 89H, 67H, 83H     
            n   EQU $ - A
DATA   ENDS

STACK_ SEGMENT STACK
    DW 100 DUP(0)   ;100 byte tu danh cho stack
          TOP_STACK   LABEL   WORD
STACK_ ENDS

    
        EXTRN SWAP:FAR
   
CODE SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK_
START:  MOV AX,DATA         ;Khoi tao segment cho thanh ghi
        MOV DS,AX           ;doan du lieu DS
        MOV AX,STACK_        ;Khoi tao thanh ghi SS
        MOV SS,AX
        MOV SP, OFFSET TOP_STACK    ;Khoi tao SP

        MOV AX,0
        MOV ES,AX
        MOV WORD PTR ES:482, SEG SWAP
        MOV WORD PTR ES:480, OFFSET SWAP

        MOV CX, n
        LEA SI, A
        LAP:
            MOV AL, [SI]
            MOV BL, AL
            ;MOV AH, 0
            ;MOV BH, 2
            ;DIV BH
            AND AL,01H
            CMP AL, 0
            JE  NEXT     
            INT 120
            MOV [SI],AL
            NEXT:
            INC SI
            LOOP LAP

        ;Tro ve DOS
        MOV AH,4CH
        INT 21H
CODE ENDS
     END START
        



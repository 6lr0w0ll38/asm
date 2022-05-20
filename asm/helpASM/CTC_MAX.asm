;8086 PROGRAM CTC_MAX.ASM
; Chuong trinh tim MAX cua 3 Mang A, B, C
; su dung thanh ghi de truyen tham so
;REGISTERS : Uses CS, DS,SS, SP,AX
;PORTS  : Khong su dung
;PROCEDURES: TIM_MAX



.MODEL SMALL

DATA        SEGMENT
                A   DW  66H, 3478H, 56H, 79H, 30H, 79H, 79H, 60H
                B   DW  26H, 58H, 1236H, 59H, 10H, 59H, 69H, 40H
                C   DW  96H, 108H, 4356H, 479H, 330H, 679H, 379H, 660H
                n   EQU ($ - C)/2 - 1; n -1 phan tu, vi duyet tu phan tu thu 2
            
                MAXA DW "AG"
                MAXB DW "OB"
                MAXC DW "EB"
DATA        ENDS

STACK_SEG   SEGMENT     STACK
                DW 100 DUP(0)   ;100 tu danh cho stack
                TOP_STACK   LABEL   WORD
STACK_SEG   ENDS

CODE        SEGMENT
                ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
START:          MOV AX,DATA         ;Khoi tao segment cho thanh ghi
                MOV DS,AX           ;doan du lieu DS
                MOV AX,STACK_SEG        ;Khoi tao thanh ghi SS
                MOV SS,AX
                MOV SP, OFFSET TOP_STACK    ;Khoi tao SP


                ;Tim Max Mang A
                LEA SI, A
                MOV AX, A[0]; Nap gia tri dau mang A vao AX
                
                MOV CX, n
                
          MAX_A:  ADD SI, 2; 
                CALL TIM_MAX
                LOOP MAX_A
                MOV MAXA, AX
                
                
                ;Tim Max Mang B
                LEA SI, B
                MOV AX, B[0]; Nap gia tri dau mang B vao AX
                
                MOV CX, n
                
         MAX_B:  ADD SI, 2; 
                CALL TIM_MAX
                LOOP MAX_B
                MOV MAXB, AX
                
                ;Tim Max Mang C
                LEA SI, C
                MOV AX, C[0]; Nap gia tri dau mang B vao AX
                
                MOV CX, n
                
        MAX_C:  ADD SI, 2; 
                CALL TIM_MAX
                LOOP MAX_C
                MOV MAXC, AX

;Tro ve DOS
        MOV AH,4CH
        INT 21H

;PROCEDURE: TIM_MAX
;INPUT:     AX = [SI]
;OUTPUT:    AX = MAX
;DESTROYS:  AX  




TIM_MAX     PROC    NEAR
            PUSHF               ;Luu thanh ghi co vao stack
            CMP AX, [SI]
            JAE NEXT
            MOV AX, [SI]        
NEXT:       POPF
            RET             ;Tro ve chuong trinh goi
TIM_MAX     ENDP

CODE        ENDS
        END START


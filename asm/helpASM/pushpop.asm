;8086 PROGRAM Push_Pop.ASM


.MODEL SMALL

DATA		SEGMENT
		BCD_INPUT	DB  17H,18H,19H,20H
	;Luu gia tri BCD
		BIN_VALUE	DB  4 DUP(0) ;Luu gia tri nhi phan
DATA		ENDS

STACK_SEG	SEGMENT		STACK
				DW 100 DUP(0)	;100 tu danh cho stack
		TOP_STACK	LABEL	WORD
STACK_SEG	ENDS

CODE		SEGMENT
		ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
START:		MOV AX,DATA			;Khoi tao segment cho thanh ghi
		MOV DS,AX			;doan du lieu DS
		MOV AX,STACK_SEG		;Khoi tao thanh ghi SS
		MOV SS,AX
		MOV SP, OFFSET TOP_STACK	;Khoi tao SP

                MOV AX,1234H
                MOV BX,5678H
		MOV CX,0ABCDH
		
		
		CALL Push_Pop
		

;Tro ve DOS
		MOV AH,4CH
		INT 21H

;PROCEDURE:	Push_Pop

Push_Pop	PROC	NEAR
		PUSHF		;Luu thanh ghi co vao stack
		PUSH AX
		PUSH BX		;va cac thanh ghi duoc su dung trong thu tuc
		PUSH CX
;Thay doi gia tri trong cac thanh ghi
		
		MOV AX,3E4FH
		MOV BX,2208H
		MOV CX,1199H
		CMP cX,AX

;Khoi phuc cac thanh ghi

		POP CX	
		POP BX
		POP AX
		POPF
		RET		;Tro ve chuong trinh goi
Push_Pop	ENDP

CODE		ENDS
		END	START


		; 8086 PROGRAM F3-14.ASM
;ABSTRACT: Chuong trình này nhân 2 ô nh? 16 bít MULTIPLICANT và
;		    MULTIPLIER, k?t qu? du?c c?t trong ô nh? PRODUCT
;REGISTERS: CS,  DS,  AX,  DX
;PORTS: Không s? d?ng

.MODEL SMALL
.STACK 100
DATA_HERE		SEGMENT
			MULTIPLICANT	DW 	204aH		; T? d?u ? dây
			MULTIPLIER	DW	3b2aH		; T? th? 2 ? dây
			PRODUCT		DW 2 DUP(0)		; K?t qu? phép nhân
DATA_HERE		ENDS

CODE_HERE		SEGMENT
			ASSUME  	CS:CODE_HERE,  DS:DATA_HERE
START:			MOV	AX,  DATA_HERE		; Kh?i d?u thanh ghi DS
			MOV   	Ds,  AX
			MOV	AX,  MULTIPLICANT	; N?p t? th? nh?t
			MUL	MULTIPLIER		; Nhân v?i t? th? 2
			MOV 	PRODUCT,  AX		; Luu t? th?p c?a k?t qu?
			MOV  	PRODUCT+2, DX		; Luu t? cao c?a k?t qu?
			MOV  	AH,  4CH		; K?t thúc
			INT 	21H
CODE_HERE		ENDS
			END START

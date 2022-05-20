;Sap xep

.MODEL SMALL

DATA        SEGMENT
    ; Mang A co 3 phan tu 9, 1, 3
    ; nA: So phan tu cua mang A (2 bytes)
    ; KA = FAH - Diem ket thuc mang A + 2 bytes nA
    A   DB  9, 1, 3
    nA  DW $ - A
    KA  DB 0FAH
    
    ; Mang B co 5 phan tu 6, 8, 5, 4, 1
    ; nB: So phan tu cua mang B (2 bytes)
    ; KB = FBH - Diem ket thuc mang B+ 2 bytes nB
    B   DB 6, 8, 5, 4, 1
    nB  DW $ - B
    KB  DB 0FBH
 
   
    ; Mang C co 6 phan tu 16H, 28H, 5H, 14H, 1H, 9H
    ; nC: So phan tu cua mang B (2 bytes)
    ; KB = FBH - Diem ket thuc mang B
    C   DB 16H, 28H, 5H, 14H, 1H, 9H
    nC  DW $ - C
    KC  DB 0FCH ; KC = FCH  Diem ket thuc mang C + 2 bytes nC  
    
    ; n1: Dia chi cuoi cua mang can sap xep (Vi du: A)
    ; n1 = Dia chi dau mang (A) + nA -1 (-1 xuat phat tu 0) 
    n1  dw 0    
    ; n2 = n1 -1; khoa sap xep = sophan tu mang - 1
    n2  dw 0
    ; Chu y: khi sap xep mang cac bien nA, nB, nC khong duoc sap xep   
DATA        ENDS

STACK_SEG   SEGMENT     STACK
                DW 100 DUP(0)   ;100 tu danh cho stack
        TOP_STACK   LABEL   WORD
STACK_SEG   ENDS

CODE        SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
START:  MOV AX,DATA         ;Khoi tao segment cho thanh ghi
        MOV DS,AX           ;doan du lieu DS
        MOV AX,STACK_SEG        ;Khoi tao thanh ghi SS
        MOV SS,AX
        MOV SP, OFFSET TOP_STACK    ;Khoi tao SP
  
        ; Sap xep mang A
        LEA AX, A
        ADD AX, nA
        DEC AX
        mov n1,ax
        dec AX
        mov n2,ax
        
        ; SI = Dia chi dau mang A tang dan den n2
        ; DI = SI + 1; Tang dan den n1
        LEA SI, A        
        CALL Sapxep
        
     ; Sap xep mang B
        LEA AX, B
        ADD AX, nB
        DEC AX
        mov n1,ax
        dec AX
        mov n2,ax
        LEA SI, B        
        CALL Sapxep
        
        ; Sap xep mang C
        LEA AX, C
        ADD AX, nC
        DEC AX
        mov n1,ax
        dec AX
        mov n2,ax
        LEA SI, C;         
        CALL Sapxep

        ;Tro ve DOS
        MOV AH,4CH
        INT 21H

;PROCEDURE: Sapxep
;INPUT:     SI - Dia chi dau cua mang, 
;           n2 so phan tu lam khoa cua mang = n1 - 1
;           n1 so phan tu cua mang 
;OUTPUT:    Mang sap xep
;DESTROYS:  AX  

Sapxep     PROC    NEAR
        
;Sap xep
        
  Khoa:
        MOV DI, SI
        INC DI
  LAP:  
         
        MOV AL, [SI]       
        CMP AL, [DI]
        JBE NEXT
        XCHG AL, [DI]
        MOV [SI], AL 
        
        NEXT:
        INC DI
        
        CMP DI,n1
        JBE  LAP
        ;INC DEM
        INC SI
        CMP SI, n2
        JBE Khoa  
        
;Ket thuc
         
        RET             ;Tro ve chuong trinh goi
Sapxep     ENDP

CODE        ENDS
        END START


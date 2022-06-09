TITLE BANGTN.ASM
.MODEL small
.STACK 100
.DATA
   
    MSG1  DB 'Vao 1 SO tu ban phim : $' 
    STR1  DB ' X $'
    STR2  DB ' = $'

    num  DB ?  
    sobinhan db ?
        
    
.CODE
 Vd5:   
    MOV AX,@data
    MOV DS, AX
; nap offset MSG1 vao dx
    LEA DX,MSG1
      

; hien thi MSG1
    MOV AH,9
    INT 21H

; doc vao so bi nhan
    MOV AH,1
    INT 21H
    MOV NUM, AL; Ki tu doc vao tu ban phim
    
    SUB AL, 30H
    MOV sobinhan, AL; gia tri So bi nhan

; xuong dong ve dau dong
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    
    MOV DL, 0AH
    INT 21H
    
; Bang tinh nhan
    
    MOV CX, 9
    MOV BX, 1 ;So nhan tu 1 den 9
    
    BangTN:
    
    ;Hien thi so bi nhan
    MOV DL, num
    MOV AH, 2
    INT 21H
    
    ; Hien thi str1
    LEA DX, str1
    MOV AH, 9
    INT 21H
    
    ; Hien thi so nhan
    MOV DL, BL
    ADD DL, 30h
    MOV AH, 2
    INT 21H
    
    ;Hien thi xau str2
    LEA DX, str2
    MOV AH, 9
    INT 21H
    
    ; nhan hecxa va chuyen ve co so 10
    MOV AL, sobinhan
    MUL BL ; bl = 1, 2, 3, ... ,9
    AAM; ket qua thap phan luu trong AH va AL

    
; Dua ket qua ra man hinh
    PUSH AX; Luu AL vao Stack
    
    ;Hien thi so trong AH
    ADD AH, 30H
    MOV DL, AH

    MOV AH,2
    INT 21H

    ;Hien thi so trong AL
    POP AX; Phuc hoi noi dung AL tu Stack
    ADD AL,30H
    MOV DL,AL

    MOV AH,2
    INT 21H

    ; xuong dong ve dau dong
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    
    MOV DL, 0AH
    INT 21H
    
    INC BL
    LOOP BangTN
    
;Ve Dos
    mov ah,4ch
    int 21h     
    
 END vd5


.MODEL LARGE

DATA        SEGMENT WORD PUBLIC
    TG DB 40H
    Mang   DB 36h,74H,35h,89h,67h,83h 
      
 
DATA        ENDS

STACK_SEG   SEGMENT     STACK
                DW 100 DUP(0)   
        TOP_STACK   LABEL   WORD
STACK_SEG   ENDS
    ;EXTRN BCD_BIN:FAR
    EXTRN HOAN_SO:FAR
    public TG
 
CODE        SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK_SEG
        START:  
        MOV AX,DATA         
        MOV DS,AX             
        MOV AX,STACK_SEG        
        MOV SS,AX
        MOV SP, OFFSET TOP_STACK    
        MOV SI, OFFSET Mang
        
        MOV TG,04H
        
        MOV AX,0
        MOV ES,AX
        ; MOV WORD PTR ES: 402, SEG BCD_BIN
        ;MOV WORD PTR ES: 400, OFFSET BCD_BIN
        
         MOV WORD PTR ES: 482, SEG HOAN_SO
         MOV WORD PTR ES: 480, OFFSET HOAN_SO
         INT 120
       
        MOV CX,6
            ;bai 1 chuyen so bcd sang bin
            ;LAP1: 
            ; MOV AL,[SI]
            ;INT 100
            ;MOV [SI],AL
            ;INC SI
            ;LOOPNE LAP1
        ;bai 2 phan chuyen so neu so do le
        LAP: 
         MOV AL,[SI]
        MOV BL,AL
         MOV AH,0
         MOV BH,2
         DIV BH
         MOV AL,BL
         CMP AH,0
         JE NEXT
         INT 120
         MOV [SI],AL
        NEXT:
        INC SI
        LOOPNE LAP
        
        
        

;Tro ve DOS
        MOV AH,4CH
        INT 21H


CODE        ENDS
        END START


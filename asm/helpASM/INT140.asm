DATA SEGMENT WORD PUBLIC
    EXTRN TG:BYTE
DATA ENDS
        PUBLIC HOAN_SO
        
INT_PROC SEGMENT PUBLIC
     ASSUME DS:DATA
     
    HOAN_SO PROC FAR
         PUSHF
         PUSH CX
        PUSH BX
          MOV AX,DATA         
        MOV DS,AX 
        MOV DL,TG
        MOV CL,AL
        MOV CH,CL
        SHL CH,4
        SHR CL,4
        ADD CH,CL
        MOV AL,CH
      
        POP BX
        POP CX
        POPF
             
        IRET             
       HOAN_SO   ENDP
INT_PROC ENDS
         END



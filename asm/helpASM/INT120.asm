;PROCEDURE: SWAP - Hoan doi 2 so hecxa Decimal
;INPUT:     BL chua so Hecxa Decimal can chuye doi
;OUTPUT:    AL chua gia tri CHuyen doi
;DESTROYS:  AX  


        PUBLIC SWAP

     INT_PROC SEGMENT PUBLIC
        SWAP PROC FAR
                
        ;Thuc hien Hoan doi
                PUSH CX
                
                MOV AL,BL           ;COPY so BCD vao BL
                MOV CL,4
                
                SHL AL, CL
                SHR BL, CL
                
                OR  AL,BL           ;
                ;Ket thuc chuyen doi, ket qua so nhi phan nam trong AL
                
                POP CX
                IRET                ;Tro ve chuong trinh goi
        SWAP  ENDP
    INT_PROC ENDS
         END



;PROCEDURE: BCD_BIN - Chuyen so BCD thanh nhi phan
;INPUT:     AL chua so BCD can chuye doi
;OUTPUT:    AL chua gia tri nhi phan 
;DESTROYS:  AX  


        PUBLIC BCD_BIN

INT_PROC SEGMENT PUBLIC
            BCD_BIN PROC FAR
                              ;Luu thanh ghi co vao stack
                PUSH BX             ;va cac thanh ghi duoc su dung trong thu tuc
                PUSH CX
                ;Thuc hien chuyen doi
                MOV BL,AL           ;COPY so BCD vao BL
                AND BL,0FH          ;Che 4 bit cao, (lay 4 bit thap)
                AND AL,0F0H         ;Che 4 bit thap (lay 4 bit cao)
                MOV CL,04           ;Chuyen so BCD cao thanh thap
                ROR AL,CL           ;de nhan
                MOV BH,0AH          ;Nap he so chuyen doi vao BH
                MUL BH              ;Nhan so BCD cao trong AL voi 0AH trong BH
                                    ;luu ket qua vao AL
                ADD AL,BL           ;Cong so BCD thap voi ket qua MUL trong AL
                ;Ket thuc chuyen doi, ket qua so nhi phan nam trong AL
                POP CX              ;Khoi phuc cac thanh ghi
                POP BX
                
                IRET                ;Tro ve chuong trinh goi
            BCD_BIN  ENDP
INT_PROC ENDS
         END



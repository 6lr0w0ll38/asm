;PROCEDURE: MAX - TIM MAX
;INPUT:     AL chua so BCD can chuye doi
;OUTPUT:    AL chua gia tri nhi phan 
;DESTROYS:  AX  


        PUBLIC MAX

INT_PROC SEGMENT PUBLIC
            MAX PROC FAR
                ASSUME CS:INT_PROC
                              ;Luu thanh ghi co vao stack
                MOV AL, [SI]  ; AL: MAX
                INC SI
                ; CL = n
                MOV CH, 0
                DEC CL; n-1
                
                LAP:
                    CMP AL, [SI]
                    JAE NEXT
                    MOV AL, [SI]
                    NEXT:
                    INC SI
                    LOOP LAP    
                IRET                ;Tro ve chuong trinh goi
             MAX  ENDP
INT_PROC ENDS
         END


         
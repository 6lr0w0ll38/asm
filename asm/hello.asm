TITLE HELLOWORLD!
.MODEL SMALL
.STACK 100
.DATA
    MSG DB "HelloWorld!$"
.CODE
 Start:
 ;mov add segment of DATA in DS
    MOV AX, @DATA
    MOV DS, AX
 ;mov offset of MSG in DX
    LEA DX, MSG
 ;display string
    MOV AH,9
    INT 21H
 ;back dos,window
    MOV AH, 4CH
    INT 21H
 END Start

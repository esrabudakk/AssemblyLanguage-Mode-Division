
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


;ah = remainder
;al = quotient

;ax/bl/=ah&al  

;15 (AX) / 3 (BL) = 5 (AL) , Remainder 0 (AH)



MOV AX , k
MOV BL , 2
DIV BL

CMP AH , 0

JE Div2 


Three:

MOV AX , k
MOV BL , 3
DIV BL

CMP AH , 0
 
JE Div3 


Five:

MOV AX , k
MOV BL , 5
DIV BL

CMP AH , 0  

JE Div5


Ten:

MOV AX , k
MOV BL , 10
DIV BL

CMP AH ,0  ;COMPARE AH , 0 

JE Div10   ;JE : ZF FLAG = 1 THEN JUMP TO Div10


Exit:

MOV AH,4CH
INT 21H


;WRITE MESSAGE CODE BLOCK
 
Div2:

LEA SI, MESSAGE2
MOV CX, 32    ;COUNTER REGISTER ALLOWS THE LOOP TO WORK 32 TIMES 
MOV AH, 0Eh

GO2: LODSB ; LODSB INCREMENT SI BY 1 
INT 10h
LOOP GO2

JMP Three
   
;****************************************************

Div3:
 
LEA SI, MESSAGE3
MOV CX, 32
MOV AH, 0Eh

GO3: LODSB
INT 10h
LOOP GO3

JMP Five 

;****************************************************

Div5:

LEA SI, MESSAGE5
MOV CX, 32
MOV AH, 0Eh

GO5: LODSB
INT 10h
LOOP GO5

JMP Ten

;****************************************************

Div10:

LEA SI, MESSAGE10
MOV CX, 32
MOV AH, 0Eh

GO10: LODSB
INT 10h
LOOP GO10

JMP Exit
  

;****************************************************



ret

k dw 15  ;DW BECAUSE AX = 16 BIT AND DW = DEFINE WORD 16 BIT

MESSAGE2 DB 'The number can be divided by 2',13, 10   ;13 MEAN CARRIAGE RETURN
MESSAGE3 DB 'The number can be divided by 3',13, 10   ;10 MEAN LINE FEED
MESSAGE5 DB 'The number can be divided by 5',13, 10 
MESSAGE10 DB 'The number can be divided by 10',13, 10 
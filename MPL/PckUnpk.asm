DATA_SEG SEGMENT

NUM1 DB 43H
UNPKD1 DB ?
UNPKD2 DB ?

DATA_SEG ENDS

CODE_SEG SEGMENT
ASSUME CS: CODE_SEG, DS: DATA_SEG
START:
MOV AX, DATA_SEG
MOV DS, AX ;INITIALISE THE DATA SEGMENT

;SEPRATION PART OF 03
MOV AL, NUM1 ;TAKE THE NUMBER
AND AL, 0FH ; TO SEPRATE LOWER NIBBLES (3->03) WE USE 0FH
MOV UNPKD1, AL ; PUT LOWER NIBBLE 03 IN UNPKD1 TO EMPTY AL

;
MOV AL, NUM1 ; TAKE NUMBER AGAIN BECAUSE SEPRATION UPER NIBBLE REMAINS
AND AL, 0F0H ;SEPRATE HIGHER BITS

MOV CL, 04H ;COUNTER FOR ROTAION {2*4BIT= 4 COUNTER SIZE , 3*4BIT =8 COUNTER SIZE}
ROR AL, CL ;ROTATING TO MAKE IT 04 FROM 40
MOV UNPKD2, AL ; PUT AL TO UNPCKD2

MOV AH, 4CH ;TERMINATE
INT 21H ;EXIT TO DOS
CODE_SEG ENDS
END START
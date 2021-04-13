.MODEL SMALL
.STACK 500
.DATA
        STRUSERNAME DB "USERNAME: $" ;hello
        STRPASSWORD DB "PASSWORD: $"
        USERNAME DB 'u','s','e','r','1'
        PASSWORD DB 'u','s','e','r','1'
        MM1 DB "1. Ordering $"
        PRD DB 5*35 DUP (0)
        PRDN1 DB "P1. Air Jordan 1 High Retro $"
        PRDN2 DB "P2. Air Force 1 $"
        PRDN3 DB "P3. Air Max 97 $"
        PRDN4 DB 0
        OPT DB ? ;OPTION
        COUNT DB 0
        PRICE1 DB 250
        PRICE2 DB 200
        PRICE3 DB 100
        PRICE4 DB ?
        STRP DB "Product number(ENTER NUMBER ONLY): $"
        PDN DB ?
        STR2 DB "Quantity: "
        QTT DB ? ;QUANTITY
        SUBTOTAL DW ?
        STR3 DB "Order more?(y/n): $"
        MORE DB ?
        TOTAL DW ?
        MEMBERSTR DB "Member?(y/n)"
        MEMBER DB ?
        OGPRICE DW ? ;ORIGINAL PRICE
        DISCOUNT DB 0
        SALES DB ? ;TOTAL SALES
        MM2 DB "2. Summary $"
        MM3 DB "3. Product $"
        MM4 DB "4. Exit $"
        STR4 DB "Selection: $"
        SEL DB ? ;SELECTION
        STRUSER LABEL BYTE
        MAXN1 DB 30
        ACTN1 DB ?
        INPUTUSER DB 30 DUP("$")
        STRPASS LABEL BYTE
        MAXN2 DB 30
        ACTN2 DB ?
        INPUTPASS DB 30 DUP("$")
        STRREG1 LABEL BYTE
        MAXN3 DB 30
        ACTN3 DB ?
        INPUTREG1 DB 30 DUP("$")
        STRREG2 LABEL BYTE
        MAXN4 DB 30
        ACTN4 DB ?
        INPUTREG2 DB 30 DUP("$")
        ERRORMSG DB "Invalid Password!$"
        ERRORMSG1 DB "Invalid Username!$"
        REG1 DB "Register a new account?(y/n): $"
        REG2 DB "Confirm register?(y/n): $"
        REG3 DB "Account register succesfully!$"
        REGYN DB ?
        
        REGTEXT DB "REGISTER$"
        
        LINETEXT DB "==========================$"
        LINETEXTNEW DB 0DH,0AH,"==========================$"
        NL DB 0DH,0AH,"$"
        TEN DB 10
        HUNDRED DB 100
        FIVEHUND DW 500
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

REGISTER:
        MOV AH,09H
        LEA DX,REGTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        MOV AH,09H
        LEA DX,REG1
        INT 21H

        MOV AH,01H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP AL,'n'
        JE LOGIN

        MOV AH,09H
        LEA DX,STRUSERNAME
        INT 21H

        MOV AH,0AH
        LEA DX,STRREG1
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STRPASSWORD
        INT 21H

        MOV AH,0AH
        LEA DX,STRREG2
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,REG2
        INT 21H

        MOV AH,01H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP AL,'n'
        MOV REGYN,AL
        JE REGISTER

        MOV AH,09H
        LEA DX,REG3
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
LOGIN:
        ;username
        MOV AH,09H
        LEA DX,STRUSERNAME
        INT 21H

        ;input user
        MOV AH,0AH
        LEA DX,STRUSER
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        ;password
        MOV AH,09H
        LEA DX,STRPASSWORD
        INT 21H

        ;input password
        MOV AH,0AH
        LEA DX,STRPASS
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP ACTN1,5
        JNE USER2
        MOV CH,0
        MOV CL,ACTN1
        MOV SI,0
        CHECKUSER:
                  MOV AL,USERNAME[SI]
                  CMP INPUTUSER[SI],AL
                  JNE USER2

                  INC SI
        LOOP CHECKUSER

        CMP ACTN2,5
        JNE USER2
        MOV CH,0
        MOV CL,ACTN2
        MOV SI,0
        CHECKPASS:
                  MOV AL,PASSWORD[SI]
                  CMP INPUTPASS[SI],AL
                  JNE USER2

                  INC SI
        LOOP CHECKPASS
        JMP MAINMENU

USER2:
        MOV BL,ACTN3
        CMP ACTN1,BL
        JNE ERROR1
        MOV CH,0
        MOV CL,ACTN1
        MOV SI,0
        CHECKUSER1:
                  MOV AL,INPUTREG1[SI]
                  CMP INPUTUSER[SI],AL
                  JNE ERROR1

                  INC SI
        LOOP CHECKUSER1

        MOV BL,ACTN4
        CMP ACTN2,BL
        JNE ERROR2
        MOV CH,0
        MOV CL,ACTN2
        MOV SI,0
        CHECKPASS2:
                  MOV AL,INPUTREG2[SI]
                  CMP INPUTPASS[SI],AL
                  JNE ERROR2

                  INC SI
        LOOP CHECKPASS2
        JMP MAINMENU

ERROR1:
        MOV AH,09H
        LEA DX,ERRORMSG1
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        JMP LOGIN
ERROR2:
        MOV AH,09H
        LEA DX,ERRORMSG
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        JMP LOGIN

MAINMENU:
        ;mainmenu list
        
        MOV AH,09H
        LEA DX,MM1
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,MM2
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,MM3
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,MM4
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR4
        INT 21H

        MOV AH,01H
        INT 21H
        MOV SEL,AL

        CMP SEL,'1'
        JE ORDERING

        CMP SEL,'2'
        JE SUMMARY1

        CMP SEL,'3'
        JE PRODUCT1

        CMP SEL,'4'
        JE EXIT1
SUMMARY1:
        JMP SUMMARY
PRODUCT1:
        JMP PRODUCT
EXIT1:
        JMP EXIT

ORDERING:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP PRDN1,0
        JE PD2

        MOV AH,09H
        LEA DX,PRDN1
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

PD2:
        MOV AH,09H
        LEA DX,PRDN2
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP PRDN2,0
        JE PD3
PD3:
        MOV AH,09H
        LEA DX,PRDN3
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        MOV AH,09H
        LEA DX,PRDN4
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STRP
        INT 21H

        MOV AH,01H
        MOV OPT,AL
        INT 21H

        CMP OPT,'1'
        JE PRD1

        CMP OPT,'2'
        JE PROD2

        CMP OPT,'3'
        JE PROD3

        CMP OPT,'4'
        JE PROD4
ORDERING1:
        JMP ORDERING
PROD2:
        CMP PRDN2,'0'
        JE ORDERING1
        JMP PRD2
PROD3:
        CMP PRDN3,'0'
        JE ORDERING1
        JMP PRD3
PROD4:
        CMP PRDN4,'0'
        JE ORDERING1
        JMP PRD4
PRD1:
        CMP PRDN1,'0'
        JE ORDERING1
        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,01H
        MOV QTT,AL
        INT 21H

        MOV AH,0
        MOV AL,PRICE1
        MUL QTT
        MOV SUBTOTAL,AX
        
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV AH,01H
        MOV MORE,AL
        INT 21H

        CMP MORE,'y'
        JE ORDERING2
ORDERING2:
        JMP ORDERING

        MOV AX,SUBTOTAL
        MOV TOTAL,AX
        MOV BX,TOTAL
        MOV OGPRICE,BX
        MOV SUBTOTAL,0
        
        MOV AH,09H
        LEA DX,MEMBERSTR
        INT 21H

        MOV AH,01H
        MOV MEMBER,AL
        INT 21H

        CMP MEMBER,'y'
        JE MEMBER1

        MOV BX,TOTAL
        CMP BX,FIVEHUND
        JL LESSTHAN500


        MOV AL,95
        MUL TOTAL
        DIV HUNDRED

CALCULATE1:

        JMP MAINMENU
PRD2:

PRD3:

PRD4:
        
MEMBER1:
        CMP TOTAL,500
        JL LESSTHAN500M

        MOV AL,92
        MUL TOTAL
        DIV HUNDRED
        JMP CALCULATE1
LESSTHAN500:
        CMP TOTAL,300
        JL CALCULATE1

        MOV AL,95
        MUL TOTAL
        DIV HUNDRED
        JMP CALCULATE1
LESSTHAN500M:
        CMP TOTAL,300
        JL CALCULATE1

        MOV AL,95
        MUL TOTAL
        DIV HUNDRED
        JMP CALCULATE1
        
SUMMARY:


PRODUCT:




EXIT:
        MOV AX,4C00H
        INT 21H
MAIN ENDP
END MAIN
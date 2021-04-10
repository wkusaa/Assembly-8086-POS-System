.MODEL SMALL
.STACK 500
.DATA
        STRUSERNAME DB "USERNAME: $"
        STRPASSWORD DB "PASSWORD: $"
        USERNAME DB 'u','s','e','r','1'
        PASSWORD DB 'u','s','e','r','1'
        MM1 DB "1. Ordering $"
        PRD DB 5*35 DUP (0)
        PRDN1 DB "Air Jordan 1 High Retro - RM 350$"
        PRDN2 DB "Air Force 1 - RM 250$"
        PRDN3 DB "Air Max 97 - RM 200$"
        OPTION DB "OPTION: $"
        OPT DB ?
        COUNT DB 0
        PRICE DW 350,250,200
        STR DB "Product number: $"
        PDN DB ?
        STR2 DB "Quantity: "
        QTT DB ?
        SUBT DB ?
        STR3 DB "Order more?(Y/N): $"
        TOTAL DB ?
        MM2 DB "2. Summary $"
        MM3 DB "3. Product $"
        MM4 DB "4. Exit $"
        STR4 DB "Selection: $"
        SEL DB ?
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
        LOG1 DB "Login $"
        LINETEXT DB ""
        REGYN DB ?
        NL DB 0DH,0AH,"$" #bruh
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

REGISTER:
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
        JE SUMMARY

        CMP SEL,'3'
        JE PRODUCT  

        CMP SEL,'4'
        JE EXIT      

ORDERING:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,PRDN1
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,PRDN2
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,PRDN3
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        MOV AH,09H
        LEA DX,OPTION
        INT 21H

        MOV AH,01H
        MOV OPT,AL
        INT 21H


L1:
        MOV AH,09H
        LEA DX,STR
        INT 21H
        
SUMMARY:


PRODUCT:




EXIT:
        MOV AX,4C00H
        INT 21H
MAIN ENDP
END MAIN

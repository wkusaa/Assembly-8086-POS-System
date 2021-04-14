.MODEL SMALL
.STACK 100
.DATA
        ; MAIN SCREEN
	LOGO			DB "                 _____ ______   ___  ___  __    _______         ", 13, 10
                                DB "                |\   _ \  _   \|\  \|\  \|\  \ |\  ___ \        ", 13, 10
                                DB "                \ \  \\\__\ \  \ \  \ \  \/  /|\ \   __/|       ", 13, 10
                                DB "                  \ \  \    \ \  \ \  \ \  \\ \  \ \  \_|\ \    ", 13, 10
                                DB "                   \ \__\    \ \__\ \__\ \__\\ \__\ \_______\   ", 13, 10
                                DB "                    \|__|     \|__|\|__|\|__| \|__|\|_______|   TM", 13, 10 , '$'
    
	STRSEPARATOR	DB "================================================================================", 13, 10, "$"

	STRWELCOME		DB "                        WELCOME TO MIKE POINT OF SALES SYSTEM", 13, 10, "$"
	STRWELCOMELEN   DW 61 ;i used character counter to count the word above
	STRWELCOMECOLOR DB 0BH


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
        STR2 DB "Quantity: $";only for manager account
        QTT DB 1 ;QUANTITY
        SUBTOTAL DW ?
        STR3 DB "Order more?(y/n): $"
        STR5 DB "Next Order?(y/n): $"
        MORE DB ?
        NEXTORDER DB ?
        TOTAL DW 0
        MEMBERSTR DB "Member?(y/n): $"
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
        STRPROD4 LABEL BYTE
        MAXN5 DB 30
        ACTN5 DB ?
        INPUPROD4 DB 30 DUP("$")
        ERRORMSG DB "Invalid Password!$"
        ERRORMSG1 DB "Invalid Username!$"
        REG1 DB "Register a new account?(y/n): $"
        REG2 DB "Confirm register?(y/n): $"
        REG3 DB "Account register succesfully!$"
        REGYN DB ?
        STRTOTAL DB "Total Amount (Price included 6% service tax): $"
        STRDISCOUNT DB "Total Discount: $" 
        STRSUBTOTAL DB "Subtotal: $"
        STRCONFORDER DB "Confirm Order?(y/n): $"

        SUMMARYTOTALSALES DB "Total Sales for this session : $"


        REGTEXT DB "REGISTER$"
        LOGTEXT DB "LOGIN$"
        SUMMARYTEXT DB "SUMMARY$"
        LINETEXT DB "==========================$"
        LINETEXTNEW DB 0DH,0AH,"==========================$"
        NL DB 0DH,0AH,"$"
        TEN DB 10
        HUNDRED DB 100
        FIVEHUND DW 500
        REMAINDER DB ?
        DECIMAL DB ?
        DOT DB "."
        ANS DB ?
        RM DB "RM $"
        PERCENT DB "%$"
        TAX DB 106
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        CALL CLEARSCREEN
        CALL DISPLAYLOGO

REGISTER:

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

        CMP AL,'y'
        JNE LOGIN

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

        CMP AL,'y'
        MOV REGYN,AL
        JNE REGISTER

        MOV AH,09H
        LEA DX,REG3
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
LOGIN:
        MOV AH,09H
        LEA DX,LOGTEXT
        INT 21H
        
        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

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
                  JNE ERROR2

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
        CALL CLEARSCREEN

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
        CMP PRDN2,0
        JE PD3

        MOV AH,09H
        LEA DX,PRDN2
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

PD3:
        CMP PRDN3,0
        JE PD4

        MOV AH,09H
        LEA DX,PRDN3
        INT 21H
PD4:
        CMP PRDN4,0
        JE OPTION1

        MOV AH,09H
        LEA DX,PRDN4
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

OPTION1:

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
        LEA DX,NL
        INT 21H
        
        CMP ACTN1,5
        JNE ADMIN
        MOV CH,0
        MOV CL,ACTN1
        MOV SI,0
        CHECKUSER2:
                  MOV AL,USERNAME[SI]
                  CMP INPUTUSER[SI],AL
                  JNE ADMIN

                  INC SI
        LOOP CHECKUSER2

        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV QTT,AL

ADMIN:
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
        JMP CALCULATE
ORDERING2:
        JMP ORDERING
CALCULATE:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY SUBTOTAL
        LEA DX,STRSUBTOTAL
        INT 21H

        MOV AH,09H
        LEA DX,RM
        INT 21H

        MOV AX,SUBTOTAL
        MOV TOTAL,AX

        DIV HUNDRED
        MOV REMAINDER,AH
        MOV AH,0
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH
        ADD DL,30H
        INT 21H
        
        MOV AH,0
        MOV AL,REMAINDER
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,MEMBERSTR
        INT 21H

        MOV AH,01H
        MOV MEMBER,AL
        INT 21H

        CMP MEMBER,'y';MEMBER?
        JNE CALCULATE1

        MOV DISCOUNT,10
        MOV AX,90
        MUL TOTAL
        DIV HUNDRED
        MUL TAX
        DIV HUNDRED

CALCULATE1:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV AH,02H
        MOV DL,DISCOUNT
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,PERCENT
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY TOTAL
        LEA DX,STRTOTAL
        INT 21H

        MOV AH,09H
        LEA DX,RM
        INT 21H

        MOV AH,09H
        LEA DX,STRCONFORDER
        INT 21H

        MOV AH,01H
        INT 21H
        CMP AL,'y'
        JNE ORDERING3

        INC COUNT

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR5
        INT 21H

        MOV AH,01H
        MOV NEXTORDER,AL
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP NEXTORDER,'y'
        JE ORDERING3
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV DISCOUNT,0
        MOV SUBTOTAL,0
        JMP MAINMENU
ORDERING3:
        MOV SUBTOTAL,0
        MOV DISCOUNT,0
        JMP ORDERING
PRD2:

PRD3:

PRD4:

SUMMARY:
        CALL CLEARSCREEN

        MOV AH,09H
        LEA DX,SUMMARYTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE
        




PRODUCT:




EXIT:
        MOV AX,4C00H
        INT 21H
MAIN ENDP

DISPLAYLOGO PROC
	MOV AH, 09H
	LEA DX, LOGO
	INT 21H
	
	LEA DX, STRSEPARATOR
	INT 21H
	
	; Change color
	MOV AH, 09H
	MOV BH, 0
	MOV BL, STRWELCOMECOLOR
	MOV CX, STRWELCOMELEN ;based on str length 
	INT 10H

        LEA DX, STRWELCOME
        INT 21H
    
        LEA DX, STRSEPARATOR
        INT 21H
    
        CALL NEWLINE
	
	RET

DISPLAYLOGO ENDP

CLEARSCREEN PROC
    
        MOV AH,00H    ;06 TO SCROLL & 00 FOR FULLJ SCREEN
        MOV AL,03H
        MOV BH,07    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
        MOV CX,0000H    ;STARTING COORDINATES
        MOV DX,184FH    ;ENDING COORDINATES
        INT 10H        ;FOR VIDEO DISPLAY
        
        RET  
CLEARSCREEN ENDP

NEWLINE PROC
        MOV AH,09H
        LEA DX,NL
        INT 21H
	RET
NEWLINE ENDP


END MAIN

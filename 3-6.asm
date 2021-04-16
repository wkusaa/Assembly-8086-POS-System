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
        ; PRDN4 DB 0
        OPT DB ? ;OPTION
        COUNT DB 0
        PRICE1 DB 230
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
        SALES DW 0 ;TOTAL SALES
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
        PRDN4 DB 30 DUP("$")
        ERRORMSG DB "Invalid Password!$"
        ERRORMSG1 DB "Invalid Username!$"
        REG1 DB "Register a new account?(y/n): $"
        REG2 DB "Confirm register?(y/n): $"
        REG3 DB "Account register succesfully!$"
        REGYN DB ?
        STRTOTAL DB "Total Amount (Price included 6% service tax): $"
        STRDISCOUNT DB "Discount: $" 
        STRSUBTOTAL DB "Subtotal: $"
        STRCONFORDER DB "Confirm Order?(y/n): $"

        SUMMARYTOTALTRANSACMADE DB "Total transaction made for this session : $"
        SUMMARYTOTALSALES DB "Total sales for this session : $"

        PMM1 DB "1. Product List $"
        PMM2 DB "2. Add New Product $"
        PMM3 DB "3. Delete Product $"

        PRODUCTNAMETEXT DB "Enter Product Name",0DH,0AH,"e.g. (P4. [PRODUCTNAME]): $"
        ENTERPRODPRICETEXT DB "Enter Product Price",0DH,0AH,"(MAX 3 DIGIT, LESS THAN RM 256 AND ROUND OF TO THE NEAREST RINGGIT): RM $"
        
        NEWPRODNAME DB "New Product Name : $"
        NEWPRODPRICE DB "New Product Price : RM $"

        PRODUCTDELETED DB "Product deleted successfully! $"

        INPUTVALUE DB 0
        INPUTTOTAL DB 0

        ENTERANYKEY DB 0DH,0AH,0DH,0AH,">>>Press enter to return to main menu... $"
        MAINMENUTEXT DB "MAIN MENU $"
        REGTEXT DB "REGISTER$"
        LOGTEXT DB "LOGIN$"
        SUMMARYTEXT DB "SUMMARY$"
        PRODUCTTEXT DB "PRODUCT$"
        PRODUCTADD DB "ADD NEW PRODUCT$"
        PRODUCTLISTTEXT DB "PRODUCT LIST$"
        DELETEPRODUCTTEXT DB "DELETE PRODUCT$"
        LINETEXT DB "==========================$"
        LINETEXTNEW DB 0DH,0AH,"==========================$"
        NL DB 0DH,0AH,"$"
        TEN DB 10
        HUNDRED DB 100
        REMAINDER DB ?
        DECIMAL DB ?
        DOT DB ".$"
        ANS DB ?
        RM DB "RM $"
        PERCENT DB "%$"
        TAX DB 106
        NINE DB 9
        NANS DB ?
        NREMAINDER DB ?
        NANS2 DB ?
        ONE DB 1
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
        LEA DX,MAINMENUTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE

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

        CMP PRDN1,'$'
        JE PD2

        MOV AH,09H
        LEA DX,PRDN1
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

PD2:
        CMP PRDN2,'$'
        JE PD3

        MOV AH,09H
        LEA DX,PRDN2
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

PD3:
        CMP PRDN3,'$'
        JE PD4

        MOV AH,09H
        LEA DX,PRDN3
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
PD4:
        CMP PRDN4,'$'
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
        INT 21H

        CMP AL,'1'
        JE PRD1

        CMP AL,'2'
        JE PROD2

        CMP AL,'3'
        JE PROD3

        CMP AL,'4'
        JE PROD4
ORDERING1:
        JMP ORDERING
PROD2:
        CMP PRDN2,'$'
        JE ORDERING1
        JMP PRD2
PROD3:
        CMP PRDN3,'$'
        JE ORDERING1
        JMP PRD3
PROD4:
        CMP PRDN4,'$'
        JE ORDERING1
        JMP PRD4
PRD1:
        CMP PRDN1,'$'
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
        INT 21H

        CMP AL,'y'
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
        INT 21H

        CMP AL,'y'
        JE MEMBER1

        JMP NMEMBER

MEMBER1:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV DISCOUNT,10
        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL NINE;2250
        DIV TEN;225
        MUL TAX;23850
        ADD SALES,AX
        DIV HUNDRED;238.50
        MOV NREMAINDER,AH;50
        MOV NANS,AL;238

        JMP L1
NMEMBER:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL TAX;26500
        DIV HUNDRED;265.00
        ADD SALES,AX
        MOV NREMAINDER,AH;00
        MOV NANS,AL;265

L1:
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

        ;RMXXX.00
        MOV AL,NANS;238
        MOV AH,0
        DIV HUNDRED;2.38
        MOV NANS2,AH;0.38

        MOV AH,02H
        MOV DL,AL;2
        ADD DL,30H
        INT 21H

        MOV AH,0
        MOV AL,NANS2;38
        DIV TEN;3.8
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;3
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;8
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,DOT
        INT 21H

        ;RM000.XX
        MOV AH,0
        MOV AL,NREMAINDER
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;5
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;0
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,NL
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
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP AL,'y'
        JE ORDERING3

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV TOTAL,0
        MOV DISCOUNT,0
        MOV SUBTOTAL,0
        JMP MAINMENU

ORDERING3:
        MOV TOTAL,0
        MOV SUBTOTAL,0
        MOV DISCOUNT,0
        JMP ORDERING
PRD2:
        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        CMP ACTN1,5
        JNE ADMIN1
        MOV CH,0
        MOV CL,ACTN1
        MOV SI,0
        CHECKUSER3:
                  MOV AL,USERNAME[SI]
                  CMP INPUTUSER[SI],AL
                  JNE ADMIN1

                  INC SI
        LOOP CHECKUSER3

        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV QTT,AL

ADMIN1:
        MOV AH,0
        MOV AL,PRICE2
        MUL QTT
        MOV SUBTOTAL,AX

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV AH,01H
        INT 21H

        CMP AL,'y'
        JE ORDERINGT
        JMP CALCULATE1
ORDERINGT:
        JMP ORDERING
CALCULATE1:
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
        INT 21H

        CMP AL,'y'
        JE MEMBER2

        JMP NMEMBER1

MEMBER2:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV DISCOUNT,10
        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL NINE;2250
        DIV TEN;225
        MUL TAX;23850
        ADD SALES,AX
        DIV HUNDRED;238.50
        MOV NREMAINDER,AH;50
        MOV NANS,AL;238

        JMP L2
NMEMBER1:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL TAX;26500
        DIV HUNDRED;265.00
        ADD SALES,AX
        MOV NREMAINDER,AH;00
        MOV NANS,AL;265

L2:
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

        ;RMXXX.00
        MOV AL,NANS;238
        MOV AH,0
        DIV HUNDRED;2.38
        MOV NANS2,AH;0.38

        MOV AH,02H
        MOV DL,AL;2
        ADD DL,30H
        INT 21H

        MOV AH,0
        MOV AL,NANS2;38
        DIV TEN;3.8
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;3
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;8
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,DOT
        INT 21H

        ;RM000.XX
        MOV AH,0
        MOV AL,NREMAINDER
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;5
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;0
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        MOV AH,09H
        LEA DX,STRCONFORDER
        INT 21H

        MOV AH,01H
        INT 21H
        CMP AL,'y'
        JNE ORDERING4

        INC COUNT

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR5
        INT 21H

        MOV AH,01H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP AL,'y'
        JE ORDERING4
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV TOTAL,0
        MOV DISCOUNT,0
        MOV SUBTOTAL,0
        JMP MAINMENU

ORDERING4:
        MOV TOTAL,0
        MOV SUBTOTAL,0
        MOV DISCOUNT,0
        JMP ORDERING
PRD3:
        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        CMP ACTN1,5
        JNE ADMIN2
        MOV CH,0
        MOV CL,ACTN1
        MOV SI,0
        CHECKUSER4:
                  MOV AL,USERNAME[SI]
                  CMP INPUTUSER[SI],AL
                  JNE ADMIN2

                  INC SI
        LOOP CHECKUSER4

        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV QTT,AL

ADMIN2:
        MOV AH,0
        MOV AL,PRICE3
        MUL QTT
        MOV SUBTOTAL,AX

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV AH,01H
        INT 21H

        CMP AL,'y'
        JE ORDERINGZ
        JMP CALCULATE2
ORDERINGZ:
        JMP ORDERING
CALCULATE2:
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
        INT 21H

        CMP AL,'y'
        JE MEMBER3

        JMP NMEMBER2

MEMBER3:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV DISCOUNT,10
        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL NINE;2250
        DIV TEN;225
        MUL TAX;23850
        ADD SALES,AX
        DIV HUNDRED;238.50
        MOV NREMAINDER,AH;50
        MOV NANS,AL;238

        JMP L3
NMEMBER2:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL TAX;26500
        DIV HUNDRED;265.00
        ADD SALES,AX
        MOV NREMAINDER,AH;00
        MOV NANS,AL;265

L3:
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

        ;RMXXX.00
        MOV AL,NANS;238
        MOV AH,0
        DIV HUNDRED;2.38
        MOV NANS2,AH;0.38

        MOV AH,02H
        MOV DL,AL;2
        ADD DL,30H
        INT 21H

        MOV AH,0
        MOV AL,NANS2;38
        DIV TEN;3.8
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;3
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;8
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,DOT
        INT 21H

        ;RM000.XX
        MOV AH,0
        MOV AL,NREMAINDER
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;5
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;0
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        MOV AH,09H
        LEA DX,STRCONFORDER
        INT 21H

        MOV AH,01H
        INT 21H
        CMP AL,'y'
        JNE ORDERING5

        INC COUNT

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR5
        INT 21H

        MOV AH,01H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP AL,'y'
        JE ORDERING5
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV TOTAL,0
        MOV DISCOUNT,0
        MOV SUBTOTAL,0
        JMP MAINMENU

ORDERING5:
        MOV TOTAL,0
        MOV SUBTOTAL,0
        MOV DISCOUNT,0
        JMP ORDERING
PRD4:
        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        CMP ACTN1,5
        JNE ADMIN4
        MOV CH,0
        MOV CL,ACTN1
        MOV SI,0
        CHECKUSER6:
                  MOV AL,USERNAME[SI]
                  CMP INPUTUSER[SI],AL
                  JNE ADMIN4

                  INC SI
        LOOP CHECKUSER6

        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV QTT,AL

ADMIN4:
        MOV AH,0
        MOV AL,PRICE4
        MUL QTT
        MOV SUBTOTAL,AX

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV AH,01H
        INT 21H

        CMP AL,'y'
        JE ORDERING6
        JMP CALCULATE3
ORDERING6:
        JMP ORDERING
CALCULATE3:
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
        INT 21H

        CMP AL,'y'
        JE MEMBER5

        JMP NMEMBERF

MEMBER5:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV DISCOUNT,10
        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL NINE;2250
        DIV TEN;225
        MUL TAX;23850
        ADD SALES,AX
        DIV HUNDRED;238.50
        MOV NREMAINDER,AH;50
        MOV NANS,AL;238

        JMP L4
NMEMBERF:
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H;DISPLAY DISCOUNT
        LEA DX,STRDISCOUNT
        INT 21H

        MOV AH,0
        MOV AL,DISCOUNT
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

        MOV AX,TOTAL;250
        MUL TAX;26500
        DIV HUNDRED;265.00
        ADD SALES,AX
        MOV NREMAINDER,AH;00
        MOV NANS,AL;265

L4:
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

        ;RMXXX.00
        MOV AL,NANS;238
        MOV AH,0
        DIV HUNDRED;2.38
        MOV NANS2,AH;0.38

        MOV AH,02H
        MOV DL,AL;2
        ADD DL,30H
        INT 21H

        MOV AH,0
        MOV AL,NANS2;38
        DIV TEN;3.8
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;3
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;8
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,DOT
        INT 21H

        ;RM000.XX
        MOV AH,0
        MOV AL,NREMAINDER
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;5
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;0
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H
        
        MOV AH,09H
        LEA DX,STRCONFORDER
        INT 21H

        MOV AH,01H
        INT 21H
        CMP AL,'y'
        JNE ORDERINGS

        INC COUNT

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV AH,09H
        LEA DX,STR5
        INT 21H

        MOV AH,01H
        INT 21H

        MOV AH,09H
        LEA DX,NL
        INT 21H

        CMP AL,'y'
        JE ORDERINGS
        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV TOTAL,0
        MOV DISCOUNT,0
        MOV SUBTOTAL,0
        JMP MAINMENU

ORDERINGS:
        MOV TOTAL,0
        MOV SUBTOTAL,0
        MOV DISCOUNT,0
        JMP ORDERING
SUMMARY:
        CALL CLEARSCREEN

        MOV AH,09H
        LEA DX,SUMMARYTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,SUMMARYTOTALTRANSACMADE
        INT 21H

        MOV AH,0
        MOV AL,COUNT ;display total order made
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
        
        CALL NEWLINE

        MOV AH,09H
        LEA DX,SUMMARYTOTALSALES
        INT 21H

        MOV AX,SALES
        DIV HUNDRED
        MOV NREMAINDER,AH;00
        MOV NANS,AL;265

        MOV AH,09H
        LEA DX,RM       
        INT 21H

        ;RMXXX.00
        MOV AL,NANS;238
        MOV AH,0
        DIV HUNDRED;2.38
        MOV NANS2,AH;0.38

        MOV AH,02H
        MOV DL,AL;2
        ADD DL,30H
        INT 21H

        MOV AH,0
        MOV AL,NANS2;38
        DIV TEN;3.8
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;3
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;8
        ADD DL,30H
        INT 21H

        MOV AH,09H
        LEA DX,DOT
        INT 21H

        ;RM000.XX
        MOV AH,0
        MOV AL,NREMAINDER
        DIV TEN
        MOV BX,AX

        MOV AH,02H
        MOV DL,BL;5
        ADD DL,30H
        INT 21H

        MOV AH,02H
        MOV DL,BH;0
        ADD DL,30H
        INT 21H

        
        CALL NEWLINE

        MOV AH,09H
        LEA DX,ENTERANYKEY
        INT 21H

        MOV AH,01H
        INT 21H

        JMP MAINMENU


PRODUCT:
        CALL CLEARSCREEN

        MOV AH,09H
        LEA DX,PRODUCTTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,PMM1
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,PMM2
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,PMM3
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,STR4
        INT 21H

        MOV AH,01H
        INT 21H
        MOV SEL,AL

        CMP SEL,'1'
        JE PRODUCTLIST

        CMP SEL,'2'
        JE ADDPRODUCT1

        CMP SEL,'3'
        JE DELETEPRODUCT

        JMP MAINMENU

ADDPRODUCT1:
        JMP ADDPRODUCT

PRODUCTLIST:
        CALL CLEARSCREEN

        MOV AH,09H
        LEA DX,PRODUCTLISTTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN1
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN2
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN3
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN4
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,ENTERANYKEY
        INT 21H

        MOV AH,01H
        INT 21H

        JMP MAINMENU


DELETEPRODUCT:
        CALL CLEARSCREEN

        MOV AH,09H
        LEA DX,DELETEPRODUCTTEXT
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN1
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN2
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN3
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRDN4
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,STR4
        INT 21H

        MOV AH,01H
        INT 21H

        CMP AL,'1'
        JE DELETEPRODUCT1

        CMP AL,'2'
        JE DELETEPRODUCT2

        CMP AL,'3'
        JE DELETEPRODUCT3

        CMP AL,'4'
        JE DELETEPRODUCT4

        JMP MAINMENU
L9:
        CALL NEWLINE

        MOV AH,09H
        LEA DX,PRODUCTDELETED
        INT 21H
        
        CALL NEWLINE

        MOV AH,09H
        LEA DX,ENTERANYKEY
        INT 21H

        MOV AH,01H
        INT 21H

        JMP MAINMENU

DELETEPRODUCT1:
        MOV PRDN1,"$"
        MOV PRICE1,0
        
        JMP L9
        
DELETEPRODUCT2:
        MOV PRDN2,"$"
        MOV PRICE2,0

        JMP L9

DELETEPRODUCT3:
        MOV PRDN3,"$"
        MOV PRICE3,0

        JMP L9

DELETEPRODUCT4:
        MOV PRDN4,"$"
        MOV PRICE4,0

        JMP L9


ADDPRODUCT:
        CALL CLEARSCREEN

        MOV AH,09H
        LEA DX,PRODUCTADD
        INT 21H

        MOV AH,09H
        LEA DX,LINETEXTNEW
        INT 21H

        CALL NEWLINE

        ;Enter product name
        MOV AH,09H
        LEA DX,PRODUCTNAMETEXT
        INT 21H

        MOV AH,0AH
        LEA DX,STRPROD4
        INT 21h
        
        CALL NEWLINE

; ;MOVE THE STRING TO ANOTHER STRING
;         LEA DI, PRDN4 	; Starting address of Destination
; 	LEA SI, PRDN4		; Starting address of Source
; 	MOV CX, 30		; Number of elements = 30
; 	PUSH DS
; 	POP ES			; make ES=DS
; 	CLD			; set SI and DI to auto-increment	
; MOVESTR:	
;         MOVSB
; 	LOOP MOVESTR

;ENTER PRICE
        MOV AH,09H
        LEA DX,ENTERPRODPRICETEXT
        INT 21H

        READ:
        MOV AH,01H
        INT 21H
        
        CMP AL, 13
        JE ENDOFNUMBER
        
        MOV INPUTVALUE, AL
        SUB INPUTVALUE, 48
        
        MOV AL, INPUTTOTAL
        MOV BL, 10
        MUL BL
        
        ADD AL, INPUTVALUE
        
        MOV INPUTTOTAL, AL
        
        JMP READ

        ENDOFNUMBER: 
        MOV AL,INPUTTOTAL
        MOV PRICE4,AL;move the inputtotal to price4
        MOV INPUTTOTAL,0
        MOV INPUTVALUE,0

        CALL NEWLINE ;Display new product

        MOV AH,09H
        LEA DX,NEWPRODNAME
        INT 21H

        MOV AH,09H
        LEA DX,PRDN4
        INT 21H

        CALL NEWLINE;Display new price

        MOV AH,09H
        LEA DX,NEWPRODPRICE
        INT 21H

        MOV AH,0
        MOV AL,PRICE4

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
        LEA DX,ENTERANYKEY
        INT 21H

        MOV AH,01H
        INT 21H

        JMP MAINMENU

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

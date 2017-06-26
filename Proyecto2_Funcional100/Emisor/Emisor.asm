
_interrupt:

;Emisor.c,6 :: 		void interrupt(){
;Emisor.c,8 :: 		if(INTCON.RBIF){
	BTFSS       INTCON+0, 0 
	GOTO        L_interrupt0
;Emisor.c,9 :: 		if(!flag){
	MOVF        _flag+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;Emisor.c,10 :: 		T0CON = 0x80;  //Timer 16 bits con preescaler 2
	MOVLW       128
	MOVWF       T0CON+0 
;Emisor.c,11 :: 		TMR0H = 0;
	CLRF        TMR0H+0 
;Emisor.c,12 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;Emisor.c,13 :: 		Flag = 1;
	MOVLW       1
	MOVWF       _flag+0 
;Emisor.c,14 :: 		}
	GOTO        L_interrupt2
L_interrupt1:
;Emisor.c,17 :: 		aux = TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
;Emisor.c,18 :: 		aux = aux + (TMR0H<<8);
	MOVF        TMR0H+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _aux+0, 1 
	MOVF        R1, 0 
	ADDWFC      _aux+1, 1 
;Emisor.c,19 :: 		for( i=0;i<2;i++)
	CLRF        _i+0 
L_interrupt3:
	MOVLW       2
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt4
;Emisor.c,21 :: 		while(UART1_Tx_idle() != 1);
L_interrupt6:
	CALL        _UART1_Tx_Idle+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt7
	GOTO        L_interrupt6
L_interrupt7:
;Emisor.c,22 :: 		UART1_Write(aux>>(8*i));
	MOVLW       3
	MOVWF       R2 
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__interrupt15:
	BZ          L__interrupt16
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__interrupt15
L__interrupt16:
	MOVF        R0, 0 
	MOVWF       R2 
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__interrupt17:
	BZ          L__interrupt18
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__interrupt17
L__interrupt18:
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Emisor.c,19 :: 		for( i=0;i<2;i++)
	INCF        _i+0, 1 
;Emisor.c,23 :: 		}
	GOTO        L_interrupt3
L_interrupt4:
;Emisor.c,24 :: 		flag = 0;
	CLRF        _flag+0 
;Emisor.c,25 :: 		T0CON.B7=0;
	BCF         T0CON+0, 7 
;Emisor.c,26 :: 		}
L_interrupt2:
;Emisor.c,28 :: 		x = portb;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Emisor.c,29 :: 		INTCON.RBIF = 0;
	BCF         INTCON+0, 0 
;Emisor.c,30 :: 		}
L_interrupt0:
;Emisor.c,31 :: 		}
L_end_interrupt:
L__interrupt14:
	RETFIE      1
; end of _interrupt

_main:

;Emisor.c,33 :: 		void main() {
;Emisor.c,35 :: 		TRISB.B0 = 0; // b1 salida
	BCF         TRISB+0, 0 
;Emisor.c,36 :: 		PORTB.B0 = 0;
	BCF         PORTB+0, 0 
;Emisor.c,38 :: 		TRISB.B4 = 1; //  rb4 entrada
	BSF         TRISB+0, 4 
;Emisor.c,40 :: 		TRISC.B6 = 0; //salida Tx
	BCF         TRISC+0, 6 
;Emisor.c,41 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;Emisor.c,43 :: 		INTCON.PEIE = 0; // core
	BCF         INTCON+0, 6 
;Emisor.c,44 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;Emisor.c,45 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Emisor.c,46 :: 		INTCON.RBIF = 0; // flag a 0
	BCF         INTCON+0, 0 
;Emisor.c,47 :: 		INTCON.RBIE = 1; //interrupción por cambio de nivel
	BSF         INTCON+0, 3 
;Emisor.c,48 :: 		INTCON.GIE = 1; // se habilitan las interrupciones
	BSF         INTCON+0, 7 
;Emisor.c,50 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Emisor.c,51 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;Emisor.c,53 :: 		while(1)
L_main9:
;Emisor.c,55 :: 		PORTB.B0=1;
	BSF         PORTB+0, 0 
;Emisor.c,56 :: 		Delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	NOP
;Emisor.c,57 :: 		PORTB.B0=0;
	BCF         PORTB+0, 0 
;Emisor.c,58 :: 		Delay_ms(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;Emisor.c,59 :: 		}
	GOTO        L_main9
;Emisor.c,60 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

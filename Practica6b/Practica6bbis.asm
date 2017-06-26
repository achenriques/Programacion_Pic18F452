
_interrupt:

;Practica6bbis.c,3 :: 		void interrupt() // rutina de servicio de la interrupción (MikroC)
;Practica6bbis.c,5 :: 		if((INTCON3.INT1IF)&&(INTCON3.INT1IE))
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
	BTFSS       INTCON3+0, 3 
	GOTO        L_interrupt2
L__interrupt7:
;Practica6bbis.c,7 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;Practica6bbis.c,8 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;Practica6bbis.c,9 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica6bbis.c,10 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica6bbis.c,11 :: 		INTCON3.INT1IE=0;
	BCF         INTCON3+0, 3 
;Practica6bbis.c,12 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica6bbis.c,13 :: 		}
L_interrupt2:
;Practica6bbis.c,14 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt3
;Practica6bbis.c,15 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica6bbis.c,16 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica6bbis.c,17 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica6bbis.c,18 :: 		cont++;
	INCF        _cont+0, 1 
;Practica6bbis.c,19 :: 		if(cont==2)
	MOVF        _cont+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;Practica6bbis.c,21 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;Practica6bbis.c,22 :: 		cont = 0;
	CLRF        _cont+0 
;Practica6bbis.c,23 :: 		INTCON3.INT1IF=0;
	BCF         INTCON3+0, 0 
;Practica6bbis.c,24 :: 		INTCON3.INT1IE=1;
	BSF         INTCON3+0, 3 
;Practica6bbis.c,25 :: 		T0CON.B7 = 0;
	BCF         T0CON+0, 7 
;Practica6bbis.c,26 :: 		}
L_interrupt4:
;Practica6bbis.c,27 :: 		}
L_interrupt3:
;Practica6bbis.c,28 :: 		PORTD=cont;
	MOVF        _cont+0, 0 
	MOVWF       PORTD+0 
;Practica6bbis.c,29 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt

_main:

;Practica6bbis.c,31 :: 		void main()
;Practica6bbis.c,33 :: 		TRISB.B1=1;
	BSF         TRISB+0, 1 
;Practica6bbis.c,34 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica6bbis.c,36 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica6bbis.c,37 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;Practica6bbis.c,39 :: 		TRISD=0;
	CLRF        TRISD+0 
;Practica6bbis.c,40 :: 		PORTD=0;
	CLRF        PORTD+0 
;Practica6bbis.c,43 :: 		INTCON.PEIE = 0;   // es una interrupción de tipo core
	BCF         INTCON+0, 6 
;Practica6bbis.c,44 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica6bbis.c,45 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica6bbis.c,46 :: 		INTCON.TMR0IE = 0; // se habilita la interrupción del Timer 0
	BCF         INTCON+0, 5 
;Practica6bbis.c,49 :: 		INTCON2.INTEDG1=0; //Habilitamos interrupciones RB0
	BCF         INTCON2+0, 5 
;Practica6bbis.c,50 :: 		INTCON3.INT1IF=0;
	BCF         INTCON3+0, 0 
;Practica6bbis.c,51 :: 		INTCON3.INT1IE=1;
	BSF         INTCON3+0, 3 
;Practica6bbis.c,53 :: 		INTCON.GIE = 1;    // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Practica6bbis.c,58 :: 		while(1)
L_main5:
;Practica6bbis.c,59 :: 		{}
	GOTO        L_main5
;Practica6bbis.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

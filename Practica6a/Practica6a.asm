
_interrupt:

;Practica6a.c,1 :: 		void interrupt() // rutina de servicio de la interrupción (MikroC)
;Practica6a.c,3 :: 		if(PORTC.B0){
	BTFSS       PORTC+0, 0 
	GOTO        L_interrupt0
;Practica6a.c,4 :: 		T0CON = 0xC2;       //Para 0.7 señal baja
	MOVLW       194
	MOVWF       T0CON+0 
;Practica6a.c,5 :: 		TMR0L = 81;
	MOVLW       81
	MOVWF       TMR0L+0 
;Practica6a.c,6 :: 		}else{
	GOTO        L_interrupt1
L_interrupt0:
;Practica6a.c,7 :: 		T0CON = 0xC1;       //Para 0.3 señal alta
	MOVLW       193
	MOVWF       T0CON+0 
;Practica6a.c,8 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;Practica6a.c,9 :: 		}
L_interrupt1:
;Practica6a.c,11 :: 		PORTC.B0=~PORTC.B0;
	BTG         PORTC+0, 0 
;Practica6a.c,13 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica6a.c,14 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;Practica6a.c,15 :: 		void main()
;Practica6a.c,17 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica6a.c,18 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;Practica6a.c,20 :: 		INTCON.PEIE = 0;   // es una interrupción de tipo core
	BCF         INTCON+0, 6 
;Practica6a.c,21 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica6a.c,22 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica6a.c,23 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica6a.c,25 :: 		INTCON.GIE = 1;    // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Practica6a.c,27 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;Practica6a.c,28 :: 		TMR0L = 106;       //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       106
	MOVWF       TMR0L+0 
;Practica6a.c,30 :: 		while(1)
L_main2:
;Practica6a.c,31 :: 		{}
	GOTO        L_main2
;Practica6a.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

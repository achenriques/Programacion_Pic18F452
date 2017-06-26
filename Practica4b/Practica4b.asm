
_interrupt:

;Practica4b.c,5 :: 		void interrupt(){
;Practica4b.c,6 :: 		if((INTCON.INT0IE) && (INTCON.INT0IF)){
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
L__interrupt21:
;Practica4b.c,8 :: 		INTCON.INT0IF=0;    //Deshabilitar flag de interrupción.
	BCF         INTCON+0, 1 
;Practica4b.c,9 :: 		if(aux==0)
	MOVF        _aux+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt3
;Practica4b.c,11 :: 		PORTC=4;
	MOVLW       4
	MOVWF       PORTC+0 
;Practica4b.c,12 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
;Practica4b.c,13 :: 		PORTC=8;
	MOVLW       8
	MOVWF       PORTC+0 
;Practica4b.c,14 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	DECFSZ      R11, 1, 1
	BRA         L_interrupt5
;Practica4b.c,15 :: 		PORTC=3;
	MOVLW       3
	MOVWF       PORTC+0 
;Practica4b.c,16 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt6:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt6
	DECFSZ      R12, 1, 1
	BRA         L_interrupt6
	DECFSZ      R11, 1, 1
	BRA         L_interrupt6
;Practica4b.c,17 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4b.c,18 :: 		}
L_interrupt3:
;Practica4b.c,20 :: 		if(aux==1)
	MOVF        _aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt7
;Practica4b.c,22 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica4b.c,23 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt8:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt8
	DECFSZ      R12, 1, 1
	BRA         L_interrupt8
	DECFSZ      R11, 1, 1
	BRA         L_interrupt8
;Practica4b.c,24 :: 		PORTC=8;
	MOVLW       8
	MOVWF       PORTC+0 
;Practica4b.c,25 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
;Practica4b.c,26 :: 		PORTC=4;
	MOVLW       4
	MOVWF       PORTC+0 
;Practica4b.c,27 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt10:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt10
	DECFSZ      R12, 1, 1
	BRA         L_interrupt10
	DECFSZ      R11, 1, 1
	BRA         L_interrupt10
;Practica4b.c,28 :: 		PORTC=2;
	MOVLW       2
	MOVWF       PORTC+0 
;Practica4b.c,29 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt11:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt11
	DECFSZ      R12, 1, 1
	BRA         L_interrupt11
	DECFSZ      R11, 1, 1
	BRA         L_interrupt11
;Practica4b.c,30 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica4b.c,31 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt12:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt12
	DECFSZ      R12, 1, 1
	BRA         L_interrupt12
	DECFSZ      R11, 1, 1
	BRA         L_interrupt12
;Practica4b.c,32 :: 		PORTC=8;
	MOVLW       8
	MOVWF       PORTC+0 
;Practica4b.c,33 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt13:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt13
	DECFSZ      R12, 1, 1
	BRA         L_interrupt13
	DECFSZ      R11, 1, 1
	BRA         L_interrupt13
;Practica4b.c,34 :: 		PORTC=4;
	MOVLW       4
	MOVWF       PORTC+0 
;Practica4b.c,35 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt14:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt14
	DECFSZ      R12, 1, 1
	BRA         L_interrupt14
	DECFSZ      R11, 1, 1
	BRA         L_interrupt14
;Practica4b.c,36 :: 		PORTC=2;
	MOVLW       2
	MOVWF       PORTC+0 
;Practica4b.c,37 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt15:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt15
	DECFSZ      R12, 1, 1
	BRA         L_interrupt15
	DECFSZ      R11, 1, 1
	BRA         L_interrupt15
;Practica4b.c,38 :: 		PORTC=3;
	MOVLW       3
	MOVWF       PORTC+0 
;Practica4b.c,39 :: 		DELAY_MS(200);   //VUELVE A 90º
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt16:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt16
	DECFSZ      R12, 1, 1
	BRA         L_interrupt16
	DECFSZ      R11, 1, 1
	BRA         L_interrupt16
;Practica4b.c,40 :: 		}
L_interrupt7:
;Practica4b.c,41 :: 		aux=!aux;
	MOVF        _aux+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       _aux+0 
;Practica4b.c,42 :: 		}
L_interrupt2:
;Practica4b.c,43 :: 		}
L_end_interrupt:
L__interrupt23:
	RETFIE      1
; end of _interrupt

_main:

;Practica4b.c,46 :: 		void main() {
;Practica4b.c,48 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica4b.c,49 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica4b.c,50 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica4b.c,51 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4b.c,54 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;Practica4b.c,55 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica4b.c,56 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica4b.c,57 :: 		INTCON.PEIE=0;
	BCF         INTCON+0, 6 
;Practica4b.c,58 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica4b.c,60 :: 		RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Practica4b.c,66 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica4b.c,67 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
;Practica4b.c,68 :: 		PORTC=6;
	MOVLW       6
	MOVWF       PORTC+0 
;Practica4b.c,69 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
;Practica4b.c,70 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4b.c,72 :: 		while(1){}
L_main19:
	GOTO        L_main19
;Practica4b.c,73 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

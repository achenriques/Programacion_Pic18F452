
_main:

;Practica4.c,1 :: 		void main() {
;Practica4.c,3 :: 		char aux=0;
	CLRF        main_aux_L0+0 
;Practica4.c,5 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica4.c,6 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica4.c,7 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica4.c,8 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4.c,13 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica4.c,14 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
;Practica4.c,15 :: 		PORTC=6;
	MOVLW       6
	MOVWF       PORTC+0 
;Practica4.c,16 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
;Practica4.c,17 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4.c,19 :: 		while(1){
L_main2:
;Practica4.c,20 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
;Practica4.c,21 :: 		if(PORTB.B0==0 && aux==0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main7
	MOVF        main_aux_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
L__main21:
;Practica4.c,23 :: 		aux=1;
	MOVLW       1
	MOVWF       main_aux_L0+0 
;Practica4.c,24 :: 		PORTC=4;
	MOVLW       4
	MOVWF       PORTC+0 
;Practica4.c,25 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
;Practica4.c,26 :: 		PORTC=12;
	MOVLW       12
	MOVWF       PORTC+0 
;Practica4.c,27 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
;Practica4.c,28 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4.c,29 :: 		}
L_main7:
;Practica4.c,31 :: 		if(PORTB.B0==0 && aux==1)
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	MOVF        main_aux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main20:
;Practica4.c,33 :: 		aux=0;
	CLRF        main_aux_L0+0 
;Practica4.c,34 :: 		PORTC=8;
	MOVLW       8
	MOVWF       PORTC+0 
;Practica4.c,35 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
;Practica4.c,36 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica4.c,37 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
;Practica4.c,38 :: 		PORTC=2;
	MOVLW       2
	MOVWF       PORTC+0 
;Practica4.c,39 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
;Practica4.c,40 :: 		PORTC=4;
	MOVLW       4
	MOVWF       PORTC+0 
;Practica4.c,41 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
;Practica4.c,42 :: 		PORTC=8;
	MOVLW       8
	MOVWF       PORTC+0 
;Practica4.c,43 :: 		DELAY_MS(200);
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
;Practica4.c,44 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica4.c,45 :: 		DELAY_MS(200);
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
;Practica4.c,46 :: 		PORTC=6;
	MOVLW       6
	MOVWF       PORTC+0 
;Practica4.c,47 :: 		DELAY_MS(200);   //VUELVE A 90º
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
;Practica4.c,48 :: 		}
L_main12:
;Practica4.c,51 :: 		}
	GOTO        L_main2
;Practica4.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

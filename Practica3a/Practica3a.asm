
_main:

;Practica3a.c,1 :: 		void main() {
;Practica3a.c,6 :: 		aux=0;
	CLRF        R1 
;Practica3a.c,7 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica3a.c,8 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica3a.c,9 :: 		RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Practica3a.c,16 :: 		while(1){
L_main0:
;Practica3a.c,17 :: 		if(PORTB.B0==1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main2
;Practica3a.c,18 :: 		aux=0;
	CLRF        R1 
L_main2:
;Practica3a.c,19 :: 		if(PORTB.B0==0 && aux==0){
	BTFSC       PORTB+0, 0 
	GOTO        L_main5
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
L__main7:
;Practica3a.c,20 :: 		PORTB.B1= ~PORTB.B1;  //Cambia estado salida led.
	BTG         PORTB+0, 1 
;Practica3a.c,21 :: 		aux=1;
	MOVLW       1
	MOVWF       R1 
;Practica3a.c,22 :: 		}
L_main5:
;Practica3a.c,23 :: 		DELAY_MS(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;Practica3a.c,24 :: 		}
	GOTO        L_main0
;Practica3a.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main


_main:

;Practica1Led.c,1 :: 		void main() {
;Practica1Led.c,6 :: 		TRISA=0x00;
	CLRF        TRISA+0 
;Practica1Led.c,7 :: 		TRISB=0x00;
	CLRF        TRISB+0 
;Practica1Led.c,8 :: 		TRISC=0x00;
	CLRF        TRISC+0 
;Practica1Led.c,9 :: 		PORTA=0x01;
	MOVLW       1
	MOVWF       PORTA+0 
;Practica1Led.c,10 :: 		PORTB=0x01;
	MOVLW       1
	MOVWF       PORTB+0 
;Practica1Led.c,11 :: 		PORTC=0x00;
	CLRF        PORTC+0 
;Practica1Led.c,18 :: 		while(1){
L_main0:
;Practica1Led.c,19 :: 		PORTC=1;
	MOVLW       1
	MOVWF       PORTC+0 
;Practica1Led.c,20 :: 		PORTA=1;
	MOVLW       1
	MOVWF       PORTA+0 
;Practica1Led.c,21 :: 		DELAY_MS(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;Practica1Led.c,22 :: 		for(i=0;i<7;i++){
	CLRF        R2 
L_main3:
	MOVLW       7
	SUBWF       R2, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;Practica1Led.c,23 :: 		PORTC=(PORTC<<1);
	MOVF        PORTC+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;Practica1Led.c,24 :: 		PORTA=(PORTA<<1);
	MOVF        PORTA+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       PORTA+0 
;Practica1Led.c,25 :: 		DELAY_MS(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Practica1Led.c,22 :: 		for(i=0;i<7;i++){
	INCF        R2, 1 
;Practica1Led.c,26 :: 		}
	GOTO        L_main3
L_main4:
;Practica1Led.c,28 :: 		for(i=0;i<7;i++){
	CLRF        R2 
L_main7:
	MOVLW       7
	SUBWF       R2, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;Practica1Led.c,29 :: 		PORTC=(PORTC>>1);
	MOVF        PORTC+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;Practica1Led.c,30 :: 		PORTA=(PORTA>>1);
	MOVF        PORTA+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       PORTA+0 
;Practica1Led.c,31 :: 		DELAY_MS(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;Practica1Led.c,28 :: 		for(i=0;i<7;i++){
	INCF        R2, 1 
;Practica1Led.c,32 :: 		}
	GOTO        L_main7
L_main8:
;Practica1Led.c,34 :: 		PORTC=0xFF;
	MOVLW       255
	MOVWF       PORTC+0 
;Practica1Led.c,35 :: 		DELAY_MS(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	NOP
;Practica1Led.c,36 :: 		}
	GOTO        L_main0
;Practica1Led.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

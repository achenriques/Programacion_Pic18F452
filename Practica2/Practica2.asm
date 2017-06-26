
_main:

;Practica2.c,1 :: 		void main() {
;Practica2.c,6 :: 		char digit[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
	MOVLW       63
	MOVWF       main_digit_L0+0 
	MOVLW       6
	MOVWF       main_digit_L0+1 
	MOVLW       91
	MOVWF       main_digit_L0+2 
	MOVLW       79
	MOVWF       main_digit_L0+3 
	MOVLW       102
	MOVWF       main_digit_L0+4 
	MOVLW       109
	MOVWF       main_digit_L0+5 
	MOVLW       125
	MOVWF       main_digit_L0+6 
	MOVLW       7
	MOVWF       main_digit_L0+7 
	MOVLW       127
	MOVWF       main_digit_L0+8 
	MOVLW       111
	MOVWF       main_digit_L0+9 
;Practica2.c,10 :: 		TRISC=0x00;
	CLRF        TRISC+0 
;Practica2.c,11 :: 		TRISD=0x00;
	CLRF        TRISD+0 
;Practica2.c,12 :: 		PORTC=0x00;
	CLRF        PORTC+0 
;Practica2.c,13 :: 		PORTD=0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Practica2.c,20 :: 		while(1){
L_main0:
;Practica2.c,21 :: 		for(i=0;i<6;i++)
	CLRF        R1 
L_main2:
	MOVLW       6
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica2.c,23 :: 		decenas=digit[i];
	MOVLW       main_digit_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_digit_L0+0)
	MOVWF       FSR0H 
	MOVF        R1, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
;Practica2.c,24 :: 		for(j=0;j<=9;j++){
	CLRF        R2 
L_main5:
	MOVF        R2, 0 
	SUBLW       9
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;Practica2.c,25 :: 		unidades=digit[j];
	MOVLW       main_digit_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_digit_L0+0)
	MOVWF       FSR0H 
	MOVF        R2, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
;Practica2.c,26 :: 		for(k=0;k<25;k++){
	CLRF        R3 
L_main8:
	MOVLW       25
	SUBWF       R3, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;Practica2.c,27 :: 		PortC=decenas;
	MOVF        R5, 0 
	MOVWF       PORTC+0 
;Practica2.c,28 :: 		PortD=0xFE;
	MOVLW       254
	MOVWF       PORTD+0 
;Practica2.c,29 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
	NOP
;Practica2.c,30 :: 		PORTD=0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Practica2.c,31 :: 		PortC=unidades;
	MOVF        R4, 0 
	MOVWF       PORTC+0 
;Practica2.c,32 :: 		PortD=0xFD;
	MOVLW       253
	MOVWF       PORTD+0 
;Practica2.c,33 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	NOP
	NOP
;Practica2.c,34 :: 		PORTD=0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Practica2.c,26 :: 		for(k=0;k<25;k++){
	INCF        R3, 1 
;Practica2.c,35 :: 		}
	GOTO        L_main8
L_main9:
;Practica2.c,24 :: 		for(j=0;j<=9;j++){
	INCF        R2, 1 
;Practica2.c,36 :: 		}
	GOTO        L_main5
L_main6:
;Practica2.c,21 :: 		for(i=0;i<6;i++)
	INCF        R1, 1 
;Practica2.c,37 :: 		}
	GOTO        L_main2
L_main3:
;Practica2.c,38 :: 		}
	GOTO        L_main0
;Practica2.c,39 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

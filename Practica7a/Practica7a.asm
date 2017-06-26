
_interrupt:

;Practica7a.c,22 :: 		void interrupt(){
;Practica7a.c,23 :: 		if(PIR1.ADIF)
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt0
;Practica7a.c,25 :: 		aux=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
;Practica7a.c,26 :: 		aux=aux+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _aux+0, 0 
	ADDWF       R0, 1 
	MOVF        _aux+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
;Practica7a.c,28 :: 		result=aux*0.0048828;
	CALL        _word2double+0, 0
	MOVLW       229
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _result+0 
	MOVF        R1, 0 
	MOVWF       _result+1 
	MOVF        R2, 0 
	MOVWF       _result+2 
	MOVF        R3, 0 
	MOVWF       _result+3 
;Practica7a.c,30 :: 		FloatToStr (result, txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Practica7a.c,31 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica7a.c,33 :: 		T0CON = 0x84;     //Inicio reloj otra vez
	MOVLW       132
	MOVWF       T0CON+0 
;Practica7a.c,34 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica7a.c,35 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica7a.c,37 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica7a.c,38 :: 		}
L_interrupt0:
;Practica7a.c,40 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;Practica7a.c,43 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;Practica7a.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Practica7a.c,45 :: 		T0CON.B7 = 0; //Detengo reloj para realizar conversión
	BCF         T0CON+0, 7 
;Practica7a.c,46 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica7a.c,47 :: 		}
L_interrupt1:
;Practica7a.c,48 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;Practica7a.c,50 :: 		void main() {
;Practica7a.c,52 :: 		TRISA=0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;Practica7a.c,53 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica7a.c,54 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;Practica7a.c,59 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica7a.c,60 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica7a.c,61 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica7a.c,63 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica7a.c,64 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica7a.c,66 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;Practica7a.c,67 :: 		ADCON0=0x41;
	MOVLW       65
	MOVWF       ADCON0+0 
;Practica7a.c,68 :: 		Lcd_Init ();
	CALL        _Lcd_Init+0, 0
;Practica7a.c,71 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;Practica7a.c,72 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica7a.c,73 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica7a.c,75 :: 		while(1)
L_main2:
;Practica7a.c,76 :: 		{}
	GOTO        L_main2
;Practica7a.c,77 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

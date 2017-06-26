
_interrupt:

;Practica7b.c,22 :: 		void interrupt(){
;Practica7b.c,23 :: 		if(PIR1.ADIF)
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt0
;Practica7b.c,26 :: 		aux=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
;Practica7b.c,27 :: 		aux=aux+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _aux+0, 1 
	MOVF        R1, 0 
	ADDWFC      _aux+1, 1 
;Practica7b.c,28 :: 		aux=500;
	MOVLW       244
	MOVWF       _aux+0 
	MOVLW       1
	MOVWF       _aux+1 
;Practica7b.c,29 :: 		result=aux*0.0048875;
	MOVLW       102
	MOVWF       _result+0 
	MOVLW       102
	MOVWF       _result+1 
	MOVLW       28
	MOVWF       _result+2 
	MOVLW       128
	MOVWF       _result+3 
;Practica7b.c,30 :: 		WordToStr(aux, txt);
	MOVLW       244
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       1
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Practica7b.c,34 :: 		T0CON = 0x85;     //Inicio reloj otra vez
	MOVLW       133
	MOVWF       T0CON+0 
;Practica7b.c,35 :: 		TMR0H = (3036 >>8);  //2 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica7b.c,36 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica7b.c,38 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica7b.c,39 :: 		}
L_interrupt0:
;Practica7b.c,41 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;Practica7b.c,44 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;Practica7b.c,45 :: 		T0CON.B7 = 0; //Detengo reloj para realizar conversión
	BCF         T0CON+0, 7 
;Practica7b.c,46 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica7b.c,47 :: 		}
L_interrupt1:
;Practica7b.c,48 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;Practica7b.c,50 :: 		void main() {
;Practica7b.c,52 :: 		TRISE=0xFF;
	MOVLW       255
	MOVWF       TRISE+0 
;Practica7b.c,54 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica7b.c,55 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;Practica7b.c,59 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica7b.c,60 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica7b.c,61 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica7b.c,63 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica7b.c,66 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;Practica7b.c,67 :: 		ADCON0=0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;Practica7b.c,68 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica7b.c,72 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica7b.c,73 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica7b.c,74 :: 		LCD_Out(1,1,"Hola");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Practica7b+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Practica7b+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica7b.c,75 :: 		while(1)
L_main2:
;Practica7b.c,76 :: 		{}
	GOTO        L_main2
;Practica7b.c,77 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

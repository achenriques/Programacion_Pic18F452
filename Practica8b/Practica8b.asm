
_interrupt:

;Practica8b.c,23 :: 		void interrupt(){
;Practica8b.c,25 :: 		if(PIR1.ADIF)
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt0
;Practica8b.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Practica8b.c,28 :: 		aux=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       _aux+0 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       _aux+1 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       _aux+2 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       _aux+3 
;Practica8b.c,29 :: 		aux=aux+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	CALL        _word2double+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;Practica8b.c,31 :: 		aux=aux*0.0048875; //valor de lamda
	MOVLW       82
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;Practica8b.c,32 :: 		aux=((5.0/aux)-1);
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;Practica8b.c,33 :: 		(aux=aux*270000.0);
	MOVLW       0
	MOVWF       R4 
	MOVLW       214
	MOVWF       R5 
	MOVLW       3
	MOVWF       R6 
	MOVLW       145
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;Practica8b.c,36 :: 		result=(3950*298)/(298*log(aux/15000)+3950);
	MOVLW       0
	MOVWF       R4 
	MOVLW       96
	MOVWF       R5 
	MOVLW       106
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_log_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_log_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_log_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_log_x+3 
	CALL        _log+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       21
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       224
	MOVWF       R5 
	MOVLW       118
	MOVWF       R6 
	MOVLW       138
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       96
	MOVWF       R0 
	MOVLW       176
	MOVWF       R1 
	MOVLW       15
	MOVWF       R2 
	MOVLW       147
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _result+0 
	MOVF        R1, 0 
	MOVWF       _result+1 
	MOVF        R2, 0 
	MOVWF       _result+2 
	MOVF        R3, 0 
	MOVWF       _result+3 
;Practica8b.c,37 :: 		result=result-273.15;  //Pasamos a centigrados
	MOVLW       51
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _result+0 
	MOVF        R1, 0 
	MOVWF       _result+1 
	MOVF        R2, 0 
	MOVWF       _result+2 
	MOVF        R3, 0 
	MOVWF       _result+3 
;Practica8b.c,38 :: 		FloatToStr (result, txt);
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
;Practica8b.c,39 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8b.c,40 :: 		Lcd_Out_CP ("  C");
	MOVLW       ?lstr1_Practica8b+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_Practica8b+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8b.c,42 :: 		T0CON = 0x83;     //Inicio reloj otra vez
	MOVLW       131
	MOVWF       T0CON+0 
;Practica8b.c,43 :: 		TMR0H = (3036 >>8);  //0.5 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica8b.c,44 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica8b.c,46 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica8b.c,47 :: 		}
L_interrupt0:
;Practica8b.c,49 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;Practica8b.c,51 :: 		ADCON0.B2=1;  //Se inicia conversion AD
	BSF         ADCON0+0, 2 
;Practica8b.c,52 :: 		T0CON.B7 = 0; //Detengo reloj para realizar conversión
	BCF         T0CON+0, 7 
;Practica8b.c,53 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica8b.c,54 :: 		}
L_interrupt1:
;Practica8b.c,55 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;Practica8b.c,57 :: 		void main() {
;Practica8b.c,59 :: 		TRISA.B1=1;
	BSF         TRISA+0, 1 
;Practica8b.c,62 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica8b.c,63 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;Practica8b.c,67 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica8b.c,68 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica8b.c,69 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica8b.c,71 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica8b.c,72 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica8b.c,74 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;Practica8b.c,75 :: 		ADCON0=0x49; //Canal 1
	MOVLW       73
	MOVWF       ADCON0+0 
;Practica8b.c,76 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica8b.c,79 :: 		T0CON = 0x83;
	MOVLW       131
	MOVWF       T0CON+0 
;Practica8b.c,80 :: 		TMR0H = (3036 >>8);  //0.5 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica8b.c,81 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica8b.c,83 :: 		while(1)
L_main2:
;Practica8b.c,84 :: 		{}
	GOTO        L_main2
;Practica8b.c,85 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

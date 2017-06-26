
_interrupt:

;Practica7c.c,23 :: 		void interrupt(){
;Practica7c.c,24 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;Practica7c.c,26 :: 		if(cont<2)
	MOVLW       0
	SUBWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt12
	MOVLW       2
	SUBWF       _cont+0, 0 
L__interrupt12:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt1
;Practica7c.c,27 :: 		cont++;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
	GOTO        L_interrupt2
L_interrupt1:
;Practica7c.c,29 :: 		cont=0;
	CLRF        _cont+0 
	CLRF        _cont+1 
L_interrupt2:
;Practica7c.c,30 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica7c.c,32 :: 		PIR1.ADIF=1;
	BSF         PIR1+0, 6 
;Practica7c.c,34 :: 		}
L_interrupt0:
;Practica7c.c,36 :: 		if(PIR1.ADIF)
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt3
;Practica7c.c,39 :: 		aux=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
;Practica7c.c,40 :: 		aux=aux+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	ADDWF       _aux+0, 1 
	MOVF        R1, 0 
	ADDWFC      _aux+1, 1 
;Practica7c.c,42 :: 		if(cont==0)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt13
	MOVLW       0
	XORWF       _cont+0, 0 
L__interrupt13:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;Practica7c.c,44 :: 		result=aux*0.48875;
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       113
	MOVWF       R4 
	MOVLW       61
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
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
;Practica7c.c,45 :: 		FloatToStr (result, txt);
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
;Practica7c.c,46 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica7c.c,47 :: 		Lcd_Out_CP ("  C");
	MOVLW       ?lstr1_Practica7c+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_Practica7c+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica7c.c,48 :: 		}
L_interrupt4:
;Practica7c.c,49 :: 		if(cont==1)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt14
	MOVLW       1
	XORWF       _cont+0, 0 
L__interrupt14:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
;Practica7c.c,51 :: 		result=(((aux*0.48875)*1.8)+32.0);
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       113
	MOVWF       R4 
	MOVLW       61
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _result+0 
	MOVF        R1, 0 
	MOVWF       _result+1 
	MOVF        R2, 0 
	MOVWF       _result+2 
	MOVF        R3, 0 
	MOVWF       _result+3 
;Practica7c.c,52 :: 		FloatToStr (result, txt);
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
;Practica7c.c,53 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica7c.c,54 :: 		Lcd_Out_CP ("  F");
	MOVLW       ?lstr2_Practica7c+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_Practica7c+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica7c.c,55 :: 		}
L_interrupt5:
;Practica7c.c,56 :: 		if(cont==2)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt15
	MOVLW       2
	XORWF       _cont+0, 0 
L__interrupt15:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
;Practica7c.c,58 :: 		result=((aux*0.48875)+273.0);
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       113
	MOVWF       R4 
	MOVLW       61
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       128
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _result+0 
	MOVF        R1, 0 
	MOVWF       _result+1 
	MOVF        R2, 0 
	MOVWF       _result+2 
	MOVF        R3, 0 
	MOVWF       _result+3 
;Practica7c.c,59 :: 		FloatToStr (result, txt);
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
;Practica7c.c,60 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica7c.c,61 :: 		Lcd_Out_CP ("  K");
	MOVLW       ?lstr3_Practica7c+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Practica7c+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica7c.c,62 :: 		}
L_interrupt6:
;Practica7c.c,67 :: 		T0CON = 0x85;     //Inicio reloj otra vez
	MOVLW       133
	MOVWF       T0CON+0 
;Practica7c.c,68 :: 		TMR0H = (3036 >>8);  //2 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica7c.c,69 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica7c.c,71 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica7c.c,72 :: 		}
L_interrupt3:
;Practica7c.c,74 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt7
;Practica7c.c,76 :: 		ADCON0.B2=1;  //Se inicia conversion AD
	BSF         ADCON0+0, 2 
;Practica7c.c,77 :: 		T0CON.B7 = 0; //Detengo reloj para realizar conversión
	BCF         T0CON+0, 7 
;Practica7c.c,78 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica7c.c,79 :: 		}
L_interrupt7:
;Practica7c.c,80 :: 		}
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt

_main:

;Practica7c.c,82 :: 		void main() {
;Practica7c.c,84 :: 		TRISE.B1=1;
	BSF         TRISE+0, 1 
;Practica7c.c,85 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;Practica7c.c,87 :: 		INTCON.INT0IF=0; //Interrupciones A.RB0
	BCF         INTCON+0, 1 
;Practica7c.c,88 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica7c.c,89 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;Practica7c.c,92 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica7c.c,93 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;Practica7c.c,97 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica7c.c,98 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica7c.c,99 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica7c.c,101 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica7c.c,102 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica7c.c,104 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;Practica7c.c,105 :: 		ADCON0=0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;Practica7c.c,106 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica7c.c,111 :: 		T0CON = 0x85;
	MOVLW       133
	MOVWF       T0CON+0 
;Practica7c.c,112 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica7c.c,113 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica7c.c,115 :: 		while(1)
L_main8:
;Practica7c.c,116 :: 		{}
	GOTO        L_main8
;Practica7c.c,117 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

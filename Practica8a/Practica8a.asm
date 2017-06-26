
_interrupt:

;Practica8a.c,23 :: 		void interrupt(){
;Practica8a.c,24 :: 		if(INTCON3.INT2IF)
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt0
;Practica8a.c,26 :: 		if(cont<7)
	MOVLW       0
	SUBWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt17
	MOVLW       7
	SUBWF       _cont+0, 0 
L__interrupt17:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt1
;Practica8a.c,27 :: 		cont++;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
	GOTO        L_interrupt2
L_interrupt1:
;Practica8a.c,29 :: 		cont=0;
	CLRF        _cont+0 
	CLRF        _cont+1 
L_interrupt2:
;Practica8a.c,30 :: 		INTCON3.INT2IF=0;
	BCF         INTCON3+0, 1 
;Practica8a.c,32 :: 		PIR1.ADIF=1;
	BSF         PIR1+0, 6 
;Practica8a.c,33 :: 		}
L_interrupt0:
;Practica8a.c,35 :: 		if(PIR1.ADIF)
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt3
;Practica8a.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Practica8a.c,38 :: 		aux=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
;Practica8a.c,39 :: 		aux=aux+(ADRESH<<8);
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
;Practica8a.c,41 :: 		result=aux*0.0048875; //valor de lamda
	CALL        _word2double+0, 0
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
	MOVWF       _result+0 
	MOVF        R1, 0 
	MOVWF       _result+1 
	MOVF        R2, 0 
	MOVWF       _result+2 
	MOVF        R3, 0 
	MOVWF       _result+3 
;Practica8a.c,42 :: 		result=((result*22.2)+10.5);   //KPa
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       49
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       40
	MOVWF       R6 
	MOVLW       130
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
;Practica8a.c,44 :: 		if(cont==0)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt18
	MOVLW       0
	XORWF       _cont+0, 0 
L__interrupt18:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;Practica8a.c,46 :: 		FloatToStr (result, txt);
	MOVF        _result+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _result+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _result+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _result+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Practica8a.c,47 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,48 :: 		Lcd_Out_CP ("  KPa");
	MOVLW       ?lstr1_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,49 :: 		}
L_interrupt4:
;Practica8a.c,50 :: 		if(cont==1)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt19
	MOVLW       1
	XORWF       _cont+0, 0 
L__interrupt19:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
;Practica8a.c,52 :: 		result=(result*0.145);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       225
	MOVWF       R4 
	MOVLW       122
	MOVWF       R5 
	MOVLW       20
	MOVWF       R6 
	MOVLW       124
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
;Practica8a.c,53 :: 		FloatToStr (result, txt);
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
;Practica8a.c,54 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,55 :: 		Lcd_Out_CP ("  PSI");
	MOVLW       ?lstr2_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,56 :: 		}
L_interrupt5:
;Practica8a.c,57 :: 		if(cont==2)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt20
	MOVLW       2
	XORWF       _cont+0, 0 
L__interrupt20:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
;Practica8a.c,59 :: 		result=(result*0.009869);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       150
	MOVWF       R4 
	MOVLW       177
	MOVWF       R5 
	MOVLW       33
	MOVWF       R6 
	MOVLW       120
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
;Practica8a.c,60 :: 		FloatToStr (result, txt);
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
;Practica8a.c,61 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,62 :: 		Lcd_Out_CP ("  Atm");
	MOVLW       ?lstr3_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,63 :: 		}
L_interrupt6:
;Practica8a.c,64 :: 		if(cont==3)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt21
	MOVLW       3
	XORWF       _cont+0, 0 
L__interrupt21:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt7
;Practica8a.c,66 :: 		result=(result*10);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
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
;Practica8a.c,67 :: 		FloatToStr (result, txt);
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
;Practica8a.c,68 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,69 :: 		Lcd_Out_CP ("  mBar");
	MOVLW       ?lstr4_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,70 :: 		}
L_interrupt7:
;Practica8a.c,71 :: 		if(cont==4)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt22
	MOVLW       4
	XORWF       _cont+0, 0 
L__interrupt22:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt8
;Practica8a.c,73 :: 		result=(result*7.5);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       129
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
;Practica8a.c,74 :: 		FloatToStr (result, txt);
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
;Practica8a.c,75 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,76 :: 		Lcd_Out_CP ("  mmHg");
	MOVLW       ?lstr5_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,77 :: 		}
L_interrupt8:
;Practica8a.c,78 :: 		if(cont==5)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt23
	MOVLW       5
	XORWF       _cont+0, 0 
L__interrupt23:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt9
;Practica8a.c,80 :: 		result=(result*1000);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       136
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
;Practica8a.c,81 :: 		FloatToStr (result, txt);
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
;Practica8a.c,82 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,83 :: 		Lcd_Out_CP ("  N/m2");
	MOVLW       ?lstr6_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,84 :: 		}
L_interrupt9:
;Practica8a.c,85 :: 		if(cont==6)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt24
	MOVLW       6
	XORWF       _cont+0, 0 
L__interrupt24:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt10
;Practica8a.c,87 :: 		result=(result*0.0102);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       231
	MOVWF       R4 
	MOVLW       29
	MOVWF       R5 
	MOVLW       39
	MOVWF       R6 
	MOVLW       120
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
;Practica8a.c,88 :: 		FloatToStr (result, txt);
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
;Practica8a.c,89 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,90 :: 		Lcd_Out_CP ("  Kg/cm2");
	MOVLW       ?lstr7_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,91 :: 		}
L_interrupt10:
;Practica8a.c,92 :: 		if(cont==7)
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt25
	MOVLW       7
	XORWF       _cont+0, 0 
L__interrupt25:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt11
;Practica8a.c,94 :: 		result=(result*0.1019);
	MOVF        _result+0, 0 
	MOVWF       R0 
	MOVF        _result+1, 0 
	MOVWF       R1 
	MOVF        _result+2, 0 
	MOVWF       R2 
	MOVF        _result+3, 0 
	MOVWF       R3 
	MOVLW       242
	MOVWF       R4 
	MOVLW       176
	MOVWF       R5 
	MOVLW       80
	MOVWF       R6 
	MOVLW       123
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
;Practica8a.c,95 :: 		FloatToStr (result, txt);
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
;Practica8a.c,96 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,97 :: 		Lcd_Out_CP ("  Kp/cm2");
	MOVLW       ?lstr8_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,98 :: 		}
L_interrupt11:
;Practica8a.c,100 :: 		T0CON = 0x84;     //Inicio reloj otra vez
	MOVLW       132
	MOVWF       T0CON+0 
;Practica8a.c,101 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica8a.c,102 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica8a.c,104 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica8a.c,105 :: 		}
L_interrupt3:
;Practica8a.c,107 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt12
;Practica8a.c,109 :: 		ADCON0.B2=1;  //Se inicia conversion AD
	BSF         ADCON0+0, 2 
;Practica8a.c,110 :: 		T0CON.B7 = 0; //Detengo reloj para realizar conversión
	BCF         T0CON+0, 7 
;Practica8a.c,111 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;Practica8a.c,112 :: 		}
L_interrupt12:
;Practica8a.c,113 :: 		}
L_end_interrupt:
L__interrupt16:
	RETFIE      1
; end of _interrupt

_main:

;Practica8a.c,115 :: 		void main() {
;Practica8a.c,117 :: 		TRISE.B0=1;
	BSF         TRISE+0, 0 
;Practica8a.c,118 :: 		TRISB.B2=1;
	BSF         TRISB+0, 2 
;Practica8a.c,120 :: 		INTCON3.INT2IF=0; //Interrupciones A.RB0
	BCF         INTCON3+0, 1 
;Practica8a.c,121 :: 		INTCON3.INT2IE=1;
	BSF         INTCON3+0, 4 
;Practica8a.c,122 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;Practica8a.c,123 :: 		RBPU_BIT=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Practica8a.c,125 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica8a.c,126 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;Practica8a.c,130 :: 		RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;Practica8a.c,131 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica8a.c,132 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica8a.c,134 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica8a.c,135 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica8a.c,137 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;Practica8a.c,138 :: 		ADCON0=0x69; //Canal 5
	MOVLW       105
	MOVWF       ADCON0+0 
;Practica8a.c,140 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica8a.c,143 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;Practica8a.c,144 :: 		TMR0H = (3036 >>8);  //1 seg en modo 16 bits
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica8a.c,145 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica8a.c,147 :: 		while(1)
L_main13:
;Practica8a.c,148 :: 		{}
	GOTO        L_main13
;Practica8a.c,149 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

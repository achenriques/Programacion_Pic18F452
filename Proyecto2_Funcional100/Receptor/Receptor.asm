
_interrupt:

;Receptor.c,19 :: 		void interrupt()
;Receptor.c,21 :: 		if(PIR1.RCIF)
	BTFSS       PIR1+0, 5 
	GOTO        L_interrupt0
;Receptor.c,23 :: 		recibido = 0;
	CLRF        _recibido+0 
	CLRF        _recibido+1 
;Receptor.c,24 :: 		for( i=0;i<2;i++)
	CLRF        _i+0 
L_interrupt1:
	MOVLW       2
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
;Receptor.c,26 :: 		while(UART1_Data_Ready() != 1);
L_interrupt4:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt5
	GOTO        L_interrupt4
L_interrupt5:
;Receptor.c,27 :: 		recibido = recibido + (UART1_Read()<<(8*i));
	CALL        _UART1_Read+0, 0
	MOVLW       3
	MOVWF       R3 
	MOVF        _i+0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVF        R3, 0 
L__interrupt11:
	BZ          L__interrupt12
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	ADDLW       255
	GOTO        L__interrupt11
L__interrupt12:
	MOVF        R1, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVF        R3, 0 
L__interrupt13:
	BZ          L__interrupt14
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	ADDLW       255
	GOTO        L__interrupt13
L__interrupt14:
	MOVF        R1, 0 
	ADDWF       _recibido+0, 1 
	MOVF        R2, 0 
	ADDWFC      _recibido+1, 1 
;Receptor.c,24 :: 		for( i=0;i<2;i++)
	INCF        _i+0, 1 
;Receptor.c,28 :: 		}
	GOTO        L_interrupt1
L_interrupt2:
;Receptor.c,29 :: 		aux = recibido * 1.6570e-2;
	MOVF        _recibido+0, 0 
	MOVWF       R0 
	MOVF        _recibido+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       207
	MOVWF       R4 
	MOVLW       189
	MOVWF       R5 
	MOVLW       7
	MOVWF       R6 
	MOVLW       121
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
;Receptor.c,30 :: 		FloatToStr(aux,txt);
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
;Receptor.c,31 :: 		LCD_CMD("LCD_CLEAR");
	MOVLW       ?lstr_1_Receptor+0
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Receptor.c,32 :: 		Lcd_out(1,1,txt);;
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Receptor.c,33 :: 		}
L_interrupt0:
;Receptor.c,34 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;Receptor.c,35 :: 		void main()
;Receptor.c,37 :: 		TRISC.B7=1;
	BSF         TRISC+0, 7 
;Receptor.c,39 :: 		RCON.IPEN = 0; //se deshabilitan las interrupciones con prioridad (MikroC)
	BCF         RCON+0, 7 
;Receptor.c,40 :: 		PIR1.RCIF = 0; //se pone a cero el flag de la interrupción RCIE
	BCF         PIR1+0, 5 
;Receptor.c,41 :: 		PIE1.RCIE = 1; // se habilita la interrupción RCIE
	BSF         PIE1+0, 5 
;Receptor.c,42 :: 		INTCON.PEIE = 1; //es de tipo peripheral
	BSF         INTCON+0, 6 
;Receptor.c,43 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Receptor.c,45 :: 		Lcd_Init (); //Se inicia la pantalla LCD
	CALL        _Lcd_Init+0, 0
;Receptor.c,47 :: 		UART1_Init(9600); //Se inicia el transmisor
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Receptor.c,48 :: 		delay_ms(300);    //Esperamos >100ms  antes del primer uso
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;Receptor.c,50 :: 		while(1)
L_main7:
;Receptor.c,51 :: 		{}
	GOTO        L_main7
;Receptor.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

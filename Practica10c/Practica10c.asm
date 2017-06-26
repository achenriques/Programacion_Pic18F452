
_interrupt:

;Practica10c.c,6 :: 		void interrupt()
;Practica10c.c,8 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;Practica10c.c,10 :: 		if (time <= 900)
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _time+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt14
	MOVF        _time+0, 0 
	SUBLW       132
L__interrupt14:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt1
;Practica10c.c,11 :: 		time = time + 100;
	MOVLW       100
	ADDWF       _time+0, 1 
	MOVLW       0
	ADDWFC      _time+1, 1 
L_interrupt1:
;Practica10c.c,13 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica10c.c,14 :: 		}
L_interrupt0:
;Practica10c.c,16 :: 		if(INTCON3.INT1IF)
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
;Practica10c.c,18 :: 		if (time >= 200)
	MOVLW       128
	XORWF       _time+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt15
	MOVLW       200
	SUBWF       _time+0, 0 
L__interrupt15:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt3
;Practica10c.c,19 :: 		time = time - 100;
	MOVLW       100
	SUBWF       _time+0, 1 
	MOVLW       0
	SUBWFB      _time+1, 1 
L_interrupt3:
;Practica10c.c,21 :: 		INTCON3.INT1IF=0;
	BCF         INTCON3+0, 0 
;Practica10c.c,22 :: 		}
L_interrupt2:
;Practica10c.c,23 :: 		}
L_end_interrupt:
L__interrupt13:
	RETFIE      1
; end of _interrupt

_main:

;Practica10c.c,25 :: 		void main() {
;Practica10c.c,27 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica10c.c,28 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica10c.c,30 :: 		INTCON.INT0IF=0; //Interrupciones A.RB0
	BCF         INTCON+0, 1 
;Practica10c.c,31 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica10c.c,32 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;Practica10c.c,35 :: 		INTCON2.INTEDG1=0; //Habilitamos interrupciones RB1
	BCF         INTCON2+0, 5 
;Practica10c.c,36 :: 		INTCON3.INT1IF=0;
	BCF         INTCON3+0, 0 
;Practica10c.c,37 :: 		INTCON3.INT1IE=1;
	BSF         INTCON3+0, 3 
;Practica10c.c,39 :: 		RBPU_BIT=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Practica10c.c,41 :: 		INTCON.GIE = 1;    // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Practica10c.c,46 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;Practica10c.c,48 :: 		while(1)
L_main4:
;Practica10c.c,50 :: 		while(paquete <= 0xFFFE)
L_main6:
	MOVF        _paquete+1, 0 
	SUBLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVF        _paquete+0, 0 
	SUBLW       254
L__main17:
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
;Practica10c.c,52 :: 		paquete = paquete++;
	INFSNZ      _paquete+0, 1 
	INCF        _paquete+1, 1 
;Practica10c.c,54 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        _paquete+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       15
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVLW       48
	IORWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
;Practica10c.c,56 :: 		PORTC.B0 = 0; //Bit CS = 0
	BCF         PORTC+0, 0 
;Practica10c.c,58 :: 		SPI1_Write(aux);
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10c.c,59 :: 		SPI1_Write(paquete);
	MOVF        _paquete+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10c.c,61 :: 		PORTC.B0 = 1; //Bit CS = 0
	BSF         PORTC+0, 0 
;Practica10c.c,63 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	NOP
;Practica10c.c,65 :: 		}
	GOTO        L_main6
L_main7:
;Practica10c.c,67 :: 		while(paquete >= 1)
L_main9:
	MOVLW       0
	SUBWF       _paquete+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       1
	SUBWF       _paquete+0, 0 
L__main18:
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
;Practica10c.c,69 :: 		paquete = paquete--;
	MOVLW       1
	SUBWF       _paquete+0, 1 
	MOVLW       0
	SUBWFB      _paquete+1, 1 
;Practica10c.c,71 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        _paquete+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       15
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVLW       48
	IORWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
;Practica10c.c,73 :: 		PORTC.B0 = 0; //Bit CS = 0
	BCF         PORTC+0, 0 
;Practica10c.c,75 :: 		SPI1_Write(aux);
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10c.c,76 :: 		SPI1_Write(paquete);
	MOVF        _paquete+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10c.c,78 :: 		PORTC.B0 = 1; //Bit CS = 0
	BSF         PORTC+0, 0 
;Practica10c.c,80 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	NOP
;Practica10c.c,81 :: 		}
	GOTO        L_main9
L_main10:
;Practica10c.c,83 :: 		}
	GOTO        L_main4
;Practica10c.c,84 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

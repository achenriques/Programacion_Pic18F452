
_main:

;Practica10b.c,2 :: 		void main() {
;Practica10b.c,4 :: 		char aux = 0;
;Practica10b.c,6 :: 		unsigned int paquete = 0;
	CLRF        main_paquete_L0+0 
	CLRF        main_paquete_L0+1 
;Practica10b.c,8 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica10b.c,10 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;Practica10b.c,12 :: 		while(1)
L_main0:
;Practica10b.c,15 :: 		while(paquete <= 4095)
L_main2:
	MOVF        main_paquete_L0+1, 0 
	SUBLW       15
	BTFSS       STATUS+0, 2 
	GOTO        L__main9
	MOVF        main_paquete_L0+0, 0 
	SUBLW       255
L__main9:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;Practica10b.c,19 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        main_paquete_L0+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       15
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVLW       48
	IORWF       R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
;Practica10b.c,21 :: 		PORTC.B0 = 0; //Bit CS = 0
	BCF         PORTC+0, 0 
;Practica10b.c,23 :: 		SPI1_Write(aux);
	CALL        _SPI1_Write+0, 0
;Practica10b.c,24 :: 		SPI1_Write(paquete);
	MOVF        main_paquete_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10b.c,26 :: 		PORTC.B0 = 1; //Bit CS = 0
	BSF         PORTC+0, 0 
;Practica10b.c,28 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	NOP
;Practica10b.c,29 :: 		paquete = paquete++;
	INFSNZ      main_paquete_L0+0, 1 
	INCF        main_paquete_L0+1, 1 
;Practica10b.c,30 :: 		}
	GOTO        L_main2
L_main3:
;Practica10b.c,32 :: 		while(paquete >= 1)
L_main5:
	MOVLW       0
	SUBWF       main_paquete_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       1
	SUBWF       main_paquete_L0+0, 0 
L__main10:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;Practica10b.c,34 :: 		paquete--;
	MOVLW       1
	SUBWF       main_paquete_L0+0, 1 
	MOVLW       0
	SUBWFB      main_paquete_L0+1, 1 
;Practica10b.c,36 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        main_paquete_L0+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       15
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVLW       48
	IORWF       R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
;Practica10b.c,38 :: 		PORTC.B0 = 0; //Bit CS = 0
	BCF         PORTC+0, 0 
;Practica10b.c,40 :: 		SPI1_Write(aux);
	CALL        _SPI1_Write+0, 0
;Practica10b.c,41 :: 		SPI1_Write(paquete);
	MOVF        main_paquete_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10b.c,43 :: 		PORTC.B0 = 1; //Bit CS = 0
	BSF         PORTC+0, 0 
;Practica10b.c,45 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	NOP
;Practica10b.c,46 :: 		}
	GOTO        L_main5
L_main6:
;Practica10b.c,48 :: 		}
	GOTO        L_main0
;Practica10b.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

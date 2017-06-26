
_interrupt:

;Practica10a.c,3 :: 		void interrupt()
;Practica10a.c,5 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;Practica10a.c,7 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica10a.c,8 :: 		}
L_interrupt0:
;Practica10a.c,10 :: 		if(INTCON3.INT1IF)
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt1
;Practica10a.c,12 :: 		INTCON3.INT1IF=0;
	BCF         INTCON3+0, 0 
;Practica10a.c,13 :: 		}
L_interrupt1:
;Practica10a.c,14 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;Practica10a.c,17 :: 		void main() {
;Practica10a.c,19 :: 		char aux = 0;
;Practica10a.c,20 :: 		int paquete = 0xFFFF;
	MOVLW       255
	MOVWF       main_paquete_L0+0 
	MOVLW       255
	MOVWF       main_paquete_L0+1 
;Practica10a.c,22 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica10a.c,39 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;Practica10a.c,41 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        main_paquete_L0+1, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       main_paquete_L0+1, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       15
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVLW       48
	IORWF       R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
;Practica10a.c,43 :: 		PORTC.B0 = 0; //Bit CS = 0
	BCF         PORTC+0, 0 
;Practica10a.c,45 :: 		SPI1_Write(aux);
	CALL        _SPI1_Write+0, 0
;Practica10a.c,46 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Practica10a.c,48 :: 		PORTC.B0 = 1; //Bit CS = 0
	BSF         PORTC+0, 0 
;Practica10a.c,50 :: 		while(1)
L_main2:
;Practica10a.c,51 :: 		{}
	GOTO        L_main2
;Practica10a.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

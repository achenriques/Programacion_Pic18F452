
_interrupt:

;Practica3c.c,9 :: 		void interrupt(){
;Practica3c.c,10 :: 		if(INTCON.INT0IE && INTCON.INT0IF){
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
L__interrupt9:
;Practica3c.c,12 :: 		INTCON.INT0IF=0;    //Deshabilitar flag de interrupción.
	BCF         INTCON+0, 1 
;Practica3c.c,13 :: 		unidades++;
	INCF        _unidades+0, 1 
;Practica3c.c,14 :: 		if(unidades==10){
	MOVF        _unidades+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt3
;Practica3c.c,15 :: 		unidades=0;
	CLRF        _unidades+0 
;Practica3c.c,16 :: 		decenas++;
	INCF        _decenas+0, 1 
;Practica3c.c,17 :: 		if(decenas==10)
	MOVF        _decenas+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;Practica3c.c,18 :: 		decenas=0;
	CLRF        _decenas+0 
L_interrupt4:
;Practica3c.c,20 :: 		}
L_interrupt3:
;Practica3c.c,21 :: 		}   }
L_interrupt2:
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt

_main:

;Practica3c.c,22 :: 		void main() {
;Practica3c.c,25 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica3c.c,26 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica3c.c,27 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica3c.c,28 :: 		TRISD=0;
	CLRF        TRISD+0 
;Practica3c.c,29 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica3c.c,30 :: 		PORTD=0;
	CLRF        PORTD+0 
;Practica3c.c,33 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;Practica3c.c,34 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica3c.c,35 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica3c.c,36 :: 		INTCON.PEIE=0;
	BCF         INTCON+0, 6 
;Practica3c.c,37 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica3c.c,39 :: 		RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Practica3c.c,47 :: 		while(1){
L_main5:
;Practica3c.c,49 :: 		PortC=digit[decenas];
	MOVLW       _digit+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_digit+0)
	MOVWF       FSR0H 
	MOVF        _decenas+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica3c.c,50 :: 		PortD=0xFE;
	MOVLW       254
	MOVWF       PORTD+0 
;Practica3c.c,51 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;Practica3c.c,52 :: 		PORTD=0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Practica3c.c,53 :: 		PortC=digit[unidades];
	MOVLW       _digit+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_digit+0)
	MOVWF       FSR0H 
	MOVF        _unidades+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica3c.c,54 :: 		PortD=0xFD;
	MOVLW       253
	MOVWF       PORTD+0 
;Practica3c.c,55 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;Practica3c.c,56 :: 		PORTD=0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Practica3c.c,57 :: 		}
	GOTO        L_main5
;Practica3c.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

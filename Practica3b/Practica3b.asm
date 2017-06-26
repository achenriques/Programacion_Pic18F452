
_interrupt:

;Practica3b.c,2 :: 		void interrupt(){
;Practica3b.c,3 :: 		if(INTCON.INT0IE && INTCON.INT0IF){
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
L__interrupt5:
;Practica3b.c,4 :: 		PORTB.B1=~PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3b.c,5 :: 		INTCON.INT0IF=0;    //Deshabilitar flag de interrupción.
	BCF         INTCON+0, 1 
;Practica3b.c,6 :: 		}
L_interrupt2:
;Practica3b.c,7 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;Practica3b.c,9 :: 		void main() {
;Practica3b.c,14 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica3b.c,15 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica3b.c,17 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;Practica3b.c,18 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica3b.c,19 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica3b.c,20 :: 		INTCON.PEIE=0;
	BCF         INTCON+0, 6 
;Practica3b.c,21 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica3b.c,25 :: 		RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;Practica3b.c,32 :: 		while(1){
L_main3:
;Practica3b.c,34 :: 		}
	GOTO        L_main3
;Practica3b.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

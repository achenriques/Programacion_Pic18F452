//Declaracion de var

        char unidades=0;
        char decenas=0;
        char digit[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};


//Operaciones de interrupcion
void interrupt(){
             if(INTCON.INT0IE && INTCON.INT0IF){

                INTCON.INT0IF=0;    //Deshabilitar flag de interrupción.
                unidades++;
                if(unidades==10){
                               unidades=0;
                               decenas++;
                               if(decenas==10)
                                              decenas=0;

        }
}   }
void main() {

//Configuracion puertos
     TRISB=1;
     PORTB=0;
     TRISC=0;
     TRISD=0;
     PORTC=0;
     PORTD=0;

	//Configuracion de interrupcion para RB0
     INTCON2.INTEDG0=0;
     INTCON.INT0IF=0;
     INTCON.INT0IE=1;
     INTCON.PEIE=0;
     INTCON.GIE=1;

     RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.
     

//configuracion modulos

//instrucciones

//bucle infinito
        while(1){

                PortC=digit[decenas];
                PortD=0xFE;
                DELAY_MS(20);
                PORTD=0xFF;
                PortC=digit[unidades];
                PortD=0xFD;
                DELAY_MS(20);
                PORTD=0xFF;
        }
}
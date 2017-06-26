//Operaciones de interrupcion
void interrupt(){
             if(INTCON.INT0IE && INTCON.INT0IF){
                PORTB.B1=~PORTB.B1;
                INTCON.INT0IF=0;    //Deshabilitar flag de interrupción.
             }
        }

void main() {

//Declaracion de var

//Configuracion puertos
     TRISB=1;
     PORTB=0;
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

        }
}
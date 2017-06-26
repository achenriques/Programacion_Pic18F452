//Declaracion de var
              char aux=0;

//Operaciones de interrupcion
void interrupt(){
                if(INTCON.INT0IE && INTCON.INT0IF){

                                 INTCON.INT0IF=0;    //Deshabilitar flag de interrupción.
                                 if(aux==0)
                                 {
                                  aux=1;
                                  PORTC=4;
                                  DELAY_MS(200);
                                  PORTC=12;
                                  DELAY_MS(200);
                                  PORTC=0;
                                  }

                                  if(aux==1)
                                  {
                                   aux=0;
                                   PORTC=8;
                                   DELAY_MS(200);
                                   PORTC=1;
                                   DELAY_MS(200);
                                   PORTC=2;
                                   DELAY_MS(200);
                                   PORTC=4;
                                   DELAY_MS(200);
                                   PORTC=8;
                                   DELAY_MS(200);
                                   PORTC=1;
                                   DELAY_MS(200);
                                   PORTC=6;
                                   DELAY_MS(200);   //VUELVE A 90º
                                  }
                }
}


void main() {
//Configuracion puertos
                TRISB=1;
                TRISC=0;
                PORTB=0;
                PORTC=0;

//Configuracion de interrupcion para RB0
     INTCON2.INTEDG0=0;
     INTCON.INT0IF=0;
     INTCON.INT0IE=1;
     INTCON.PEIE=0;
     INTCON.GIE=1;

     RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.

//configuracion modulos

//instrucciones
               //Poner a -90º
             PORTC=1;
             DELAY_MS(200);
             PORTC=6;
             DELAY_MS(200);
             PORTC=0;
//bucle infinito
   while(1){}
}
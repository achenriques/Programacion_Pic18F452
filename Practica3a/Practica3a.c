void main() {

//Declaracion de var
              char aux=0;
//Configuracion puertos
                TRISB=1;
                PORTB=0;
                RBPU_BIT=0;     //Solo se activan Pull-up en puertos de entrada.

//configuracion modulos

//instrucciones

//bucle infinito
     while(1){
              if(PORTB.B0==1)
                             aux=0;
              if(PORTB.B0==0 && aux==0){
                              PORTB.B1= ~PORTB.B1;  //Cambia estado salida led.
                              aux=1;
              }
              DELAY_MS(100);
     }
}
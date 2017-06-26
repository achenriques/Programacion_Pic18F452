void main() {

//Declaracion de var
          char i;
//Configuracion puertos
                TRISA=0x00;
                TRISB=0x00;
                TRISC=0x00;
                PORTA=0x01;
                PORTB=0x01;
                PORTC=0x00;

//configuracion modulos

//instrucciones

//bucle infinito
     while(1){
              PORTC=1;
              PORTA=1;
              DELAY_MS(250);
              for(i=0;i<7;i++){
                               PORTC=(PORTC<<1);
                               PORTA=(PORTA<<1);
                               DELAY_MS(250);
             }
             
             for(i=0;i<7;i++){
                               PORTC=(PORTC>>1);
                               PORTA=(PORTA>>1);
                               DELAY_MS(250);
             }
             
             PORTC=0xFF;
             DELAY_MS(250);
     }
}
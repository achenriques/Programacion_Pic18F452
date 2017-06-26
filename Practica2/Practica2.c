void main() {
//Declaracion de var
          char i;
          char j;
          char k;
          char digit[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
          char unidades;
          char decenas;
//Configuracion puertos
                TRISC=0x00;
                TRISD=0x00;
                PORTC=0x00;
                PORTD=0xFF;

//configuracion modulos

//instrucciones

//bucle infinito
   while(1){
       for(i=0;i<6;i++)
       {
                         decenas=digit[i];
                         for(j=0;j<=9;j++){
                               unidades=digit[j];
                               for(k=0;k<25;k++){
                                  PortC=decenas;
                                  PortD=0xFE;
                                  DELAY_MS(20);
                                  PORTD=0xFF;
                                  PortC=unidades;
                                  PortD=0xFD;
                                  DELAY_MS(20);
                                  PORTD=0xFF;
                               }
                         }
       }
   }
}
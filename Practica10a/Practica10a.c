

void interrupt()
{
 if(INTCON.INT0IF)
 {
  INTCON.INT0IF=0;
 }

 if(INTCON3.INT1IF)
 {
  INTCON3.INT1IF=0;
 }
}


void main() {
     
     char aux = 0;
     int paquete = 0xFFFF;

     TRISC = 0;
     
     /*TRISB=1;
     
     INTCON.INT0IF=0; //Interrupciones A.RB0
     INTCON.INT0IE=1;
     INTCON2.INTEDG0=1;

     
     INTCON2.INTEDG1=0; //Habilitamos interrupciones RB1
     INTCON3.INT1IF=0;
     INTCON3.INT1IE=1;

     RBPU_BIT=0;

     INTCON.GIE = 1;    // se habilitan las interrupciones en general
     */
     SPI1_Init();
     
     aux = 0x30 | ((paquete >> 8) & 0x0F);

     PORTC.B0 = 0; //Bit CS = 0
     
     SPI1_Write(aux);
     SPI1_Write(0xFF);

     PORTC.B0 = 1; //Bit CS = 0
     
     while(1)
     {}
}
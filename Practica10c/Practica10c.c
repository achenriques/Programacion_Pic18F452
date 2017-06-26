unsigned int time = 100;

char aux = 0;
unsigned int paquete = 0;

void interrupt()
{
         if(INTCON.INT0IF)
         {
          if (time <= 900)
             time = time + 100;

          INTCON.INT0IF=0;
         }

         if(INTCON3.INT1IF)
         {
          if (time >= 200)
             time = time - 100;

          INTCON3.INT1IF=0;
         }
}

void main() {

     TRISB=1;
     TRISC = 0;
     
     INTCON.INT0IF=0; //Interrupciones A.RB0
     INTCON.INT0IE=1;
     INTCON2.INTEDG0=1;


     INTCON2.INTEDG1=0; //Habilitamos interrupciones RB1
     INTCON3.INT1IF=0;
     INTCON3.INT1IE=1;

     RBPU_BIT=0;

     INTCON.GIE = 1;    // se habilitan las interrupciones en general

     


     SPI1_Init();

     while(1)
     {
       while(paquete <= 0xFFFE)
       {
         paquete = paquete++;

         aux = 0x30 | ((paquete >> 8) & 0x0F);

         PORTC.B0 = 0; //Bit CS = 0

         SPI1_Write(aux);
         SPI1_Write(paquete);

         PORTC.B0 = 1; //Bit CS = 0

         delay_us(100);

       }

       while(paquete >= 1)
       {
         paquete = paquete--;

         aux = 0x30 | ((paquete >> 8) & 0x0F);

         PORTC.B0 = 0; //Bit CS = 0

         SPI1_Write(aux);
         SPI1_Write(paquete);

         PORTC.B0 = 1; //Bit CS = 0

         delay_us(time);
       }

     }
}
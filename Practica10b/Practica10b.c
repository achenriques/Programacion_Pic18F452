
void main() {

     char aux = 0;
     //char i = 0;
     unsigned int paquete = 0;

     TRISC = 0;

     SPI1_Init();

     while(1)
     {

       while(paquete <= 4095)
       {

         
         aux = 0x30 | ((paquete >> 8) & 0x0F);
         
         PORTC.B0 = 0; //Bit CS = 0
         
         SPI1_Write(aux);
         SPI1_Write(paquete);

         PORTC.B0 = 1; //Bit CS = 0

         delay_us(100);
                 paquete = paquete++;
       }
       
       while(paquete >= 1)
       {
         paquete--;
         
         aux = 0x30 | ((paquete >> 8) & 0x0F);
         
         PORTC.B0 = 0; //Bit CS = 0

         SPI1_Write(aux);
         SPI1_Write(paquete);

         PORTC.B0 = 1; //Bit CS = 0

         delay_us(100);
       }
       
     }
}
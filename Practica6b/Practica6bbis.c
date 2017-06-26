char cont=0;

void interrupt() // rutina de servicio de la interrupción (MikroC)
{
 if((INTCON3.INT1IF)&&(INTCON3.INT1IE))
 {                                     
            PORTC.B0=1;
            T0CON = 0x84;
            TMR0H = (3036 >>8);  //1 seg en modo 16 bits
            TMR0L = 3036;
            INTCON3.INT1IE=0;
            INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
 }
 if(INTCON.TMR0IF){
                   TMR0H = (3036 >>8);  //1 seg en modo 16 bits
                   TMR0L = 3036;
                   INTCON.TMR0IF = 0; // se borra el flag
                   cont++;
                   if(cont==2)
                   {
                     PORTC.B0=0;
                     cont = 0;
                     INTCON3.INT1IF=0;
                     INTCON3.INT1IE=1;
                     T0CON.B7 = 0;
                   }
 }
   PORTD=cont;
}

void main()
{
  TRISB.B1=1;
  PORTB=0;

  TRISC=0;
  PORTC.B0=0;

  TRISD=0;
  PORTD=0;


 INTCON.PEIE = 0;   // es una interrupción de tipo core
 RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
 INTCON.TMR0IF = 0; // se pone el flag a 0
 INTCON.TMR0IE = 0; // se habilita la interrupción del Timer 0


 INTCON2.INTEDG1=0; //Habilitamos interrupciones RB0
 INTCON3.INT1IF=0;
 INTCON3.INT1IE=1;

 INTCON.GIE = 1;    // se habilitan las interrupciones en general
                    // hay que poner a contar el Timer0



  while(1)
  {}

}
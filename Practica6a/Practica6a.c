void interrupt() // rutina de servicio de la interrupción (MikroC)
{
 if(PORTC.B0){
            T0CON = 0xC2;       //Para 0.7 señal baja
            TMR0L = 81;
 }else{
            T0CON = 0xC1;       //Para 0.3 señal alta
            TMR0L = 106;
      }
 
 PORTC.B0=~PORTC.B0;
 
 INTCON.TMR0IF = 0; // se borra el flag
}
void main()
{
  TRISC=0;
  PORTC.B0=1;

 INTCON.PEIE = 0;   // es una interrupción de tipo core
 RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
 INTCON.TMR0IF = 0; // se pone el flag a 0
 INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0

 INTCON.GIE = 1;    // se habilitan las interrupciones en general
                    // hay que poner a contar el Timer0
 T0CON = 0xC1;
 TMR0L = 106;       //se carga el valor inicial (alfa) del ‘contador’

  while(1)
  {}
  
}
#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica6a/Practica6a.c"
void interrupt()
{
 if(PORTC.B0){
 T0CON = 0xC2;
 TMR0L = 81;
 }else{
 T0CON = 0xC1;
 TMR0L = 106;
 }

 PORTC.B0=~PORTC.B0;

 INTCON.TMR0IF = 0;
}
void main()
{
 TRISC=0;
 PORTC.B0=1;

 INTCON.PEIE = 0;
 RCON.IPEN = 0;
 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;

 INTCON.GIE = 1;

 T0CON = 0xC1;
 TMR0L = 106;

 while(1)
 {}

}

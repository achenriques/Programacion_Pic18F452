#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica6bb/Practica6bbis.c"
char cont=0;

void interrupt()
{
 if((INTCON3.INT1IF)&&(INTCON3.INT1IE))
 {
 PORTC.B0=1;
 T0CON = 0x84;
 TMR0H = (3036 >>8);
 TMR0L = 3036;
 INTCON3.INT1IE=0;
 INTCON.TMR0IE = 1;
 }
 if(INTCON.TMR0IF){
 TMR0H = (3036 >>8);
 TMR0L = 3036;
 INTCON.TMR0IF = 0;
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


 INTCON.PEIE = 0;
 RCON.IPEN = 0;
 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 0;


 INTCON2.INTEDG1=0;
 INTCON3.INT1IF=0;
 INTCON3.INT1IE=1;

 INTCON.GIE = 1;




 while(1)
 {}

}

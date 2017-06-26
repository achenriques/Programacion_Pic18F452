#line 1 "C:/Users/Alex/Desktop/Proyecto2/Emisor/Emisor.c"
char i= 0;
char x = 0;
char flag = 0;
int aux = 0;

void interrupt(){

 if(INTCON.RBIF){
 if(!flag){
 T0CON = 0x80;
 TMR0H = 0;
 TMR0L = 0;
 Flag = 1;
 }
 else
 {
 aux = TMR0L;
 aux = aux + (TMR0H<<8);
 for( i=0;i<2;i++)
 {
 while(UART1_Tx_idle() != 1);
 UART1_Write(aux>>(8*i));
 }
 flag = 0;
 T0CON.B7=0;
 }

 x = portb;
 INTCON.RBIF = 0;
 }
}

void main() {

 TRISB.B0 = 0;
 PORTB.B0 = 0;

 TRISB.B4 = 1;

 TRISC.B6 = 0;
 PORTC.B6 = 1;

 INTCON.PEIE = 0;
 RCON.IPEN = 0;
 x = PORTB;
 INTCON.RBIF = 0;
 INTCON.RBIE = 1;
 INTCON.GIE = 1;

 UART1_Init(9600);
 delay_ms(300);

 while(1)
 {
 PORTB.B0=1;
 Delay_us(10);
 PORTB.B0=0;
 Delay_ms(1500);
 }
}

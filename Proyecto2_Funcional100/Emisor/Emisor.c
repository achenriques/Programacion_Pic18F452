char i= 0;
char x = 0;
char flag = 0;
int aux = 0;

void interrupt(){

   if(INTCON.RBIF){
      if(!flag){
        T0CON = 0x80;  //Timer 16 bits con preescaler 2
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

  TRISB.B0 = 0; // b1 salida
  PORTB.B0 = 0;

  TRISB.B4 = 1; //  rb4 entrada

  TRISC.B6 = 0; //salida Tx
  PORTC.B6 = 1;

  INTCON.PEIE = 0; // core
  RCON.IPEN = 0;
  x = PORTB;
  INTCON.RBIF = 0; // flag a 0
  INTCON.RBIE = 1; //interrupción por cambio de nivel
  INTCON.GIE = 1; // se habilitan las interrupciones

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
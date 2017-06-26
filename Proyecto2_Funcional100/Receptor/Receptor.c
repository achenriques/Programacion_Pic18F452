sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

char i = 0;
char txt[14];
float aux =0.0;
int recibido=0;

void interrupt()
{
 if(PIR1.RCIF)
 {
  recibido = 0;
  for( i=0;i<2;i++)
  {
       while(UART1_Data_Ready() != 1);
       recibido = recibido + (UART1_Read()<<(8*i));
  }
    aux = recibido * 1.6570e-2;
    FloatToStr(aux,txt);
    LCD_CMD("LCD_CLEAR");
    Lcd_out(1,1,txt);;
 }
}
void main()
{
 TRISC.B7=1;

 RCON.IPEN = 0; //se deshabilitan las interrupciones con prioridad (MikroC)
 PIR1.RCIF = 0; //se pone a cero el flag de la interrupción RCIE
 PIE1.RCIE = 1; // se habilita la interrupción RCIE
 INTCON.PEIE = 1; //es de tipo peripheral
 INTCON.GIE = 1; // se habilitan las interrupciones en general

 Lcd_Init (); //Se inicia la pantalla LCD

 UART1_Init(9600); //Se inicia el transmisor
 delay_ms(300);    //Esperamos >100ms  antes del primer uso

 while(1)
 {}
}
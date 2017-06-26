#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica7b/Practica7b.c"



sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

unsigned int aux=0;
char txt [14];
float result=0;

void interrupt(){
 if(PIR1.ADIF)
 {

 aux=ADRESL;
 aux=aux+(ADRESH<<8);
 aux=500;
 result=aux*0.0048875;
 WordToStr(aux, txt);



 T0CON = 0x85;
 TMR0H = (3036 >>8);
 TMR0L = 3036;

 PIR1.ADIF=0;
 }

 if(INTCON.TMR0IF)
 {

 ADCON0.B2=1;
 T0CON.B7 = 0;
 INTCON.TMR0IF = 0;
 }
}

void main() {

 TRISE=0xFF;

 PIR1.ADIF = 0;
 PIE1.ADIE = 1;



 RCON.IPEN = 0;
 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;

 INTCON.PEIE = 1;


 ADCON1=0xC0;
 ADCON0=0x71;
 Lcd_Init();



 TMR0H = (3036 >>8);
 TMR0L = 3036;
 LCD_Out(1,1,"Hola");
 while(1)
 {}
}

#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica7c/Practica7c.c"



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
unsigned int cont=0;

void interrupt(){
 if(INTCON.INT0IF)
 {
 if(cont<2)
 cont++;
 else
 cont=0;
 INTCON.INT0IF=0;

 PIR1.ADIF=1;

 }

 if(PIR1.ADIF)
 {

 aux=ADRESL;
 aux=aux+(ADRESH<<8);

 if(cont==0)
 {
 result=aux*0.48875;
 FloatToStr (result, txt);
 Lcd_out(1,1, txt);
 Lcd_Out_CP ("  C");
 }
 if(cont==1)
 {
 result=(((aux*0.48875)*1.8)+32.0);
 FloatToStr (result, txt);
 Lcd_out(1,1, txt);
 Lcd_Out_CP ("  F");
 }
 if(cont==2)
 {
 result=((aux*0.48875)+273.0);
 FloatToStr (result, txt);
 Lcd_out(1,1, txt);
 Lcd_Out_CP ("  K");
 }




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

 TRISE.B1=1;
 TRISB.B0=1;

 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON2.INTEDG0=1;


 PIR1.ADIF = 0;
 PIE1.ADIE = 1;



 RCON.IPEN = 0;
 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;

 INTCON.PEIE = 1;
 INTCON.GIE = 1;

 ADCON1=0xC0;
 ADCON0=0x71;
 Lcd_Init();




 T0CON = 0x85;
 TMR0H = (3036 >>8);
 TMR0L = 3036;

 while(1)
 {}
}

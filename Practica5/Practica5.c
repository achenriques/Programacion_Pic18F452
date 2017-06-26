# include "Tecla12INT.h"

char x;
unsigned short contador = 0;
char txt[3];

//Configuracion puertos LCD
     // Lcd pinout settings
     sbit LCD_RS at RD2_bit;
     sbit LCD_EN at RD3_bit;
     sbit LCD_D7 at RD7_bit;
     sbit LCD_D6 at RD6_bit;
     sbit LCD_D5 at RD5_bit;
     sbit LCD_D4 at RD4_bit;
     // Pin direction
     sbit LCD_RS_Direction at TRISD2_bit;
     sbit LCD_EN_Direction at TRISD3_bit;
     sbit LCD_D7_Direction at TRISD7_bit;
     sbit LCD_D6_Direction at TRISD6_bit;
     sbit LCD_D5_Direction at TRISD5_bit;
     sbit LCD_D4_Direction at TRISD4_bit;

void interrupt() {

     Lcd_out(1,1,"Your Turn:");
     
     ByteToStr(contador,txt);
     Lcd_out_CP(txt);
     
     if(contador<99)
         contador++;
     else
         contador=0;

     PORTD.B0=1;

     while(PORTB.B4==0);
     PORTD.B0=0;
     
     x=PORTB; //hay que leer el puerto B para poder borrar el bit RBIF (define x global)
     INTCON.RBIF=0;//Al borrar el bit RBIF despues de llamar a la funcion tecla, nos
}           //aseguramos que después de soltar la tecla éste bit se pone a 0.

void main() {
     TRISB=0xF0;
     PORTB=0;
     TRISD.B0=0;
     
     INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
     x=PORTB;//para poder borrar el RBIF
     INTCON.RBIF=0;
     INTCON.RBIE=1;
     INTCON.GIE=1;
     
     Lcd_Init (); //Iniciamos Pantalla LCD
     
     //Solo se ejecuta 1 vez
     x=PORTB;
     INTCON.RBIF=1;
     //Lcd_Chr_CP(48);         //Empezamos mostrando 0

     while(1) {}

}
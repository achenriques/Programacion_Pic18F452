//variables globales

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

unsigned int aux=0;
char txt [14];
float result=0;

void interrupt(){
     if(PIR1.ADIF)
     {
        aux=ADRESL;
        aux=aux+(ADRESH<<8);
        
        result=aux*0.0048828;
        
        FloatToStr (result, txt);
        Lcd_out(1,1, txt);
        
        T0CON = 0x84;     //Inicio reloj otra vez
        TMR0H = (3036 >>8);  //1 seg en modo 16 bits
        TMR0L = 3036;
        
        PIR1.ADIF=0;
     }
     
     if(INTCON.TMR0IF)
     {
        
        ADCON0.B2=1;
        Lcd_Cmd(_LCD_CLEAR);
        T0CON.B7 = 0; //Detengo reloj para realizar conversión
        INTCON.TMR0IF = 0; // se borra el flag
     }
}

void main() {

     TRISA=0xFF;
     PIR1.ADIF = 0;
     PIE1.ADIE = 1;
     
     
      //Timer
     //INTCON.PEIE = 0;   // es una interrupción de tipo core
     RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
     INTCON.TMR0IF = 0; // se pone el flag a 0
     INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
     
     INTCON.PEIE = 1;
     INTCON.GIE = 1;
     
     ADCON1=0xC0;
     ADCON0=0x41;
     Lcd_Init ();
     
//Empezamos temporizaciones de 1 segundo
     T0CON = 0x84;
     TMR0H = (3036 >>8);  //1 seg en modo 16 bits
     TMR0L = 3036;
     
     while(1)
     {}
}
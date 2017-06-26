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
        //Lcd_Cmd(_LCD_CLEAR);
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

        //result=aux*0.48875;


        T0CON = 0x85;     //Inicio reloj otra vez
        TMR0H = (3036 >>8);  //2 seg en modo 16 bits
        TMR0L = 3036;

        PIR1.ADIF=0;
     }

     if(INTCON.TMR0IF)
     {
        ADCON0.B2=1;  //Se inicia conversion AD
        T0CON.B7 = 0; //Detengo reloj para realizar conversión
        INTCON.TMR0IF = 0; // se borra el flag
     }
}

void main() {

     TRISE.B1=1;
     TRISB.B0=1;

     INTCON.INT0IF=0; //Interrupciones A.RB0
     INTCON.INT0IE=1;
     INTCON2.INTEDG0=1;
     //RBPU_BIT=0;

     PIR1.ADIF = 0;
     PIE1.ADIE = 1;


      //Timer
     RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
     INTCON.TMR0IF = 0; // se pone el flag a 0
     INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0

     INTCON.PEIE = 1;
     INTCON.GIE = 1;

     ADCON1=0xC0;
     ADCON0=0x71;
     Lcd_Init();

     //LCD_Out(1,1,"Hola");

//Empezamos temporizaciones de 2 segundos
     T0CON = 0x85;
     TMR0H = (3036 >>8);  //1 seg en modo 16 bits
     TMR0L = 3036;

     while(1)
     {}
}
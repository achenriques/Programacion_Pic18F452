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
     if(INTCON3.INT2IF)
     {
          if(cont<7)
           cont++;
          else
           cont=0;
         INTCON3.INT2IF=0;

         PIR1.ADIF=1;
     }

     if(PIR1.ADIF)
     {
        Lcd_Cmd(_LCD_CLEAR);
        aux=ADRESL;
        aux=aux+(ADRESH<<8);
        
        result=aux*0.0048875; //valor de lamda
        result=((result*22.2)+10.5);   //KPa

        if(cont==0)
         {
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  KPa");
         }
         if(cont==1)
         {
            result=(result*0.145);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  PSI");
         }
         if(cont==2)
         {
            result=(result*0.009869);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  Atm");
         }
         if(cont==3)
         {
            result=(result*10);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  mBar");
         }
         if(cont==4)
         {
            result=(result*7.5);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  mmHg");
         }
         if(cont==5)
         {
            result=(result*1000);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  N/m2");
         }
         if(cont==6)
         {
            result=(result*0.0102);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  Kg/cm2");
         }
         if(cont==7)
         {
            result=(result*0.1019);
            FloatToStr (result, txt);
            Lcd_out(1,1, txt);
            Lcd_Out_CP ("  Kp/cm2");
         }

        T0CON = 0x84;     //Inicio reloj otra vez
        TMR0H = (3036 >>8);  //1 seg en modo 16 bits
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

     TRISE.B0=1;
     TRISB.B2=1;

     INTCON3.INT2IF=0; //Interrupciones A.RB0
     INTCON3.INT2IE=1;
     INTCON2.INTEDG0=1;
     RBPU_BIT=0;

     PIR1.ADIF = 0;
     PIE1.ADIE = 1;


      //Timer
     RCON.IPEN = 0;     // se deshabilitan las interrupciones con prioridad
     INTCON.TMR0IF = 0; // se pone el flag a 0
     INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0

     INTCON.PEIE = 1;
     INTCON.GIE = 1;

     ADCON1=0xC0;
     ADCON0=0x69; //Canal 5
     //ADCON0=0x71;       //Canal 6
     Lcd_Init();

//Empezamos temporizaciones de 1 segundos
     T0CON = 0x84;
     TMR0H = (3036 >>8);  //1 seg en modo 16 bits
     TMR0L = 3036;

     while(1)
     {}
}
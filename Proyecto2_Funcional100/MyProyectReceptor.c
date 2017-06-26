        char txt[16];
        char aux;
        char *punt;
        float salida;
        short nivel = 0;

    // Lcd pinout settings
        sbit LCD_RS at RC0_bit;
        sbit LCD_EN at RC1_bit;
        sbit LCD_D7 at RB7_bit;
        sbit LCD_D6 at RB6_bit;
        sbit LCD_D5 at RB5_bit;
        sbit LCD_D4 at RB4_bit;
    // Pin direction
        sbit LCD_RS_Direction at TRISC0_bit;
        sbit LCD_EN_Direction at TRISC1_bit;
        sbit LCD_D7_Direction at TRISB7_bit;
        sbit LCD_D6_Direction at TRISB6_bit;
        sbit LCD_D5_Direction at TRISB5_bit;
        sbit LCD_D4_Direction at TRISB4_bit;

void interrupt(){

     PIR1.RCIF = 0; // se borra el flag de la interrupción RCIE
     aux = UART1_Read(); //se guarda el valor recibido en la variable aux
     punt = &salida;
     
     *(punt+nivel) = aux;
     
     
     
     nivel++;
     if(nivel > 3){
         Lcd_Cmd(_LCD_CLEAR);
         FloatToStr(salida,txt);
         LCD_out(1,1,txt);
         nivel = 0;
         salida = 0;
     }
}

void main(){
     UART1_Init(9600);
     delay_ms(300);
     LCD_INIT();
     TRISC.B0 = 0;
     TRISC.B1 = 0;
     TRISC.B7 = 1;

     RCON.IPEN = 0; //se deshabilitan las interrupciones con prioridad (MikroC)
     PIR1.RCIF = 0; //se pone a cero el flag de la interrupción RCIE
     PIE1.RCIE = 1; // se habilita la interrupción RCIE
     INTCON.PEIE = 1; //es de tipo peripheral
     INTCON.GIE = 1; // se habilitan las interrupciones en general



     while(1){}

}
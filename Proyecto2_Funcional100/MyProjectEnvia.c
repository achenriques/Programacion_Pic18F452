short x =0;
        unsigned short contador = 0;
        char txt[16];
        unsigned int aux2;
        float salida ;
        char* aux;
void interrupt(){

     if(INTCON.RBIF == 1 ){
        x = PORTB; // hay que leer el puerto B antes de borrar el flag
        INTCON.RBIF = 0; // se borra el flag
        contador = !contador;
        if(contador == 1){
           T0CON = 0x90;
           TMR0H = 0;
           TMR0L = 0;
        }
        if(contador == 0){
           T0CON = 0x10;
           aux2 = TMR0L;
           aux2 = aux2 + (TMR0H << 8);

           salida = aux2*(1.6570e-2);

           
           UART1_Write(*aux);     //se envía el byte 1 salida
           delay_ms(100);
           UART1_Write(*(aux+1)); //se envía el byte 2 salida
           delay_ms(100);
           UART1_Write(*(aux+2)); //se envía el byte 3 salida
           delay_ms(100);
           UART1_Write(*(aux+3)); //se envía el byte 4 salida
           delay_ms(100);

        }
     }
}
void main(){
     TRISB.B0 = 0;   // Salida // TRIGGER
     TRISC.B6 = 0;
     TRISB.B4 = 1;   // Entrada // ECHO
     aux = &salida;
     UART1_Init(9600);
     delay_ms(300);

     // Configuracion de la interrupcion ECHO
     INTCON.PEIE = 0; // es de tipo core
     RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
     x = PORTB; // x es una variable de 8 bis.
     INTCON.RBIF = 0; // se pone el flag a 0
     INTCON.RBIE = 1; // se habilita la interrupción por cambio de nivel
     INTCON.GIE = 1; // se habilitan las interrupciones en general
     // Configuracion del Timer
     T0CON = 0x10;
     INTCON.PEIE = 0; // es una interrupción de tipo core
     RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
     INTCON.TMR0IF = 0; // se pone el flag a 0
     INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
     TMR0H = 0;
     TMR0L = 0; //se carga el valor inicial (alfa) del ‘contador’

     INTCON.GIE = 1; // se habilitan las interrupciones en general
     while(1){
        PORTB.B0 = 1;
        delay_us(50);
        PORTB.B0 = 0;
        delay_ms(1500);

     }
}
#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica4b/Practica4b.c"

 char aux=0;


void interrupt(){
 if((INTCON.INT0IE) && (INTCON.INT0IF)){

 INTCON.INT0IF=0;
 if(aux==0)
 {
 PORTC=4;
 DELAY_MS(200);
 PORTC=8;
 DELAY_MS(200);
 PORTC=3;
 DELAY_MS(200);
 PORTC=0;
 }

 if(aux==1)
 {
 PORTC=1;
 DELAY_MS(200);
 PORTC=8;
 DELAY_MS(200);
 PORTC=4;
 DELAY_MS(200);
 PORTC=2;
 DELAY_MS(200);
 PORTC=1;
 DELAY_MS(200);
 PORTC=8;
 DELAY_MS(200);
 PORTC=4;
 DELAY_MS(200);
 PORTC=2;
 DELAY_MS(200);
 PORTC=3;
 DELAY_MS(200);
 }
 aux=!aux;
 }
}


void main() {

 TRISB=1;
 TRISC=0;
 PORTB=0;
 PORTC=0;


 INTCON2.INTEDG0=0;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.PEIE=0;
 INTCON.GIE=1;

 RBPU_BIT=0;





 PORTC=1;
 DELAY_MS(200);
 PORTC=6;
 DELAY_MS(200);
 PORTC=0;

 while(1){}
}

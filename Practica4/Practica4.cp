#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica4/Practica4.c"
void main() {

 char aux=0;

 TRISB=1;
 TRISC=0;
 PORTB=0;
 PORTC=0;




 PORTC=1;
 DELAY_MS(200);
 PORTC=6;
 DELAY_MS(200);
 PORTC=0;

 while(1){
 DELAY_MS(200);
 if(PORTB.B0==0 && aux==0)
 {
 aux=1;
 PORTC=4;
 DELAY_MS(200);
 PORTC=12;
 DELAY_MS(200);
 PORTC=0;
 }

 if(PORTB.B0==0 && aux==1)
 {
 aux=0;
 PORTC=8;
 DELAY_MS(200);
 PORTC=1;
 DELAY_MS(200);
 PORTC=2;
 DELAY_MS(200);
 PORTC=4;
 DELAY_MS(200);
 PORTC=8;
 DELAY_MS(200);
 PORTC=1;
 DELAY_MS(200);
 PORTC=6;
 DELAY_MS(200);
 }


 }
}

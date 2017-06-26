#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica3b/Practica3b.c"

void interrupt(){
 if(INTCON.INT0IE && INTCON.INT0IF){
 PORTB.B1=~PORTB.B1;
 INTCON.INT0IF=0;
 }
 }

void main() {




 TRISB=1;
 PORTB=0;

 INTCON2.INTEDG0=0;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.PEIE=0;
 INTCON.GIE=1;



 RBPU_BIT=0;






 while(1){

 }
}

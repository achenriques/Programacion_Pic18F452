#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica3a/Practica3a.c"
void main() {


 char aux;

 aux=0;
 TRISB=1;
 PORTB=0;
 RBPU_BIT=0;






 while(1){
 if(PORTB.B0==1)
 aux=0;
 if(PORTB.B0==0 && aux==0){
 PORTB.B1= ~PORTB.B1;
 aux=1;
 }
 DELAY_MS(100);
 }
}

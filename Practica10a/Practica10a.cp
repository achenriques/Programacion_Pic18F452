#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica10a/Practica10a.c"


void interrupt()
{
 if(INTCON.INT0IF)
 {
 INTCON.INT0IF=0;
 }

 if(INTCON3.INT1IF)
 {
 INTCON3.INT1IF=0;
 }
}


void main() {

 char aux = 0;
 int paquete = 0xFFFF;

 TRISC = 0;
#line 39 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Jueves de 9 a 11/Practica10a/Practica10a.c"
 SPI1_Init();

 aux = 0x30 | ((paquete >> 8) & 0x0F);

 PORTC.B0 = 0;

 SPI1_Write(aux);
 SPI1_Write(0xFF);

 PORTC.B0 = 1;

 while(1)
 {}
}

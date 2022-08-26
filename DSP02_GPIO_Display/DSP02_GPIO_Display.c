#include "config.h"
#include "numeros.h"
#include "letras.h"

#define MAX 9
#define MIN 0

int display_1 = 0, display_2 = 0, display_3 = 0, display_4 = 0;
int contador = 0;
int contador_letras = 0;
///////////////////////////////// funciones para numeros
int obtener_numero(int numero){
    return segmentos[numero];
}

int pintar_led(int a, int b){
     int num_1 = obtener_numero(a);
     int num_2 = obtener_numero(b);
     return num_1 |(num_2 << 8);
}
void mover_datos(){
     display_4 = display_3;
     display_3 = display_2;
     display_2 = display_1;
     display_1 = contador;
     DISPLAY_A = pintar_led(display_4, display_3);
     DISPLAY_B = pintar_led(display_2, display_1);
}
void proceso_numeros(){
     mover_datos();
     if(contador == MAX){
                 contador = 0;
     }else{
           contador++;
     }
}
//++++++++++++++++++++++++++++++funciones para nombres
int pintar_letra( unsigned int a, unsigned int b){
     return a |(b << 8);
}
void mover_letras(char nombre[]){
     int maximo = strlen(andres);
     if(contador_letras == maximo){
                        contador_letras == 0;
     }
     display_4 = display_3;
     display_3 = display_2;
     display_2 = display_1;
     display_1 = andres[contador_letras];
     DISPLAY_A = pintar_letra(display_4, display_3);
     DISPLAY_B = pintar_letra(display_2, display_1);
}
void mover_letras_1(char nombre[]){
     int maximo = strlen(luis);
     if(contador_letras == maximo){
                        contador_letras == 0;
     }
     display_4 = display_3;
     display_3 = display_2;
     display_2 = display_1;
     display_1 = luis[contador_letras];
     DISPLAY_A = pintar_letra(display_4, display_3);
     DISPLAY_B = pintar_letra(display_2, display_1);
}
void mover_letras_2(char nombre[]){
     int maximo = strlen(jose);
     if(contador_letras == maximo){
                        contador_letras == 0;
     }
     display_4 = display_3;
     display_3 = display_2;
     display_2 = display_1;
     display_1 = jose[contador_letras];
     DISPLAY_A = pintar_letra(display_4, display_3);
     DISPLAY_B = pintar_letra(display_2, display_1);
}
void main() {
     init_program();
     while(1){
            if(BOTON_1 == 0){
                       mover_letras(andres);
                       contador_letras++;
                       delay_ms(100);
                       
                       continue;
            }
            if(BOTON_2 == 0){
                     mover_letras_1(luis);
                     contador_letras++;
                     delay_ms(100);
                     continue;
            }
            if(BOTON_3 == 0){
                     mover_letras_2(jose);
                     contador_letras++;
                     delay_ms(100);
                     continue;
            }
            contador_letras = 0;
            proceso_numeros();
            delay_ms(100);
     }
}
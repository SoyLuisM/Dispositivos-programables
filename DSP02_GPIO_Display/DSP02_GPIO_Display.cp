#line 1 "C:/Users/s_k_a/Desktop/dispositivos programables/Dispositivos-programables/DSP02_GPIO_Display/DSP02_GPIO_Display.c"
#line 1 "c:/users/s_k_a/desktop/dispositivos programables/dispositivos-programables/dsp02_gpio_display/config.h"






void init_program() {
 GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13 | _GPIO_PINMASK_14 | _GPIO_PINMASK_15, _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13 | _GPIO_PINMASK_14 | _GPIO_PINMASK_15, _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
}
#line 1 "c:/users/s_k_a/desktop/dispositivos programables/dispositivos-programables/dsp02_gpio_display/numeros.h"
#line 12 "c:/users/s_k_a/desktop/dispositivos programables/dispositivos-programables/dsp02_gpio_display/numeros.h"
const unsigned int segmentos[]={ 0XC0 , 0XF9 , 0XA4 , 0XB0 , 0X99 , 0X92 , 0X82 , 0XF8 ,  0X80 , 0X90  };
#line 1 "c:/users/s_k_a/desktop/dispositivos programables/dispositivos-programables/dsp02_gpio_display/letras.h"
#line 22 "c:/users/s_k_a/desktop/dispositivos programables/dispositivos-programables/dsp02_gpio_display/letras.h"
const unsigned int andres[]={ 0x88 , 0xAB , 0xA1 , 0xAF , 0x84 , 0x92 , 0XFF , 0x86 , 0x92 , 0xA7 , 0xA0 , 0xF9 , 0xA0 };
const unsigned int luis[]={ 0xC7 , 0xE3 , 0xCF , 0x92 , 0XFF , 0xC8 , 0xA0 , 0xAF , 0x87 , 0xCF , 0xAB , 0x84 , 0xA4 };
const unsigned int jose[]={ 0xF1 , 0xA3 , 0x92 , 0x84 , 0XFF , 0x88 , 0xAF , 0xA0 , 0xC8 , 0x83 , 0xE3 , 0xF9 , 0xA3 };
#line 8 "C:/Users/s_k_a/Desktop/dispositivos programables/Dispositivos-programables/DSP02_GPIO_Display/DSP02_GPIO_Display.c"
int display_1 = 0, display_2 = 0, display_3 = 0, display_4 = 0;
int contador = 0;
int contador_letras = 0;

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
  GPIOA_ODR  = pintar_led(display_4, display_3);
  GPIOB_ODR  = pintar_led(display_2, display_1);
}
void proceso_numeros(){
 mover_datos();
 if(contador ==  9 ){
 contador = 0;
 }else{
 contador++;
 }
}

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
  GPIOA_ODR  = pintar_letra(display_4, display_3);
  GPIOB_ODR  = pintar_letra(display_2, display_1);
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
  GPIOA_ODR  = pintar_letra(display_4, display_3);
  GPIOB_ODR  = pintar_letra(display_2, display_1);
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
  GPIOA_ODR  = pintar_letra(display_4, display_3);
  GPIOB_ODR  = pintar_letra(display_2, display_1);
}
void main() {
 init_program();
 while(1){
 if( GPIOC_IDR.B0  == 0){
 mover_letras(andres);
 contador_letras++;
 delay_ms(100);

 continue;
 }
 if( GPIOC_IDR.B1  == 0){
 mover_letras_1(luis);
 contador_letras++;
 delay_ms(100);
 continue;
 }
 if( GPIOC_IDR.B2  == 0){
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

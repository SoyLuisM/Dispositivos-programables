#line 1 "C:/Users/s_k_a/Desktop/dispositivos programables/Dispositivos-programables/DSP02_GPIO_Display/DSP02_GPIO_Display.c"
#line 33 "C:/Users/s_k_a/Desktop/dispositivos programables/Dispositivos-programables/DSP02_GPIO_Display/DSP02_GPIO_Display.c"
const unsigned short int segmentos[]={ 0XC0 , 0XF9 , 0XA4 , 0XB0 , 0X99 , 0X92 , 0X82 , 0XF8 ,  0X80 , 0X90 , 0X88 , 0X83 , 0XA7 , 0XA1 , 0X86 , 0X8E ,  0X8C , 0XAF , 0X88 , 0XA7 , 0X87 , 0XF9 , 0XA7 , 0X88 , 0XFF , 0XA4  };
int contador =0;
void init_program() {
 GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 , _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
}

void proceso(){
 if( GPIOA_IDR.B0 ==0){
  GPIOB_ODR  = segmentos[contador];
 if(contador == 26){
 contador = 0;
 }
 delay_ms(100);
 }
}
void main() {
 init_program();
 while(1){
 proceso();
 }
}

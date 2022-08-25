#define BOTON GPIOA_IDR.B0
#define DISPLAY GPIOB_ODR

#define CERO 0XC0
#define UNO 0XF9
#define DOS 0XA4
#define TRES 0XB0
#define CUATRO 0X99
#define CINCO 0X92
#define SEIS 0X82
#define SIETE 0XF8
#define OCHO 0X80
#define NUEVE 0X90
#define CARA 0X88
#define CARB 0X83
#define CARC 0XA7
#define CARD 0XA1
#define CARE 0X86
#define CARF 0X8E
#define CARP 0X8C
#define CARR 0XAF
#define CART 0X87
#define CARI 0XF9
#define CAR 0XFF
#define SEGa 0XFE
#define SEGb 0XFD
#define SEGc 0XFB
#define SEGd 0XF7
#define SEGe 0XEF
#define SEGf 0XDF
#define SEGg 0XBF

const unsigned short int segmentos[]={CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,SIETE, OCHO,NUEVE,CARA,CARB,CARC,CARD,CARE,CARF, CARP,CARR,CARA,CARC,CART,CARI,CARC,CARA,CAR,DOS };
int contador =0;
void init_program() {
    GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0); //Entrada flotante usando el botón de usuario (PB8) //(ConfiguraR como PULL-UP Entrada normalmente en alto y el botón se activa en bajo)
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 , _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
}

void proceso(){
     if(BOTON==0){
                  DISPLAY = segmentos[contador];
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
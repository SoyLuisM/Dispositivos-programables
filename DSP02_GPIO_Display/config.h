#define UNO GPIOA_ODR.B0


void init_input(){
    GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
    GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0);
    GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_0);
}

void init_output(){
    GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_1  _GPIO_PINMASK_2  _GPIO_PINMASK_3  _GPIO_PINMASK_4  _GPIO_PINMASK_5  _GPIO_PINMASK_6  _GPIO_PINMASK_7  _GPIO_PINMASK_8  _GPIO_PINMASK_9  _GPIO_PINMASK_10);
    GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_1  _GPIO_PINMASK_2  _GPIO_PINMASK_3  _GPIO_PINMASK_4  _GPIO_PINMASK_5  _GPIO_PINMASK_6  _GPIO_PINMASK_7  _GPIO_PINMASK_8  _GPIO_PINMASK_9  _GPIO_PINMASK_10);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_1  _GPIO_PINMASK_2  _GPIO_PINMASK_3  _GPIO_PINMASK_4  _GPIO_PINMASK_5  _GPIO_PINMASK_6  _GPIO_PINMASK_7  _GPIO_PINMASK_8  _GPIO_PINMASK_9  _GPIO_PINMASK_10);
}
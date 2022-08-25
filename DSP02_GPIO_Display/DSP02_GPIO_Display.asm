_init_program:
;DSP02_GPIO_Display.c,35 :: 		void init_program() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP02_GPIO_Display.c,36 :: 		GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0); //Entrada flotante usando el botón de usuario (PB8) //(ConfiguraR como PULL-UP Entrada normalmente en alto y el botón se activa en bajo)
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;DSP02_GPIO_Display.c,37 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 , _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #127
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;DSP02_GPIO_Display.c,38 :: 		}
L_end_init_program:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_program
_proceso:
;DSP02_GPIO_Display.c,40 :: 		void proceso(){
;DSP02_GPIO_Display.c,41 :: 		if(BOTON==0){
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso0
;DSP02_GPIO_Display.c,42 :: 		DISPLAY = segmentos[contador];
MOVW	R2, #lo_addr(_contador+0)
MOVT	R2, #hi_addr(_contador+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_segmentos+0)
MOVT	R0, #hi_addr(_segmentos+0)
ADDS	R0, R0, R1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;DSP02_GPIO_Display.c,43 :: 		if(contador == 26){
MOV	R0, R2
LDRSH	R0, [R0, #0]
CMP	R0, #26
IT	NE
BNE	L_proceso1
;DSP02_GPIO_Display.c,44 :: 		contador = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRH	R1, [R0, #0]
;DSP02_GPIO_Display.c,45 :: 		}
L_proceso1:
;DSP02_GPIO_Display.c,46 :: 		delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_proceso2:
SUBS	R7, R7, #1
BNE	L_proceso2
NOP
NOP
NOP
NOP
;DSP02_GPIO_Display.c,47 :: 		}
L_proceso0:
;DSP02_GPIO_Display.c,48 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
_main:
;DSP02_GPIO_Display.c,49 :: 		void main() {
;DSP02_GPIO_Display.c,50 :: 		init_program();
BL	_init_program+0
;DSP02_GPIO_Display.c,51 :: 		while(1){
L_main4:
;DSP02_GPIO_Display.c,52 :: 		proceso();
BL	_proceso+0
;DSP02_GPIO_Display.c,53 :: 		}
IT	AL
BAL	L_main4
;DSP02_GPIO_Display.c,54 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main

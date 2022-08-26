_init_program:
;config.h,7 :: 		void init_program() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;config.h,8 :: 		GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVW	R1, #7
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;config.h,9 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13 | _GPIO_PINMASK_14 | _GPIO_PINMASK_15, _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;config.h,10 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13 | _GPIO_PINMASK_14 | _GPIO_PINMASK_15, _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
MOV	R2, #532
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;config.h,11 :: 		}
L_end_init_program:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_program
_obtener_numero:
;DSP02_GPIO_Display.c,12 :: 		int obtener_numero(int numero){
; numero start address is: 0 (R0)
; numero end address is: 0 (R0)
; numero start address is: 0 (R0)
;DSP02_GPIO_Display.c,13 :: 		return segmentos[numero];
LSLS	R2, R0, #1
; numero end address is: 0 (R0)
MOVW	R1, #lo_addr(_segmentos+0)
MOVT	R1, #hi_addr(_segmentos+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
SXTH	R0, R1
;DSP02_GPIO_Display.c,14 :: 		}
L_end_obtener_numero:
BX	LR
; end of _obtener_numero
_pintar_led:
;DSP02_GPIO_Display.c,16 :: 		int pintar_led(int a, int b){
; b start address is: 4 (R1)
; a start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R3, R1
; b end address is: 4 (R1)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
; b start address is: 12 (R3)
;DSP02_GPIO_Display.c,17 :: 		int num_1 = obtener_numero(a);
; a end address is: 0 (R0)
BL	_obtener_numero+0
; num_1 start address is: 16 (R4)
SXTH	R4, R0
;DSP02_GPIO_Display.c,18 :: 		int num_2 = obtener_numero(b);
SXTH	R0, R3
; b end address is: 12 (R3)
BL	_obtener_numero+0
;DSP02_GPIO_Display.c,19 :: 		return num_1 |(num_2 << 8);
LSLS	R2, R0, #8
SXTH	R2, R2
ORR	R2, R4, R2, LSL #0
; num_1 end address is: 16 (R4)
SXTH	R0, R2
;DSP02_GPIO_Display.c,20 :: 		}
L_end_pintar_led:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _pintar_led
_mover_datos:
;DSP02_GPIO_Display.c,21 :: 		void mover_datos(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP02_GPIO_Display.c,22 :: 		display_4 = display_3;
MOVW	R4, #lo_addr(_display_3+0)
MOVT	R4, #hi_addr(_display_3+0)
LDRSH	R0, [R4, #0]
MOVW	R3, #lo_addr(_display_4+0)
MOVT	R3, #hi_addr(_display_4+0)
STRH	R0, [R3, #0]
;DSP02_GPIO_Display.c,23 :: 		display_3 = display_2;
MOVW	R2, #lo_addr(_display_2+0)
MOVT	R2, #hi_addr(_display_2+0)
LDRSH	R0, [R2, #0]
STRH	R0, [R4, #0]
;DSP02_GPIO_Display.c,24 :: 		display_2 = display_1;
MOVW	R1, #lo_addr(_display_1+0)
MOVT	R1, #hi_addr(_display_1+0)
LDRSH	R0, [R1, #0]
STRH	R0, [R2, #0]
;DSP02_GPIO_Display.c,25 :: 		display_1 = contador;
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
LDRSH	R0, [R0, #0]
STRH	R0, [R1, #0]
;DSP02_GPIO_Display.c,26 :: 		DISPLAY_A = pintar_led(display_4, display_3);
MOV	R0, R4
LDRSH	R1, [R0, #0]
MOV	R0, R3
LDRSH	R0, [R0, #0]
BL	_pintar_led+0
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,27 :: 		DISPLAY_B = pintar_led(display_2, display_1);
MOVW	R0, #lo_addr(_display_1+0)
MOVT	R0, #hi_addr(_display_1+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_2+0)
MOVT	R0, #hi_addr(_display_2+0)
LDRSH	R0, [R0, #0]
BL	_pintar_led+0
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,28 :: 		}
L_end_mover_datos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mover_datos
_proceso_numeros:
;DSP02_GPIO_Display.c,29 :: 		void proceso_numeros(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP02_GPIO_Display.c,30 :: 		mover_datos();
BL	_mover_datos+0
;DSP02_GPIO_Display.c,31 :: 		if(contador == MAX){
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
LDRSH	R0, [R0, #0]
CMP	R0, #9
IT	NE
BNE	L_proceso_numeros0
;DSP02_GPIO_Display.c,32 :: 		contador = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRH	R1, [R0, #0]
;DSP02_GPIO_Display.c,33 :: 		}else{
IT	AL
BAL	L_proceso_numeros1
L_proceso_numeros0:
;DSP02_GPIO_Display.c,34 :: 		contador++;
MOVW	R1, #lo_addr(_contador+0)
MOVT	R1, #hi_addr(_contador+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DSP02_GPIO_Display.c,35 :: 		}
L_proceso_numeros1:
;DSP02_GPIO_Display.c,36 :: 		}
L_end_proceso_numeros:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _proceso_numeros
_pintar_letra:
;DSP02_GPIO_Display.c,38 :: 		int pintar_letra( unsigned int a, unsigned int b){
; b start address is: 4 (R1)
; a start address is: 0 (R0)
; b end address is: 4 (R1)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
; b start address is: 4 (R1)
;DSP02_GPIO_Display.c,39 :: 		return a |(b << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; b end address is: 4 (R1)
ORR	R2, R0, R2, LSL #0
; a end address is: 0 (R0)
SXTH	R0, R2
;DSP02_GPIO_Display.c,40 :: 		}
L_end_pintar_letra:
BX	LR
; end of _pintar_letra
_mover_letras:
;DSP02_GPIO_Display.c,41 :: 		void mover_letras(char nombre[]){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP02_GPIO_Display.c,42 :: 		int maximo = strlen(andres);
MOVW	R0, #lo_addr(_andres+0)
MOVT	R0, #hi_addr(_andres+0)
BL	_strlen+0
;DSP02_GPIO_Display.c,43 :: 		if(contador_letras == maximo){
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R1, [R1, #0]
CMP	R1, R0
IT	NE
BNE	L_mover_letras2
;DSP02_GPIO_Display.c,45 :: 		}
L_mover_letras2:
;DSP02_GPIO_Display.c,46 :: 		display_4 = display_3;
MOVW	R5, #lo_addr(_display_3+0)
MOVT	R5, #hi_addr(_display_3+0)
LDRSH	R1, [R5, #0]
MOVW	R4, #lo_addr(_display_4+0)
MOVT	R4, #hi_addr(_display_4+0)
STRH	R1, [R4, #0]
;DSP02_GPIO_Display.c,47 :: 		display_3 = display_2;
MOVW	R2, #lo_addr(_display_2+0)
MOVT	R2, #hi_addr(_display_2+0)
LDRSH	R1, [R2, #0]
STRH	R1, [R5, #0]
;DSP02_GPIO_Display.c,48 :: 		display_2 = display_1;
MOVW	R3, #lo_addr(_display_1+0)
MOVT	R3, #hi_addr(_display_1+0)
LDRSH	R1, [R3, #0]
STRH	R1, [R2, #0]
;DSP02_GPIO_Display.c,49 :: 		display_1 = andres[contador_letras];
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R1, [R1, #0]
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(_andres+0)
MOVT	R1, #hi_addr(_andres+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
STRH	R1, [R3, #0]
;DSP02_GPIO_Display.c,50 :: 		DISPLAY_A = pintar_letra(display_4, display_3);
MOV	R1, R5
LDRSH	R2, [R1, #0]
MOV	R1, R4
LDRSH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_pintar_letra+0
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,51 :: 		DISPLAY_B = pintar_letra(display_2, display_1);
MOVW	R1, #lo_addr(_display_1+0)
MOVT	R1, #hi_addr(_display_1+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_2+0)
MOVT	R1, #hi_addr(_display_2+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_pintar_letra+0
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,52 :: 		}
L_end_mover_letras:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mover_letras
_mover_letras_1:
;DSP02_GPIO_Display.c,53 :: 		void mover_letras_1(char nombre[]){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP02_GPIO_Display.c,54 :: 		int maximo = strlen(luis);
MOVW	R0, #lo_addr(_luis+0)
MOVT	R0, #hi_addr(_luis+0)
BL	_strlen+0
;DSP02_GPIO_Display.c,55 :: 		if(contador_letras == maximo){
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R1, [R1, #0]
CMP	R1, R0
IT	NE
BNE	L_mover_letras_13
;DSP02_GPIO_Display.c,57 :: 		}
L_mover_letras_13:
;DSP02_GPIO_Display.c,58 :: 		display_4 = display_3;
MOVW	R5, #lo_addr(_display_3+0)
MOVT	R5, #hi_addr(_display_3+0)
LDRSH	R1, [R5, #0]
MOVW	R4, #lo_addr(_display_4+0)
MOVT	R4, #hi_addr(_display_4+0)
STRH	R1, [R4, #0]
;DSP02_GPIO_Display.c,59 :: 		display_3 = display_2;
MOVW	R2, #lo_addr(_display_2+0)
MOVT	R2, #hi_addr(_display_2+0)
LDRSH	R1, [R2, #0]
STRH	R1, [R5, #0]
;DSP02_GPIO_Display.c,60 :: 		display_2 = display_1;
MOVW	R3, #lo_addr(_display_1+0)
MOVT	R3, #hi_addr(_display_1+0)
LDRSH	R1, [R3, #0]
STRH	R1, [R2, #0]
;DSP02_GPIO_Display.c,61 :: 		display_1 = luis[contador_letras];
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R1, [R1, #0]
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(_luis+0)
MOVT	R1, #hi_addr(_luis+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
STRH	R1, [R3, #0]
;DSP02_GPIO_Display.c,62 :: 		DISPLAY_A = pintar_letra(display_4, display_3);
MOV	R1, R5
LDRSH	R2, [R1, #0]
MOV	R1, R4
LDRSH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_pintar_letra+0
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,63 :: 		DISPLAY_B = pintar_letra(display_2, display_1);
MOVW	R1, #lo_addr(_display_1+0)
MOVT	R1, #hi_addr(_display_1+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_2+0)
MOVT	R1, #hi_addr(_display_2+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_pintar_letra+0
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,64 :: 		}
L_end_mover_letras_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mover_letras_1
_mover_letras_2:
;DSP02_GPIO_Display.c,65 :: 		void mover_letras_2(char nombre[]){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DSP02_GPIO_Display.c,66 :: 		int maximo = strlen(jose);
MOVW	R0, #lo_addr(_jose+0)
MOVT	R0, #hi_addr(_jose+0)
BL	_strlen+0
;DSP02_GPIO_Display.c,67 :: 		if(contador_letras == maximo){
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R1, [R1, #0]
CMP	R1, R0
IT	NE
BNE	L_mover_letras_24
;DSP02_GPIO_Display.c,69 :: 		}
L_mover_letras_24:
;DSP02_GPIO_Display.c,70 :: 		display_4 = display_3;
MOVW	R5, #lo_addr(_display_3+0)
MOVT	R5, #hi_addr(_display_3+0)
LDRSH	R1, [R5, #0]
MOVW	R4, #lo_addr(_display_4+0)
MOVT	R4, #hi_addr(_display_4+0)
STRH	R1, [R4, #0]
;DSP02_GPIO_Display.c,71 :: 		display_3 = display_2;
MOVW	R2, #lo_addr(_display_2+0)
MOVT	R2, #hi_addr(_display_2+0)
LDRSH	R1, [R2, #0]
STRH	R1, [R5, #0]
;DSP02_GPIO_Display.c,72 :: 		display_2 = display_1;
MOVW	R3, #lo_addr(_display_1+0)
MOVT	R3, #hi_addr(_display_1+0)
LDRSH	R1, [R3, #0]
STRH	R1, [R2, #0]
;DSP02_GPIO_Display.c,73 :: 		display_1 = jose[contador_letras];
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R1, [R1, #0]
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(_jose+0)
MOVT	R1, #hi_addr(_jose+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
STRH	R1, [R3, #0]
;DSP02_GPIO_Display.c,74 :: 		DISPLAY_A = pintar_letra(display_4, display_3);
MOV	R1, R5
LDRSH	R2, [R1, #0]
MOV	R1, R4
LDRSH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_pintar_letra+0
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,75 :: 		DISPLAY_B = pintar_letra(display_2, display_1);
MOVW	R1, #lo_addr(_display_1+0)
MOVT	R1, #hi_addr(_display_1+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_2+0)
MOVT	R1, #hi_addr(_display_2+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_pintar_letra+0
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R0, [R1, #0]
;DSP02_GPIO_Display.c,76 :: 		}
L_end_mover_letras_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mover_letras_2
_main:
;DSP02_GPIO_Display.c,77 :: 		void main() {
;DSP02_GPIO_Display.c,78 :: 		init_program();
BL	_init_program+0
;DSP02_GPIO_Display.c,79 :: 		while(1){
L_main5:
;DSP02_GPIO_Display.c,80 :: 		if(BOTON_1 == 0){
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main7
;DSP02_GPIO_Display.c,81 :: 		mover_letras(andres);
MOVW	R0, #lo_addr(_andres+0)
MOVT	R0, #hi_addr(_andres+0)
BL	_mover_letras+0
;DSP02_GPIO_Display.c,82 :: 		contador_letras++;
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DSP02_GPIO_Display.c,83 :: 		delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
NOP
;DSP02_GPIO_Display.c,85 :: 		continue;
IT	AL
BAL	L_main5
;DSP02_GPIO_Display.c,86 :: 		}
L_main7:
;DSP02_GPIO_Display.c,87 :: 		if(BOTON_2 == 0){
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main10
;DSP02_GPIO_Display.c,88 :: 		mover_letras_1(luis);
MOVW	R0, #lo_addr(_luis+0)
MOVT	R0, #hi_addr(_luis+0)
BL	_mover_letras_1+0
;DSP02_GPIO_Display.c,89 :: 		contador_letras++;
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DSP02_GPIO_Display.c,90 :: 		delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main11:
SUBS	R7, R7, #1
BNE	L_main11
NOP
NOP
NOP
NOP
;DSP02_GPIO_Display.c,91 :: 		continue;
IT	AL
BAL	L_main5
;DSP02_GPIO_Display.c,92 :: 		}
L_main10:
;DSP02_GPIO_Display.c,93 :: 		if(BOTON_3 == 0){
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_main13
;DSP02_GPIO_Display.c,94 :: 		mover_letras_2(jose);
MOVW	R0, #lo_addr(_jose+0)
MOVT	R0, #hi_addr(_jose+0)
BL	_mover_letras_2+0
;DSP02_GPIO_Display.c,95 :: 		contador_letras++;
MOVW	R1, #lo_addr(_contador_letras+0)
MOVT	R1, #hi_addr(_contador_letras+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DSP02_GPIO_Display.c,96 :: 		delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main14:
SUBS	R7, R7, #1
BNE	L_main14
NOP
NOP
NOP
NOP
;DSP02_GPIO_Display.c,97 :: 		continue;
IT	AL
BAL	L_main5
;DSP02_GPIO_Display.c,98 :: 		}
L_main13:
;DSP02_GPIO_Display.c,99 :: 		contador_letras = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_contador_letras+0)
MOVT	R0, #hi_addr(_contador_letras+0)
STRH	R1, [R0, #0]
;DSP02_GPIO_Display.c,100 :: 		proceso_numeros();
BL	_proceso_numeros+0
;DSP02_GPIO_Display.c,101 :: 		delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main16:
SUBS	R7, R7, #1
BNE	L_main16
NOP
NOP
NOP
NOP
;DSP02_GPIO_Display.c,102 :: 		}
IT	AL
BAL	L_main5
;DSP02_GPIO_Display.c,103 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main

@ Export the starting address of our assembly
.global     _start

@-------------------------------------------------------------------------------
@ Addresses and Constants
@-------------------------------------------------------------------------------

@ Base address for Raspberry Pi 4
.equ        GPIO_BASE,       0x7E200000

@ Base address for Raspberry Pi 3
@.equ        GPIO_BASE,      0x3F200000

@ Offset for FSEL2 (GPIO pin 21 is output)
.equ        GPFSEL2,        0x08
@ Setup mode for GPIO 21 (output)
.equ        GPIO_21_OUT,    0x8

@ Offsets for FSET0 and FCLR0
.equ        GPFSET0,        0x1c
.equ        GPFCLR0,        0x28

.equ        GPIOVAL,        0x200000    @ 1 << 21 to control pin

@-------------------------------------------------------------------------------
@ Main function
@-------------------------------------------------------------------------------

_start:

            @ Base of our GPIO structure
            ldr r0, =GPIO_BASE

            @ Set the GPIO 21 function as output
            ldr r1, =GPIO_21_OUT        @ Load the address for GPIO 21 setup
            str r1, [r0, #GPFSEL2]      @ Store GPIO_21_Out to FSEL2 bits

            @ Now pin 21 is an output pin

            @ Set counter
            ldr r2, =0x800000

loop:
            @ Turn on the LED
            ldr r1, =GPIOVAL            @ Value to write to set register
            str r1, [r0, #GPFSET0]      @ Store this value in FSET bits

            @ Wait for some time (delay)
            eor r10, r10, r10

delay1:
            add r10, r10
            cmp r10, r2                 @ Compare when it overflows
            bne delay1

            @ Turn off the LED
            ldr r1, =GPIOVAL
            str r1, [r0, #GPFCLR0]      @ Turn on the CLEAR signal

            @ Wait for some time (delay)
            eor r10, r10, r10

delay2:     
            add r10, r10
            cmp r10, r2
            bne delay2

            @ Loop infinitely
            b loop


.section    .init
.global     _start

.equ        BASE,       0xfe200000      @ Base address
.equ        GPFSEL2,    0x08		    @ FSEL2 register offset 
.equ        GPSET0,     0x1c		    @ GPSET0 register offset
.equ        GPCLR0,     0x28		    @ GPCLR0 register offset
.equ        SET_BIT3,   0x08		    @ Sets bit three b1000		
.equ        SET_BIT21,  0x200000 	    @ Sets bit 21
.equ        COUNTER,    0xf0000

_start:
            ldr         r0, =BASE
            ldr         r2, =COUNTER
            ldr         r1, =SET_BIT3
            str         r1, [r0,#GPFSEL2]

            ldr         r1, =SET_BIT21
            str         r1, [r0,#GPSET0]

looop:
	        str         r1, [r0,#GPSET0]	@ TURN ON
	        mov         r10, #0             @ DELAY
delay:                                      @ Loop to large number
		    add         r10, r10, #1
		    cmp         r10, r2	
		    bne         delay	
	        str         r1, [r0,#GPCLR0]    @ TURN OFF
	        mov         r10, #0
delay2:                                     @ DELAY2
		    add         r10, r10, #1
		    cmp         r10, r2	
		    bne         delay2
            
            b           looop

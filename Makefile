bin = kernel7l.img
elf = kernel.elf
obj = kernel.o
ccode = blink_LED.c
cobj = blink_LED.o
code = start.s

$(bin) : $(elf)
	arm-none-eabi-objcopy $(elf) -O binary $(bin)

$(cobj) : $(ccode)
	arm-none-eabi-gcc -c $(ccode) -o $(cobj)

$(elf) : $(obj)
	arm-none-eabi-ld $(obj) $(cobj) -o $(elf)

$(obj) : $(code)
	arm-none-eabi-as -g -o $(obj) $(code)

clean:
	rm *.o
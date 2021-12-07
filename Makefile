bin = kernel7l.img
elf = kernel.elf
obj = kernel.o
code = start.s

$(bin) : $(elf)
	arm-none-eabi-objcopy $(elf) -O binary $(bin)

$(elf) : $(obj)
	arm-none-eabi-ld $(obj) -o $(elf)

$(obj) : $(code)
	arm-none-eabi-as -g -o $(obj) $(code)

clean:
	rm *.o
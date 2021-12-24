bin = kernel7l.img
elf = kernel.elf
obj = kernel.o
ccode = blink_LED.c
cobj = blink_LED.o
code = start.s

armgnu = aarch64-none-elf

$(bin) : $(elf)
	$(armgnu)-objcopy $(elf) -O binary $(bin)

$(elf) : $(obj)
	$(armgnu)-ld $(obj) $(cobj) -o $(elf)
	
$(cobj) : $(ccode)
	$(armgnu)-gcc -c $(ccode) -o $(cobj)

$(obj) : $(code)
	$(armgnu)-as -g -o $(obj) $(code)

clean:
	rm *.o
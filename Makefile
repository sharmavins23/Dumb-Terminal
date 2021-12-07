# When we type make in the terminal...
default:
# We want to assemble our code from the start function
	arm-none-eabi-as start.s -o start.o
# We want to link our code together
	arm-none-eabi-ld start.o -o kernel.elf
# We'll copy the flat binary information out of the elf file into a bootable
	arm-none-eabi-objcopy kernel.elf -O binary kernel7.img

# kernel7.img is the file that will be read off the SD card into flash memory
all:
	gcc -m32 -ffreestanding -c kernel.c -o kernel.o
	gcc -m32 -ffreestanding -c boot.s -o boot.o
	ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/kernel.bin
	cp grub/grub.cfg iso/boot/grub/grub.cfg
	grub-mkrescue -o spikeos.iso iso

clean:
	rm -rf *.o *.bin iso spikeos.iso

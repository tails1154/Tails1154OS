build:
	echo Compiling...
	i686-elf-as boot.s -o boot.o
	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
	echo Compiled!
clean:
	echo Cleaning...
	rm -rf *.bin
	rm -rf *.o
	rm -rf isodir
grub:
	rm -rf isodir
	mkdir -p isodir/boot/grub
	cp myos.bin isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir
help:
	echo "use make build to build"
	echo "use make clean to delete build"
	echo "use make grub to make grub iso"
qemu:
	qemu-system-i386 -cdrom myos.iso
boot:
	make clean
	make build
	make grub
	make qemu
iso:
	make grub
os:
	make boot

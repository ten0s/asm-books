hexdump: hexdump.o
	ld -m elf_i386 -o hexdump hexdump.o
hexdump.o: hexdump.asm
	nasm -f elf -g -F dwarf -l hexdump.lst hexdump.asm

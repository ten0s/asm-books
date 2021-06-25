upper: upper.o
	ld -m elf_i386 -o upper upper.o
upper.o: upper.asm
	nasm -f elf -g -F dwarf -l upper.lst upper.asm

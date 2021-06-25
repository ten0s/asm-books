ask-name: ask-name.o
	ld -m elf_i386 -o ask-name ask-name.o
ask-name.o: ask-name.asm
	nasm -f elf -g -F dwarf -l ask-name.lst ask-name.asm

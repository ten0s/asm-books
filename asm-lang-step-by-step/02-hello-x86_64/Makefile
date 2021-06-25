hello64: hello64.o
	ld -o hello64 hello64.o
hello64.o: hello64.asm
	nasm -f elf64 -g -F dwarf -l hello64.lst hello64.asm

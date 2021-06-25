hello: hello.o
	ld -m elf_i386 -o hello hello.o
hello.o: hello.asm
	nasm -f elf -g -F dwarf -l hello.lst hello.asm

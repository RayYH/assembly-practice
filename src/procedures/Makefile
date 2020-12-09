PROGS = sum ascii

all: $(PROGS)

%:	%.asm
	nasm -f elf32 $@.asm -o $@.o && ld -m elf_i386 -s -o $@ $@.o

clean:
	rm -f $(PROGS) $(TEMPFILES) *.o

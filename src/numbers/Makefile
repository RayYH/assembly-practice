PROGS = aas add

all: $(PROGS)

%:	%.asm
	nasm -f elf32 $@.asm -o $@.o && ld -s -o $@ $@.o

clean:
	rm -f $(PROGS) $(TEMPFILES) *.o

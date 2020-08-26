PROGS = and or test

all: $(PROGS)

%:	%.asm
	nasm -f elf64 $@.asm -o $@.o && ld -s -o $@ $@.o

clean:
	rm -f $(PROGS) $(TEMPFILES) *.o

DIRS = basic-syntax memory-segments registers system-calls addressing-modes \
	constants arithmetic-instructions logical-instructions conditions loops \
	numbers strings arrays procedures recursion macros file-management \
	memory-management

all:
	for i in $(DIRS); do \
		(cd $$i && echo "making $$i" && $(MAKE) ) || exit 1; \
	done

clean:
	for i in $(DIRS); do \
		(cd $$i && echo "cleaning $$i" && $(MAKE) clean) || exit 1; \
	done

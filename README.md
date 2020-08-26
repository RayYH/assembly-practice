# Assembly Practice

This repo uses NASM assembler. Notes and source code are mostly from [Assembly Tutorial](https://www.tutorialspoint.com/assembly_programming).

## ToC

+ [Basic Syntax](src/basic-syntax/README.md)
+ [Memory Segments](src/memory-segments/README.md)
+ [Registers](src/registers/README.md)
+ [System Calls](src/system-calls/README.md)
+ [Addressing Modes](src/addressing-modes/README.md)
+ [Variables](src/variables/README.md)
+ [Constants](src/constants/README.md)
+ [Arithmetic Instructions](src/arithmetic-instructions/README.md)
+ [Logical Instructions](src/logical-instructions/README.md)

## Run

```bash
> docker-compose up -d
> docker exec -it assembly-practice /bin/bash

# build
$ make

# run executable file
$ cd basic-syntax && ./main

# clean
$ make clean
```

## License

[MIT](LICENSE).

# Assembly Practice

This repo uses NASM assembler. Notes and source code are mostly from [Assembly Tutorial](https://www.tutorialspoint.com/assembly_programming).

## Environment

```bash
$ uname -a
Darwin Ray-MBP 19.6.0 Darwin Kernel Version 19.6.0: Sun Jul  5 00:43:10 PDT 2020; root:xnu-6153.141.1~9/RELEASE_X86_64 x86_64
```

This repo uses an i386-ubuntu container, but most code can also be executed in a x86_64 environment.

## Run

```bash
> docker-compose up -d
> docker exec -it assembly-practice-i386 /bin/bash

# build
$ make

# run executable file
$ cd basic-syntax && ./main

# clean
$ make clean
```

> `docker-compose-64.yml` provides x86_64 environment.

## License

[MIT](LICENSE).

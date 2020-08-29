# Basic Syntax

## Comments

Assembly language comment begins with a semicolon (`;`), e.g.:

```nasm
; This program displays a message on screen
```

## Three Sections

An assembly program can be divided into three sections:

1. The data section: Used for declaring initialized data or constants. This data does not change at runtime. You can declare various constant values, file names, or buffer size, etc.
2. The bss section: Used for declaring variables.
3. The text section: Used for keeping the actual code. This section must begin with the declaration `global _start`, which tells the kernel where the program execution begins.

## Statements

Assembly language programs consist of three types of statements:

1. Executable instructions or instructions: Tell the processor what to do. Each instruction consists of an operation code (opcode). Each executable instruction generates one machine language instruction.
2. Assembler directives or pseudo-ops: Tell the assembler about the various aspects of the assembly process. These are non-executable and do not generate machine language instructions.
3. Macros: Basically a text substitution mechanism.

## `_start` symbol

The symbol `_start` is the entry point of your program. That is, the address of that symbol is the address jumped to on program start.

## System Calls

See [System calls](../system-calls/README.md).

## `int 0x80` Definition

`int 0x80` is the assembly language instruction that is used to invoke system calls in Linux on x86 (i.e., Intel-compatible) processors.

## `db` register

`db`, `dw`, `dd`, `dq`, `dt`, `ddq`, and `do` are used to declare initialized data in the output file. They can be invoked in a wide range of ways:

```none
db 0x55                ; just the byte 0x55
db 0x55,0x56,0x57      ; three bytes in succession
db 'a',0x55            ; character constants are OK
db 'hello',13,10,'$'   ; so are string constants
dw 0x1234              ; 0x34 0x12
dw 'a'                 ; 0x41 0x00 (it's just a number)
dw 'ab'                ; 0x41 0x42 (character constant)
dw 'abc'               ; 0x41 0x42 0x43 0x00 (string)
dd 0x12345678          ; 0x78 0x56 0x34 0x12
dq 0x1122334455667788  ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
ddq 0x112233445566778899aabbccddeeff00
; 0x00 0xff 0xee 0xdd 0xcc 0xbb 0xaa 0x99
; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
do 0x112233445566778899aabbccddeeff00 ; same as previous
dd 1.234567e20         ; floating-point constant
dq 1.234567e20         ; double-precision float
dt 1.234567e20         ; extended-precision float
```

`dt` does not accept numeric constants as operands, and `ddq` does not accept float constants as operands. Any size larger than `dd` does not accept strings as operands.

## `0xA`

```nasm
resMsg db "Result: ", 0xA, 0xD
```

defines a string made of the following characters:

```none
Result: XY
```

Where `X` and `Y` are actually invisible characters (with numerical values `0xA=10` and `0xD=13`, also known as line feed (LF) and carriage return (CR)) which cause the output to wrap to a new line.

## `$`

`$` means the current address according to the assembler, `$ - msg` is the current address of the assembler minus the address of `msg`, which would be the length of the string.

## More Readings

+ [Assembly - Basic Syntax](https://www.tutorialspoint.com/assembly_programming/assembly_basic_syntax.htm)
+ [System calls](https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm)
+ [Linux System Call Table](http://shell-storm.org/shellcode/files/syscalls.html)
+ [int 0x80 Definition](http://www.linfo.org/int_0x80.html)
+ [DB and Friends: Declaring Initialized Data](http://www.tortall.net/projects/yasm/manual/html/nasm-pseudop.html)
+ [Nasm print next line](https://stackoverflow.com/questions/36881270/nasm-print-to-next-line)

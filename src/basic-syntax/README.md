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

## Linux System Calls

You can make use of Linux system calls in your assembly programs. You need to take the following steps for using Linux system calls in your program:

1. Put the system call number in the `eax` register.
2. Store the arguments to the system call in the registers `ebx`, `ecx`, etc.
3. Call the relevant interrupt (0x80).
4. The result is usually returned to the `eax` register.

There are six registers that store the arguments of the system call used. These are the `ebx`, `ecx`, `edx`, `esi`, `edi`, and `ebp`. These registers take the consecutive arguments, starting with the `ebx` register. If there are more than six arguments, then the memory location of the first argument is stored in the `ebx` register.

The following table shows some system calls:

| `%eax` |    Name     |      `%ebx`      |     `%ecx`     |  `%edx`  | `%esx` | `%edi` |
| :----: | :---------: | :--------------: | :------------: | :------: | :----: | :----: |
|   1    | `sys_exit`  |      `int`       |       -        |    -     |   -    |   -    |
|   2    | `sys_fork`  | `struct pt_regs` |       -        |    -     |   -    |   -    |
|   3    | `sys_read`  |  `unsigned int`  |    `char *`    | `size_t` |   -    |   -    |
|   4    | `sys_write` |  `unsigned int`  | `const char *` | `size_t` |   -    |   -    |
|   5    | `sys_open`  |  `const char *`  |     `int`      |  `int`   |   -    |   -    |
|   6    | `sys_close` |  `unsigned int`  |       -        |    -     |   -    |   -    |

## Syscall Arguments

The user-land program is expected to put the system call number in the `eax` register. The arguments for the syscall itself are to be placed in the remaining general purpose registers.

One place this is documented is in a comment in [arch/x86/ia32/ia32entry.S](https://github.com/torvalds/linux/blob/v3.13/arch/x86/ia32/ia32entry.S#L378-L397):

```S
/* 
 * Emulated IA32 system calls via int 0x80. 
 *
 * Arguments:	 
 * %eax	System call number.
 * %ebx Arg1
 * %ecx Arg2
 * %edx Arg3
 * %esi Arg4
 * %edi Arg5
 * %ebp Arg6    [note: not saved in the stack frame, should not be touched]
 *
 * Notes:
 * Uses the same stack frame as the x86-64 version.	
 * All registers except %eax must be saved (but ptrace may violate that)
 * Arguments are zero extended. For system calls that want sign extension and
 * take long arguments a wrapper is needed. Most calls can just be called
 * directly.
 * Assumes it is only called from user space and entered with interrupts off.	
 */
```

## `int 0x80` Definition

`int 0x80` is the assembly language instruction that is used to invoke system calls in Linux on x86 (i.e., Intel-compatible) processors.

## `db` register

`DB`, `DW`, `DD`, `DQ`, `DT`, `DDQ`, and `DO` are used to declare initialized data in the output file. They can be invoked in a wide range of ways:

```
db      0x55                ; just the byte 0x55
db      0x55,0x56,0x57      ; three bytes in succession
db      'a',0x55            ; character constants are OK
db      'hello',13,10,'$'   ; so are string constants
dw      0x1234              ; 0x34 0x12
dw      'a'                 ; 0x41 0x00 (it's just a number)
dw      'ab'                ; 0x41 0x42 (character constant)
dw      'abc'               ; 0x41 0x42 0x43 0x00 (string)
dd      0x12345678          ; 0x78 0x56 0x34 0x12
dq      0x1122334455667788  ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
ddq     0x112233445566778899aabbccddeeff00
; 0x00 0xff 0xee 0xdd 0xcc 0xbb 0xaa 0x99
; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
do     0x112233445566778899aabbccddeeff00 ; same as previous
dd      1.234567e20         ; floating-point constant
dq      1.234567e20         ; double-precision float
dt      1.234567e20         ; extended-precision float
```

`DT` does not accept numeric constants as operands, and `DDQ` does not accept float constants as operands. Any size larger than `DD` does not accept strings as operands.

## `0xa`

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

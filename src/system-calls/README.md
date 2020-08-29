# System Calls

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

## System Call Arguments

The user-land program is expected to put the system call number in the `eax` register. The arguments for the sys call itself are to be placed in the remaining general purpose registers.

One place this is documented is in a comment in [arch/x86/ia32/ia32entry.S](https://github.com/torvalds/linux/blob/v3.13/arch/x86/ia32/ia32entry.S#L378-L397):

```S
/*
 * Emulated IA32 system calls via int 0x80.
 *
 * Arguments:
 * %eax System call number.
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

## `resb` & Friends: Declaring Uninitialized Data

`resb`, `resw`, `resd`, `resq`, `rest`, `reso`, `resy` and `resz` are designed to be used in the `bss` section of a module: they declare *uninitialized* storage space. Each takes a single operand, which is the number of bytes, words, double words or whatever to reserve.

```nasm
buffer resb 64      ; reserve 64 bytes
word_var resw 1     ; reserve a word
real_array resq 10  ; array of ten reals
ymm_val resy 1      ; one ymm register
zmm_vals resz 32    ; 32 zmm registers
```

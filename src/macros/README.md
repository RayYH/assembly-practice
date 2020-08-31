# Macros

Writing a macro is another way of ensuring modular programming in assembly language.

+ A macro is a sequence of instructions, assigned by a name and could be used anywhere in the program.
+ In NASM, macros are defined with `%macro` and `%endmacro` directives.
+ The macro begins with the `%macro` directive and ends with the `%endmacro` directive.

The Syntax for macro definition:

```none
%macro macro_name number_of_params
; macro body
%endmacro
```

Where, `number_of_params` specifies the number parameters, `macro_name` specifies the name of the macro.

The macro is invoked by using the macro name along with the necessary parameters. When you need to use some sequence of instructions many times in a program, you can put those instructions in a macro and use it instead of writing the instructions all the time.

For example, a very common need for programs is to write a string of characters in the screen. For displaying a string of characters, you need the following sequence of instructions:

```nasm
mov edx, len ; message length
mov ecx, msg ; message to write
mov ebx, 1   ; file descriptor (stdout)
mov eax, 4   ; system call number (sys_write)
int 0x80     ; call kernel
```

In the above example of displaying a character string, the registers `eax`, `ebx`, `ecx` and `edx` have been used by the `int 80H` function call. So, each time you need to display on screen, you need to save these registers on the stack, invoke `int 80H` and then restore the original value of the registers from the stack. So, it could be useful to write two macros for saving and restoring data.

We have observed that, some instructions like `imul`, `idiv`, `int`, etc., need some information to be stored in some particular registers and even return values in some specific register(s). If the program was already using those registers for keeping important data, then the existing data from these registers should be saved in the stack and restored after the instruction is executed.

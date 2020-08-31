# Memory Management

The `sys_brk()` system call is provided by the kernel, to allocate memory without the need of moving it later. This call allocates memory right behind the application image in the memory. This system function allows you to set the highest available address in the data section.

This system call takes one parameter, which is the highest memory address needed to be set. This value is stored in the `ebx` register.

In case of any error, `sys_brk()` returns `-1` or returns the negative error code itself. The following example demonstrates dynamic memory allocation.

## More Readings

+ [What is the best way to set a register to zero in x86 assembly: xor, mov or and?](https://stackoverflow.com/questions/33666617/what-is-the-best-way-to-set-a-register-to-zero-in-x86-assembly-xor-mov-or-and)
+ [What are CLD and STD for in x86 assembly language? What does DF do?](https://stackoverflow.com/questions/9636691/what-are-cld-and-std-for-in-x86-assembly-language-what-does-df-do)

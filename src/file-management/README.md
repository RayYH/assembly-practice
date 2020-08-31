# File Management

The system considers any input or output data as stream of bytes. There are three standard file streams:

+ Standard input (stdin),
+ Standard output (stdout).
+ Standard error (stderr).

## File Descriptor

A **file descriptor** is a 16-bit integer assigned to a file as a file id. When a new file is created or an existing file is opened, the file descriptor is used for accessing the file. File descriptor of the standard file streams - **stdin**, **stdout** and **stderr** are `0`, `1` and `2`, respectively.

## File Pointer

A **file pointer** specifies the location for a subsequent read/write operation in the file in terms of bytes. Each file is considered as a sequence of bytes. Each open file is associated with a file pointer that specifies an offset in bytes, relative to the beginning of the file. When a file is opened, the file pointer is set to zero.

## File Handling System Calls

The following table briefly describes the system calls related to file handling:

| `%eax` |    Name     |      `%ebx`      |     `%ecx`     |     `%edx`     |
| :----: | :---------: | :--------------: | :------------: | :------------: |
|  `2`   | `sys_fork`  | `struct pt_regs` |       -        |       -        |
|  `3`   | `sys_read`  |  `unsigned int`  |    `char *`    |    `size_t`    |
|  `4`   | `sys_write` |  `unsigned int`  | `const char *` |    `size_t`    |
|  `5`   | `sys_open`  |  `const char *`  |     `int`      |     `int`      |
|  `6`   | `sys_close` |  `unsigned int`  |       -        |       -        |
|  `8`   | `sys_creat` |  `const char *`  |     `int`      |       -        |
|  `19`  | `sys_lseek` |  `unsigned int`  |    `off_t`     | `unsigned int` |

The steps required for using the system calls are same, as we discussed earlier:

+ Put the system call number in the `eax` register.
+ Store the arguments to the system call in the registers `ebx`, `ecx`, etc.
+ Call the relevant interrupt (80h).
+ The result is usually stored in the `eax` register.

## Creating and Opening a File

For creating and opening a file, perform the following tasks:

+ Put the system call `sys_creat()` number `8`, in the `eax` register.
+ Put the filename in the `ebx` register.
+ Put the file permissions in the `ecx` register.
+ The system call returns the file descriptor of the created file in the `eax` register, in case of error, the error code is in the `eax` register.

## Opening an Existing File

For opening an existing file, perform the following tasks:

+ Put the system call `sys_open()` number `5`, in the `eax` register.
+ Put the filename in the `ebx` register.
+ Put the file access mode in the `ecx` register.
+ Put the file permissions in the `edx` register.

The system call returns the file descriptor of the created file in the `eax` register, in case of error, the error code is in the `eax` register.

Among the file access modes, most commonly used are: read-only (0), write-only (1), and read-write (2).

## Reading from a File

For reading from a file, perform the following tasks:

+ Put the system call `sys_read()` number `3`, in the `eax` register.
+ Put the file descriptor in the `ebx` register.
+ Put the pointer to the input buffer in the `ecx` register.
+ Put the buffer size, i.e., the number of bytes to read, in the `edx` register.

The system call returns the number of bytes read in the `eax` register, in case of error, the error code is in the `eax` register.

## Writing to a File

For writing to a file, perform the following tasks:

+ Put the system call `sys_write()` number `4`, in the `eax` register.
+ Put the file descriptor in the `ebx` register.
+ Put the pointer to the output buffer in the `ecx` register.
+ Put the buffer size, i.e., the number of bytes to write, in the `edx` register.

The system call returns the actual number of bytes written in the `eax` register, in case of error, the error code is in the `eax` register.

## Closing a File

For closing a file, perform the following tasks:

+ Put the system call `sys_close()` number `6`, in the `eax` register.
+ Put the file descriptor in the `ebx` register.

The system call returns, in case of error, the error code in the `eax` register.

## Updating a File

For updating a file, perform the following tasks:

+ Put the system call `sys_lseek()` number `19`, in the `eax` register.
+ Put the file descriptor in the `ebx` register.
+ Put the offset value in the `ecx` register.
+ Put the reference position for the offset in the `edx` register.

The reference position could be:

+ Beginning of file - value `0`
+ Current position - value `1`
+ End of file - value `2`

The system call returns, in case of error, the error code in the `eax` register.


# Variables

NASM provides various **define directives** for reserving storage space for variables. The **define assembler directive** is used for allocation of storage space. It can be used to reserve as well as initialize one or more bytes.

## Allocating Storage Space for Initialized Data

The syntax for storage allocation statement for initialized data is:

```none
[variable-name] define-directive initial-value [,initial-value]...
```

Where, `variable-name` is *the identifier* for each storage space. The assembler associates an offset value for each variable name defined in the data segment.

There are five basic forms of the **define directives**:

| Directive |      Purpose       |   Storage Space    |
| :-------: | :----------------: | :----------------: |
|   `db`    |    Define Byte     |  allocates 1 byte  |
|   `dw`    |    Define Word     | allocates 2 bytes  |
|   `dd`    | Define Double Word | allocates 4 bytes  |
|   `dq`    |  Define Quad Word  | allocates 8 bytes  |
|   `dt`    |  Define Ten Bytes  | allocates 10 bytes |

Following are some examples of using define directives:

```nasm
choice db 'y'
number dw 12345
neg_number dw -12345
big_number dq 123456789
real_number1 dd 1.234
real_number2 dq 123.456
```

Please note that:

+ Each byte of character is stored as its ASCII value in hexadecimal.
+ Each decimal value is automatically converted to its 16-bit binary equivalent and stored as a hexadecimal number.
+ Processor uses the little-endian byte ordering.
+ Negative numbers are converted to its Two's complement representation.
+ Short and long floating-point numbers are represented using 32 or 64 bits, respectively.

## Allocating Storage Space for Uninitialized Data

The reserve directives are used for reserving space for uninitialized data. The reserve directives take a single operand that specifies the number of units of space to be reserved. Each define directive has a related reserve directive.

There are five basic forms of the reserve directives:

| Directive |        Purpose        |
| :-------: | :-------------------: |
|  `resb`   |    Reserve a Byte     |
|  `resw`   |    Reserve a Word     |
|  `resd`   | Reserve a Double Word |
|  `resq`   |  Reserve a Quad Word  |
|  `rest`   |  Reserve a Ten Bytes  |

## Multiple Definitions

You can have multiple data definition statements in a program. For example:

```nasm
choice db 'Y'        ; ASCII of y = 79H
number1 dw 12345     ; 12345D = 3039H
number2 dd 12345679  ; 123456789D = 75BCD15H
```

The assembler allocates contiguous memory for multiple variable definitions.

## Multiple Initializations

The `times` directive allows multiple initializations to the same value. For example, an array named marks of size 9 can be defined and initialized to zero using the following statement:

```nasm
marks times 9 dw 0
```

The `times` directive is useful in defining arrays and tables.

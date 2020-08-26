# Constants

There are several directives provided by NASM that define constants. We have already used the `EQU` directive in previous chapters. We will particularly discuss three directives:

+ `EQU`
+ `%assign`
+ `%define`

## The `EQU` Directive

The `EQU` directive is used for defining constants. The syntax of the `EQU` directive is as follows:

```nasm
CONSTANT_NAME EQU expression
```

For example:

```nasm
TOTAL_STUDENTS EQU 50
```

You can then use this constant value in your code, like:

```nasm
MOV  ecx,  TOTAL_STUDENTS
CMP  eax,  TOTAL_STUDENTS
```

The operand of an `EQU` statement can be an expression:

```nasm
LENGTH EQU 20
WIDTH  EQU 10
AREA   EQU length * width
```

Above code segment would define `AREA` as `200`.

## The `%assign` Directive

The `%assign` directive can be used to define numeric constants like the `EQU` directive. This directive allows redefinition. For example, you may define the constant `TOTAL` as:

```nasm
%assign TOTAL 10
```

Later in the code, you can redefine it as:

```nasm
%assign  TOTAL  20
```

## The `%define` Directive

The `%define` directive allows defining both numeric and string constants. This directive also allows redefinition and it is case-sensitive. This directive is similar to the `#define` in C. For example, you may define the constant `PTR` as:

```nasm
%define PTR [EBP+4]
```

The above code replaces `PTR` by `[EBP+4]`.

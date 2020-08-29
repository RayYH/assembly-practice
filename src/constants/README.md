# Constants

There are several directives provided by NASM that define constants. We have already used the `equ` directive in previous chapters. We will particularly discuss three directives:

+ `equ`
+ `%assign`
+ `%define`

## The `equ` Directive

The `equ` directive is used for defining constants. The syntax of the `equ` directive is as follows:

```nasm
CONSTANT_NAME equ expression
```

For example:

```nasm
TOTAL_STUDENTS equ 50
```

You can then use this constant value in your code, like:

```nasm
mov ecx, TOTAL_STUDENTS
cmp eax, TOTAL_STUDENTS
```

The operand of an `equ` statement can be an expression:

```nasm
LENGTH equ 20
WIDTH equ 10
AREA equ length * width
```

Above code segment would define `AREA` as `200`.

## The `%assign` Directive

The `%assign` directive can be used to define numeric constants like the `equ` directive. This directive allows redefinition. For example, you may define the constant `TOTAL` as:

```nasm
%assign TOTAL 10
```

Later in the code, you can redefine it as:

```nasm
%assign TOTAL 20
```

## The `%define` Directive

The `%define` directive allows defining both numeric and string constants. This directive also allows redefinition and it is case-sensitive. This directive is similar to the `#define` in C. For example, you may define the constant `PTR` as:

```nasm
%define PTR [ebp+4]
```

The above code replaces `PTR` by `[ebp+4]`.

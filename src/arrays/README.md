# Arrays

The data definition directives can also be used for defining a one-dimensional array. Let us define a one-dimensional array of numbers.

```nasm
numbers dw 34, 45, 56, 67, 75, 89
```

The above definition declares *an array of six words* each initialized with the numbers `34, 45, 56, 67, 75, 89`. This allocates `2x6 = 12` bytes of **consecutive memory** space. The symbolic address of the first number will be `numbers` and that of the second number will be `numbers + 2` and so on.

Let us take up another example. You can define an array named inventory of size 8, and initialize all the values with zero:

```nasm
inventory dw 0
          dw 0
          dw 0
          dw 0
          dw 0
          dw 0
          dw 0
          dw 0
```

Which can be abbreviated as:

```nasm
inventory dw 0, 0, 0, 0, 0, 0, 0, 0
```

The `times` directive can also be used for multiple initializations to the same value. Using `times`, the inventory array can be defined as:

```nasm
inventory times 8 dw 0
```

# Arithmetic Instructions

## The `inc` Instruction

The `inc` instruction is used for incrementing an operand **by one**. It works on a single operand that can be either in a register or in memory.

### `inc` Syntax

The `inc` instruction has the following syntax:

```nasm
inc destination
```

The operand `destination` could be an 8-bit, 16-bit or 32-bit operand.

### `inc` Example

```nasm
inc ebx      ; Increments 32-bit register
inc dl       ; Increments 8-bit register
inc [count]  ; Increments the count variable
```

## The `dec` Instruction

The `dec` instruction is used for decrementing an operand **by one**. It works on a single operand that can be either in a register or in memory.

### `dec` Syntax

The `dec` instruction has the following syntax:

```nasm
dec destination
```

The operand destination could be an 8-bit, 16-bit or 32-bit operand.

### `dec` Example

```nasm
segment .data
    count dw 0
    value db 15

segment .text
    inc [count]
    dec [value]

    mov ebx, count
    inc word [ebx]

    mov esi, value
    dec byte [esi]
```

## The `add` and `sub` Instructions

The `add` and `sub` instructions are used for performing simple addition/subtraction of binary data in byte, word and double-word size, i.e., for adding or subtracting 8-bit, 16-bit or 32-bit operands, respectively.

The `add` and `sub` instructions have the following syntax:

```nasm
add destination, source
sub destination, source
```

The `add`/`sub` instruction can take place between:

+ Register to register
+ Memory to register
+ Register to memory
+ Register to constant data
+ Memory to constant data

However, like other instructions, memory-to-memory operations are not possible using `add`/`sub` instructions. An `add` or `sub` operation sets or clears the overflow and carry flags.

## The `mul`/`imul` Instruction

There are two instructions for multiplying binary data. The `mul` (Multiply) instruction handles unsigned data and the `imul` (Integer Multiply) handles signed data. Both instructions affect the Carry and Overflow flag.

The syntax for the `mul`/`imul` instructions is as follows:

```nasm
mul multiplier
imul multiplier
```

Multiplicand in both cases will be in an accumulator, depending upon the size of the multiplicand and the multiplier and the generated product is also stored in two registers depending upon the size of the operands. Following section explains MUL instructions with three different cases:

### When two bytes are multiplied

The multiplicand is in the `al` register, and the multiplier is a byte in the memory or in another register. The product is in `ax`. High-order 8 bits of the product is stored in `ah` and the low-order 8 bits are stored in `al`.

```none
al * 8 bit source = ah al
```

### When two one-word values are multiplied

The multiplicand should be in the `ax` register, and the multiplier is a word in memory or another register. For example, for an instruction like `mul dx`, you must store the multiplier in `dx` and the multiplicand in `ax`.

The resultant product is a double word, which will need two registers. The high-order (leftmost) portion gets stored in `dx` and the lower-order (rightmost) portion gets stored in `ax`.

```none
ax * 16 bit source = dx ax
```

### When two double-word values are multiplied

When two double-word values are multiplied, the multiplicand should be in `eax` and the multiplier is a double-word value stored in memory or in another register. The product generated is stored in the `edx:eax` registers, i.e., the high order 32 bits gets stored in the `edx` register and the low order 32-bits are stored in the `eax` register.

```none
eax * 32 bit source = edx eax
```

## The `div`/`idiv` Instructions

The division operation generates two elements - a **quotient** and a **remainder**. In case of multiplication, overflow does not occur because double-length registers are used to keep the product. However, in case of division, overflow may occur. The processor generates an interrupt if overflow occurs.

The `div` (Divide) instruction is used for unsigned data and the `idiv` (Integer Divide) is used for signed data.

The format for the `div`/`idiv` instruction:

```nasm
div divisor
idiv divisor
```

The dividend is in an accumulator. Both the instructions can work with 8-bit, 16-bit or 32-bit operands. The operation affects all six status flags. Following section explains three cases of division with different operand size:

### When the divisor is 1 byte

The dividend is assumed to be in the `ax` register (16 bits). After division, the quotient goes to the `al` register and the remainder goes to the `ah` register.

```none
ax (also ah al) / (8 bit divisor) = al (quotient) And ah (remainder)
```

### When the divisor is 1 word

The dividend is assumed to be 32 bits long and in the `dx:ax` registers. The high-order 16 bits are in `dx` and the low-order 16 bits are in `ax`. After division, the 16-bit quotient goes to the `ax` register and the 16-bit remainder goes to the `dx` register.

```none
(dx ax) / (16 bit divisor) = ax (quotient) And dx (remainder)
```

### When the divisor is double-word

The dividend is assumed to be 64 bits long and in the `edx:eax` registers. The high-order 32 bits are in `edx` and the low-order 32 bits are in `eax`. After division, the 32-bit quotient goes to the `eax` register and the 32-bit remainder goes to the `edx` register.

```none
(edx eax) / (32 bit divisor) = eax (quotient) And edx (remainder)
```

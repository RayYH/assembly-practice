# Arithmetic Instructions

## The `INC` Instruction

The `INC` instruction is used for incrementing an operand **by one**. It works on a single operand that can be either in a register or in memory.

### Syntax

The `INC` instruction has the following syntax:

```nasm
INC destination
```

The operand `destination` could be an 8-bit, 16-bit or 32-bit operand.

### Example

```nasm
INC EBX	     ; Increments 32-bit register
INC DL       ; Increments 8-bit register
INC [count]  ; Increments the count variable
```

## The `DEC` Instruction

The `DEC` instruction is used for decrementing an operand **by one**. It works on a single operand that can be either in a register or in memory.

### Syntax

The `DEC` instruction has the following syntax:

```nasm
DEC destination
```

The operand destination could be an 8-bit, 16-bit or 32-bit operand.

### Example

```nasm
segment .data
   count dw  0
   value db  15

segment .text
   inc [count]
   dec [value]

   mov ebx, count
   inc word [ebx]

   mov esi, value
   dec byte [esi]
```

## The `ADD` and `SUB` Instructions

The `ADD` and `SUB` instructions are used for performing simple addition/subtraction of binary data in byte, word and double-word size, i.e., for adding or subtracting 8-bit, 16-bit or 32-bit operands, respectively.

The `ADD` and `SUB` instructions have the following syntax:

```nasm
ADD	destination, source
SUB	destination, source
```

The `ADD`/`SUB` instruction can take place between:

+ Register to register
+ Memory to register
+ Register to memory
+ Register to constant data
+ Memory to constant data

However, like other instructions, memory-to-memory operations are not possible using `ADD`/`SUB` instructions. An `ADD` or `SUB` operation sets or clears the overflow and carry flags.

## The `MUL`/`IMUL` Instruction

There are two instructions for multiplying binary data. The `MUL` (Multiply) instruction handles unsigned data and the `IMUL` (Integer Multiply) handles signed data. Both instructions affect the Carry and Overflow flag.

The syntax for the `MUL`/`IMUL` instructions is as follows:

```nasm
MUL  multiplier
IMUL multiplier
```

Multiplicand in both cases will be in an accumulator, depending upon the size of the multiplicand and the multiplier and the generated product is also stored in two registers depending upon the size of the operands. Following section explains MUL instructions with three different cases:

### When two bytes are multiplied

The multiplicand is in the `AL` register, and the multiplier is a byte in the memory or in another register. The product is in `AX`. High-order 8 bits of the product is stored in `AH` and the low-order 8 bits are stored in `AL`.

```none
AL * 8 bit source = AH AL
```

### When two one-word values are multiplied

The multiplicand should be in the `AX` register, and the multiplier is a word in memory or another register. For example, for an instruction like `MUL DX`, you must store the multiplier in `DX` and the multiplicand in `AX`.

The resultant product is a double word, which will need two registers. The high-order (leftmost) portion gets stored in `DX` and the lower-order (rightmost) portion gets stored in `AX`.

```none
AX * 16 bit source = DX AX
```

### When two double-word values are multiplied

When two double-word values are multiplied, the multiplicand should be in `EAX` and the multiplier is a double-word value stored in memory or in another register. The product generated is stored in the `EDX:EAX` registers, i.e., the high order 32 bits gets stored in the `EDX` register and the low order 32-bits are stored in the `EAX` register.

```none
EAX * 32 bit source = EDX EAX
```

## The `DIV`/`IDIV` Instructions

The division operation generates two elements - a **quotient** and a **remainder**. In case of multiplication, overflow does not occur because double-length registers are used to keep the product. However, in case of division, overflow may occur. The processor generates an interrupt if overflow occurs.

The `DIV` (Divide) instruction is used for unsigned data and the `IDIV` (Integer Divide) is used for signed data.

The format for the `DIV`/`IDIV` instruction:

```nasm
DIV	 divisor
IDIV divisor
```

The dividend is in an accumulator. Both the instructions can work with 8-bit, 16-bit or 32-bit operands. The operation affects all six status flags. Following section explains three cases of division with different operand size:

### When the divisor is 1 byte

The dividend is assumed to be in the `AX` register (16 bits). After division, the quotient goes to the `AL` register and the remainder goes to the `AH` register.

```none
AX (also AH AL) / (8 bit divisor) = AL (quotient) And AH (remainder)
```

### When the divisor is 1 word

The dividend is assumed to be 32 bits long and in the `DX:AX` registers. The high-order 16 bits are in `DX` and the low-order 16 bits are in `AX`. After division, the 16-bit quotient goes to the `AX` register and the 16-bit remainder goes to the `DX` register.

```none
(DX AX) / (16 bit divisor) = AX (quotient) And DX (remainder)
```

### When the divisor is double-word

The dividend is assumed to be 64 bits long and in the `EDX:EAX` registers. The high-order 32 bits are in `EDX` and the low-order 32 bits are in `EAX`. After division, the 32-bit quotient goes to the `EAX` register and the 32-bit remainder goes to the `EDX` register.

```none
(EDX EAX) / (32 bit divisor) = EAX (quotient) And EDX (remainder)
```

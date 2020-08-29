# Logical Instructions

The processor instruction set provides the instructions `and`, `or`, `xor`, `test`, and `not` Boolean logic, which tests, sets, and clears the bits according to the need of the program.

The format for these instructions are:

| Sr.No. | Instruction |          Format           |
| :----: | :---------: | :-----------------------: |
|   1    |    `and`    | `and` operand1, operand2  |
|   2    |    `or`     |  `or` operand1, operand2  |
|   3    |    `xor`    | `xor` operand1, operand2  |
|   4    |   `test`    | `test` operand1, operand2 |
|   5    |    `not`    |      `not` operand1       |

The first operand in all the cases could be either in register or in memory. The second operand could be either in register/memory or an immediate (constant) value. However, memory-to-memory operations are not possible. These instructions compare or match bits of the operands and set the `cf`, `of`, `pf`, `sf` and `zf` flags.

## The `and` Instruction

The `and` instruction is used for supporting logical expressions by performing bitwise `and` operation. The bitwise `and` operation returns 1, if the matching bits from both the operands are 1, otherwise it returns 0. For example:

```none
             Operand1: 0101
             Operand2: 0011
----------------------------
After and -> Operand1: 0001
```

The `and` operation can be used for clearing one or more bits. For example, say the `bl` register contains `0011 1010`. If you need to clear the high-order bits to zero, you `and` it with `0FH`.

```nasm
and bl, 0FH ; This sets bl to 0000 1010
```

Let's take up another example. If you want to check whether a given number is odd or even, a simple test would be to check the least significant bit of the number. If this is 1, the number is odd, else the number is even.

Assuming the number is in `al` register, we can write:

```nasm
and al, 01H     ; and with 0000 0001
jz EVEN_NUMBER  ; jz is "jump if zero", jump to label EVEN_NUMBER
```

## The `or` Instruction

The `or` instruction is used for supporting logical expression by performing bitwise `or` operation. The bitwise `or` operator returns 1, if the matching bits from either or both operands are one. It returns 0, if both the bits are zero.

For example:

```none
             Operand1: 0101
             Operand2: 0011
-----------------------------
After or ->  Operand1: 0111
```

The `or` operation can be used for setting one or more bits. For example, let us assume the `al` register contains `0011 1010`, you need to set the four low-order bits, you can `or` it with a value `0000 1111`, i.e., `FH`.

```nasm
or bl, 0FH  ; This sets bl to 0011 1111
```

## The `xor` Instruction

The `xor` instruction implements the bitwise `xor` operation. The `xor` operation sets the resultant bit to 1, if and only if the bits from the operands are different. If the bits from the operands are same (both 0 or both 1), the resultant bit is cleared to 0.

```none
             Operand1: 0101
             Operand2: 0011
----------------------------
After xor -> Operand1: 0110
```

Xor an operand with itself changes the operand to 0. This is used to clear a register.

```nasm
xor ezx, eax
```

## The `test` Instruction

The `test` instruction works same as the `and` operation, but unlike `and` instruction, it does not change the first operand. So, if we need to check whether a number in a register is even or odd, we can also do this using the `test` instruction without changing the original number.

```nasm
test al, 01H
jz EVEN_NUMBER
```

## The `not` Instruction

The `not` instruction implements the bitwise `not` operation. `not` operation reverses the bits in an operand. The operand could be either in a register or in the memory.

```none
             Operand1: 0101 0011
After not -> Operand1: 1010 1100
```

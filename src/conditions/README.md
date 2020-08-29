# Conditions

Conditional execution in assembly language is accomplished by several looping and branching instructions. These instructions can change the flow of control in a program. Conditional execution is observed in two scenarios:

1. **Unconditional jump**: This is performed by the `jmp` instruction. Conditional execution often involves a transfer of control to the address of an instruction that does not follow the currently executing instruction. Transfer of control may be forward, to execute a new set of instructions or backward, to re-execute the same steps.
2. **Conditional jump**: This is performed by a set of jump instructions `j<condition>` depending upon the condition. The conditional instructions transfer the control by breaking the sequential flow, and they do it by changing the offset value in `IP`.

## `cmp` Instruction

The `cmp` instruction **compares two operands**. It is generally used in conditional execution. This instruction basically subtracts one operand from the other for comparing whether the operands are equal or not. It does not disturb the destination or source operands. It is used along with the conditional jump instruction for decision-making.

### Syntax

```nasm
cmp destination, source
```

`cmp` compares two numeric data fields. The destination operand could be either in register or in memory. The source operand could be a constant (immediate) data, register or memory.

### Example

```nasm
cmp dx, 00 ; Compare the dx value with zero
je L7      ; If yes, then jump to label L7
; ...
L7:        ; ...
```

`cmp` is often used for comparing whether a counter value has reached the number of times a loop needs to be run. Consider the following typical condition:

```nasm
inc edx
cmp edx, 10 ; Compares whether the counter has reached 10
jle LP1     ; If it is less than or equal to 10, then jump to LP1
```

## Unconditional Jump

As mentioned earlier, this is performed by the `jmp` instruction. Conditional execution often involves a transfer of control to the address of an instruction that does not follow the currently executing instruction. Transfer of control may be forward, to execute a new set of instructions or backward, to re-execute the same steps.

### Syntax of Unconditional Jump

The `jmp` instruction provides a label name where the flow of control is transferred immediately. The syntax of the `jmp` instruction is:

```nasm
jmp label
```

### Example of Unconditional Jump

The following code snippet illustrates the `jmp` instruction:

```nasm
mov ax, 00    ; Initializing ax to 0
mov bx, 00    ; Initializing bx to 0
mov cx, 01    ; Initializing cx to 1

L20:
add ax, 01     ; Increment ax
add bx, ax     ; Add ax to bx
shl cx, 1      ; shift left cx, this in turn doubles the cx value
jmp L20        ; repeats the statements
```

## Conditional Jump

If some specified condition is satisfied in conditional jump, the control flow is transferred to a target instruction. There are numerous conditional jump instructions depending upon the condition and data.

Following are the conditional jump instructions used on signed data used for arithmetic operations:

| Instruction |             Description             |   Flags tested   |
| :---------: | :---------------------------------: | :--------------: |
|  `je`/`jz`  |       Jump Equal or Jump Zero       |       `zf`       |
| `jne`/`jnz` |   Jump not Equal or Jump Not Zero   |       `zf`       |
| `jg`/`jnle` | Jump Greater or Jump Not Less/Equal | `of`, `sf`, `zf` |
| `jge`/`jnl` | Jump Greater/Equal or Jump Not Less |    `of`, `sf`    |
| `jl`/`jnge` | Jump Less or Jump Not Greater/Equal |    `of`, `sf`    |
| `jle`/`jng` | Jump Less/Equal or Jump Not Greater | `of`, `sf`, `zf` |

Following are the conditional jump instructions used on unsigned data used for logical operations:

| Instruction |            Description             | Flags tested |
| :---------: | :--------------------------------: | :----------: |
|  `je`/`jz`  |      Jump Equal or Jump Zero       |     `zf`     |
| `jne`/`jnz` |  Jump not Equal or Jump Not Zero   |     `zf`     |
| `ja`/`jnbe` | Jump Above or Jump Not Below/Equal |  `cf`, `zf`  |
| `jae`/`jnb` | Jump Above/Equal or Jump Not Below |     `cf`     |
| `jb`/`jnae` | Jump Below or Jump Not Above/Equal |     `cf`     |
| `jbe`/`jna` | Jump Below/Equal or Jump Not Above |  `af`, `cf`  |

The following conditional jump instructions have special uses and check the value of flags:

| Instruction |            Description            | Flags tested |
| :---------: | :-------------------------------: | :----------: |
|   `jxcz`    |       Jump if `cx` is Zero        |     none     |
|    `jc`     |           Jump If Carry           |     `cf`     |
|    `jnc`    |         Jump If No Carry          |     `cf`     |
|    `jo`     |         Jump If Overflow          |     `of`     |
|    `jno`    |        Jump If No Overflow        |     `of`     |
| `jp`/`jpe`  |  Jump Parity or Jump Parity Even  |     `pf`     |
| `jnp`/`jpo` | Jump No Parity or Jump Parity Odd |     `pf`     |
|    `js`     |    Jump Sign (negative value)     |     `sf`     |
|    `jns`    |   Jump No Sign (positive value)   |     `sf`     |

The syntax for the `J<condition>` set of instructions:

```nasm
cmp al, bl
je EQUAL
cmp al, BH
je EQUAL
cmp al, cl
je EQUAL

NON_EQUAL: ;...
EQUAL:     ;...
```

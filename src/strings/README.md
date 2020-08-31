# Strings

Generally, we specify the length of the string by either of the two ways:

+ Explicitly storing string length
+ Using a sentinel character

We can store the string length explicitly by using the `$` location counter symbol that represents **the current value of the location counter**. In the following example:

```nasm
msg db "Hello World!", 0xA
len equ $ - msg
```

`$` points to the byte after the last character of the string variable `msg`. Therefore, `$ - msg` gives the length of the string. We can also write:

```nasm
msg db "Hello World!", 0xA
len equ 13
```

Alternatively, you can store strings with a **trailing sentinel character** to delimit a string instead of storing the string length explicitly. The sentinel character should be a special character that does not appear within a string.

```nasm
message db 'I am loving it!', 0
```

## String Instructions

Each string instruction may require a source operand, a destination operand or both. For 32-bit segments, string instructions use `esi` and `edi` registers to point to the source and destination operands, respectively. For 16-bit segments, however, the `si` and the `di` registers are used to point to the source and destination, respectively.

There are five basic instructions for processing strings:

+ `movs` − This instruction *moves 1 byte, word or double-word of data from memory location to another*.
+ `lods` − This instruction *loads from memory*. If the operand is of one byte, it is loaded into the `al` register, if the operand is one word, it is loaded into the `ax` register and a double-word is loaded into the `eax` register.
+ `stos` − This instruction *stores data from register (`al`, `ax`, or `eax`) to memory*.
+ `cmps` − This instruction *compares two data items in memory*. Data could be of a byte size, word or double-word.
+ `scas` − This instruction *compares the contents of a register (`AL`, `AX` or `EAX`) with the contents of an item in memory*.

Each of the above instruction has a byte, word, and double-word version, and string instructions can be repeated by using a repetition prefix.

These instructions use the `es:di` and `ds:si` pair of registers, where `di` and `si` registers contain valid offset addresses that refers to bytes stored in memory. `si` is normally associated with `ds` (data segment) and `di` is always associated with `es` (extra segment).

The `ds:si` (or `esi`) and `es:di` (or `edi`) registers point to the source and destination operands, respectively. The source operand is assumed to be at `ds:si` (or `esi`) and the destination operand at `es:di` (or `edi`) in memory.

For 16-bit addresses, the `si` and `di` registers are used, and for 32-bit addresses, the `esi` and `edi` registers are used.

The following table provides various versions of string instructions and the assumed space of the operands.

| Basic Instruction | Operands at    | Byte Operation | Word Operation | Double word Operation |
| ----------------- | -------------- | -------------- | -------------- | --------------------- |
| `movs`            | `es:di, ds:si` | `movsb`        | `movsw`        | `movsd`               |
| `lods`            | `ax, ds:si`    | `lodsb`        | `lodsw`        | `lodsd`               |
| `stos`            | `es:di, ax`    | `stosb`        | `stosw`        | `stosd`               |
| `cmps`            | `ds:si, es:di` | `cmpsb`        | `cmpsw`        | `cmpsd`               |
| `scas`            | `es:di, ax`    | `scasb`        | `scasw`        | `scasd`               |

## Repetition Prefixes

The `rep` prefix, when set before a string instruction, for example - `rep movsb`, causes repetition of the instruction based on a counter placed at the `cx` register. `rep` executes the instruction, decreases `cx` by 1, and checks whether `cx` is zero. It repeats the instruction processing until `cx` is zero.

The Direction Flag (`df`) determines the direction of the operation:

+ Use `cld` (Clear Direction Flag, `df = 0`) to make the operation left to right.
+ Use `std` (Set Direction Flag, `df = 1`) to make the operation right to left.

The `rep` prefix also has the following variations:

+ `rep`: It is the unconditional repeat. It repeats the operation until `cx` is zero.
+ `repe` or `repz`: It is conditional repeat. It repeats the operation while the zero flag indicates equal/zero. It stops when the `zf` indicates not equal/zero or when `cx` is zero.
+ `repne` or `repnz`: It is also conditional repeat. It repeats the operation while the zero flag indicates not equal/zero. It stops when the `zf` indicates equal/zero or when `cx` is decremented to zero.

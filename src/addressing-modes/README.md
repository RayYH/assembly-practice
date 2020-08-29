# Addressing Modes

Instructions are operations performed by the CPU. Operands are entities operated upon by the instruction. Addresses are the locations in memory of specified data.

When an instruction requires two operands, **the first operand is generally the destination**, which contains data in a register or memory location and **the second operand is the source**. Source contains either the data to be delivered (immediate addressing) or the address (in register or memory) of the data. **Generally, the source data remains unaltered after the operation.**

The three basic modes of addressing are:

+ Register addressing
+ Immediate addressing
+ Memory addressing

## Register Addressing

In this addressing mode, **a register contains the operand**. Depending upon the instruction, the register may be the first operand, the second operand or both. For example:

```nasm
mov dx, taxRate    ; Register in first operand
mov count, cx      ; Register in second operand
mov eax, ebx       ; Both the operands are in registers
```

**As processing data between registers does not involve memory, it provides the fastest processing of data.**

## Immediate Addressing

An immediate operand has a constant value or an expression. When an instruction with two operands uses immediate addressing, **the first operand may be a register or memory location**, and the second operand is an immediate constant. The first operand defines the length of the data. For example:

```nasm
byteValue db 150  ; A byte value is defined
wordValue dw 300  ; A word value is defined
add byteValue, 65 ; An immediate operand 65 is added
mov ax, 45h       ; Immediate constant 45h is transferred to ax
```

## Direct Memory Addressing

When operands are specified in memory addressing mode, direct access to main memory, usually to the data segment, is required. This way of addressing results in slower processing of data. To locate the exact location of data in memory, we need the segment start address, which is typically found in the `ds` register and an offset value. This offset value is also called **effective address**.

In direct addressing mode, the offset value is specified directly as part of the instruction, usually indicated by the variable name. The assembler calculates the offset value and maintains a symbol table, which stores the offset values of all the variables used in the program.

In direct memory addressing, one of the operands refers to a memory location and the other operand references a register. For example:

```nasm
add byteValue, dl   ; Adds the register in the memory location
mov bx, wordValue   ; Operand from the memory is added to register
```

## Direct-Offset Addressing

This addressing mode uses the arithmetic operators to modify an address. For example, look at the following definitions that define tables of data:

```nasm
BYTE_TABLE db 14, 15, 22, 45      ; Tables of bytes
WORD_TABLE dw 134, 345, 564, 123  ; Tables of words
```

The following operations access data from the tables in the memory into registers:

```nasm
mov cl, BYTE_TABLE[2]   ; Gets the 3rd element of the BYTE_TABLE
mov cl, BYTE_TABLE + 2  ; Gets the 3rd element of the BYTE_TABLE
mov cx, WORD_TABLE[3]   ; Gets the 4th element of the WORD_TABLE
mov cx, WORD_TABLE + 3  ; Gets the 4th element of the WORD_TABLE
```

## Indirect Memory Addressing

This addressing mode utilizes the computer's ability of *Segment:Offset* addressing. Generally, the base registers `ebx`, `ebp` (or `bx`, `bp`) and the index registers (`di`, `si`), coded within square brackets for memory references, are used for this purpose.

Indirect addressing is generally used for variables containing several elements like, arrays. Starting address of the array is stored in, say, the `ebx` register.

The following code snippet shows how to access different elements of the variable.

```nasm
MY_TABLE times 10 dw 0  ; Allocates 10 words (2 bytes) each initialized to 0
mov ebx, [MY_TABLE]     ; Effective Address of MY_TABLE in ebx
mov [ebx], 110          ; MY_TABLE[0] = 110
add ebx, 2              ; ebx = ebx +2
mov [ebx], 123          ; MY_TABLE[1] = 123
```

> Effective addresses, in NASM, have a very simple syntax: they consist of an expression evaluating to the desired address, enclosed in square brackets.

## The `mov` Instruction

We have already used the MOV instruction that is used for moving data from one storage space to another. The `mov` instruction takes two operands.

```nasm
mov destination, source
```

The `mov` instruction may have one of the following five forms:

```nasm
mov register, register
mov register, immediate
mov memory, immediate
mov register, memory
mov memory, register
```

Please note that:

+ Both the operands in `mov` operation should be of same size
+ The value of source operand remains unchanged

The `mov` instruction causes ambiguity at times. For example, look at the statements:

```nasm
mov ebx, [MY_TABLE]  ; Effective Address of MY_TABLE in ebx
mov [ebx], 110       ; MY_TABLE[0] = 110
```

It is not clear whether you want to move a byte equivalent or word equivalent of the number `110`. In such cases, it is wise to use a type specifier.

Following table shows some common type specifiers:

| Type Specifier | Bytes addressed |
| :------------: | :-------------: |
|     `BYTE`     |        1        |
|     `WORD`     |        2        |
|    `DWORD`     |        4        |
|    `QWORD`     |        8        |
|    `TBYTE`     |       10        |

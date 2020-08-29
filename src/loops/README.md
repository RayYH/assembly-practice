# Loops

The `jmp` instruction can be used for implementing loops. For example, the following code snippet can be used for executing the loop-body 10 times:

```nasm
mov cl, 10
L1:
; <LOOP-BODY>
dec cl
jnz L1
```

The processor instruction set, however, includes a group of loop instructions for implementing iteration. The basic `loop` instruction has the following syntax:

```nasm
loop label
```

Where, `label` is the target label that identifies the target instruction as in the *jump* instructions. The `loop` instruction assumes that the `ecx` register contains the loop count. When the loop instruction is executed, the `ecx` register is decremented and the control jumps to the target label, until the `ecx` register value, i.e., the counter reaches the value zero.

The above code snippet could be written as:

```nasm
mov ecx, 10
L1:
; <LOOP-BODY>
loop L1
```

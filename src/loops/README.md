# Loops

The `JMP` instruction can be used for implementing loops. For example, the following code snippet can be used for executing the loop-body 10 times:

```nasm
MOV	CL, 10
L1:
; <LOOP-BODY>
DEC	CL
JNZ	L1
```

The processor instruction set, however, includes a group of loop instructions for implementing iteration. The basic LOOP instruction has the following syntax:

```nasm
LOOP 	label
```

Where, `label` is the target label that identifies the target instruction as in the `jump` instructions. The `LOOP` instruction assumes that the `ECX` register contains the loop count. When the loop instruction is executed, the `ECX` register is decremented and the control jumps to the target label, until the `ECX` register value, i.e., the counter reaches the value zero.

The above code snippet could be written as:

```nasm
mov ECX,10
l1:
; <LOOP-BODY>
loop l1
```


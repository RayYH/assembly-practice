# Procedures

Procedures or subroutines are very important in assembly language, as the assembly language programs tend to be large in size. Procedures are identified by a name. Following this name, the body of the procedure is described which performs a well-defined job. End of the procedure is indicated by a return statement.

## Introduction

Following is the syntax to define a procedure:

```nasm
proc_name:
   procedure body
   ; ...
   ret
```

The procedure is called from another function by using the `call` instruction. The `call` instruction should have the name of the called procedure as an argument as shown below:

```nasm
call proc_name
```

The called procedure returns the control to the calling procedure by using the `ret` instruction.

## Stacks Data Structure

A stack is an array-like data structure in the memory in which data can be stored and removed from a location called the 'top' of the stack. The data that needs to be stored is 'pushed' into the stack and data to be retrieved is 'popped' out from the stack. Stack is a **LIFO** data structure, i.e., the data stored first is retrieved last.

Assembly language provides two instructions for stack operations: `push` and `pop`. These instructions have syntax like:

```nasm
push operand
pop address/register
```

The memory space reserved in the stack segment is used for implementing stack. The registers `ss` and `esp` (or `sp`) are used for implementing the stack. The top of the stack, which points to the last data item inserted into the stack is pointed to by the `ss:esp` register, where the `ss` register points to the beginning of the stack segment and the `sp` (or `esp`) gives the offset into the stack segment.

The stack implementation has the following characteristics:

+ Only words or double-words could be saved into the stack, not a byte.
+ The stack grows in the reverse direction, i.e., toward the lower memory address
+ The top of the stack points to the last item inserted in the stack; it points to the lower byte of the last word inserted.

As we discussed storing the values of the registers in the stack before using them for some use; it can be done in following way:

```nasm
; Save the ax and bx registers in the stack
push ax
push bx

; Use the registers for other purpose
mov	ax, value1
mov bx, value2
mov value1, ax
mov	value2, bx

; Restore the original values
pop	bx
pop	ax
```

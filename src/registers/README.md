# Registers

## Processor Registers

There are ten 32-bit and six 16-bit processor registers in IA-32 architecture. The registers are grouped into three categories:

+ General registers
+ Control registers
+ Segment registers

The general registers are further divided into the following groups:

+ Data registers
+ Pointer registers
+ Index registers

## Data Registers

Four 32-bit data registers are used for arithmetic, logical, and other operations. These 32-bit registers can be used in three ways:

+ As complete 32-bit data registers: `EAX`, `EBX`, `ECX`, `EDX`.
+ Lower halves of the 32-bit registers can be used as four 16-bit data registers: `AX`, `BX`, `CX` and `DX`.
+ Lower and higher halves of the above-mentioned four 16-bit registers can be used as eight 8-bit data registers: `AH`, `AL`, `BH`, `BL`, `CH`, `CL`, `DH`, and `DL`.

Some of these data registers have specific use in arithmetical operations.

+ **`AX` is the primary accumulator**; it is used in input/output and most arithmetic instructions. For example, in multiplication operation, one operand is stored in `EAX` or `AX` or `AL` register according to the size of the operand.
+ **`BX` is known as the base register**, as it could be used in indexed addressing.
+ **`CX` is known as the count register**, as the `ECX`, `CX` registers store the loop count in iterative operations.
+ **`DX` is known as the data register**. It is also used in input/output operations. It is also used with `AX` register along with `DX` for multiply and divide operations involving large values.

## Pointer Registers

The pointer registers are 32-bit `EIP`, `ESP`, and `EBP` registers and corresponding 16-bit right portions `IP`, `SP`, and `BP`. There are three categories of pointer registers:

- **Instruction Pointer (`IP`)** − The 16-bit `IP` register stores the offset address of the next instruction to be executed. `IP` in association with the `CS` register (as `CS:IP`) gives the complete address of the current instruction in the code segment.
- **Stack Pointer (`SP`)** − The 16-bit `SP` register provides the offset value within the program stack. `SP` in association with the `SS` register (`SS:SP`) refers to be current position of data or address within the program stack.
- **Base Pointer (`BP`)** − The 16-bit `BP` register mainly helps in referencing the parameter variables passed to a subroutine. The address in `SS` register is combined with the offset in `BP` to get the location of the parameter. `BP` can also be combined with `DI` and `SI` as base register for special addressing.

## Index Registers


The 32-bit index registers, `ESI` and `EDI`, and their 16-bit rightmost portions. `SI` and `DI`, are used for indexed addressing and sometimes used in addition and subtraction. There are two sets of index pointers:

- **Source Index (`SI`)** − It is used as source index for string operations.
- **Destination Index (`DI`)** − It is used as destination index for string operations.

## Control Registers

The 32-bit instruction pointer register and the 32-bit flags register combined are considered as the control registers.

The common flag bits are:

- **Overflow Flag (`OF`)** − It indicates the overflow of a high-order bit (leftmost bit) of data after a signed arithmetic operation.
- **Direction Flag (`DF`)** − It determines left or right direction for moving or comparing string data. When the `DF` value is `0`, the string operation takes left-to-right direction and when the value is set to 1, the string operation takes right-to-left direction.
- **Interrupt Flag (`IF`)** − It determines whether the external interrupts like keyboard entry, etc., are to be ignored or processed. It disables the external interrupt when the value is 0 and enables interrupts when set to 1.
- **Trap Flag (`TF`)** − It allows setting the operation of the processor in single-step mode. The `DEBUG` program we used sets the trap flag, so we could step through the execution one instruction at a time.
- **Sign Flag (`SF`)** − It shows the sign of the result of an arithmetic operation. This flag is set according to the sign of a data item following the arithmetic operation. The sign is indicated by the high-order of leftmost bit. A positive result clears the value of `SF` to 0 and negative result sets it to 1.
- **Zero Flag (`ZF`)** − It indicates the result of an arithmetic or comparison operation. A nonzero result clears the zero flag to 0, and a zero result sets it to 1.
- **Auxiliary Carry Flag (`AF`)** − It contains the carry from bit 3 to bit 4 following an arithmetic operation; used for specialized arithmetic. The `AF` is set when a 1-byte arithmetic operation causes a carry from bit 3 into bit 4.
- **Parity Flag (`PF`)** − It indicates the total number of 1-bits in the result obtained from an arithmetic operation. An even number of 1-bits clears the parity flag to 0 and an odd number of 1-bits sets the parity flag to 1.
- **Carry Flag (`CF`)** − It contains the carry of 0 or 1 from a high-order bit (leftmost) after an arithmetic operation. It also stores the contents of last bit of a *shift* or *rotate* operation.

The following table indicates the position of flag bits in the 16-bit Flags register:

|  Flag:  |      |      |      |      | O    | D    | I    | T    | S    | Z    |      | A    |      | P    |      | C    |
| :-----: | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| Bit no: | 15   | 14   | 13   | 12   | 11   | 10   | 9    | 8    | 7    | 6    | 5    | 4    | 3    | 2    | 1    | 0    |

## Segment Registers

Segments are specific areas defined in a program for containing data, code and stack. There are three main segments:

- **Code Segment** − It contains all the instructions to be executed. A 16-bit Code Segment register or `CS` register stores the starting address of the code segment.
- **Data Segment** − It contains data, constants and work areas. A 16-bit Data Segment register or `DS` register stores the starting address of the data segment.
- **Stack Segment** − It contains data and return addresses of procedures or subroutines. It is implemented as a 'stack' data structure. The Stack Segment register or SS register stores the starting address of the stack.

[Memory segmentation](http://en.wikipedia.org/wiki/Memory_segmentation) is the old way of accessing memory regions. All major operating systems including OSX, Linux, (from version 0.1) and Windows (from NT) are now using [paging](http://en.wikipedia.org/wiki/Paging) which is a better way (IMHO) of accessing memory.

Intel, has always introduced backward compatibility in its processors (except IA-64, and we saw how it failed...) So, in its initial state (after reset) the processor starts in a mode called [real mode](http://en.wikipedia.org/wiki/Real_mode), in this mode, segmentation is enabled by default to support legacy software. During the boot process of the operating system, the processor is changed into [protected mode](http://en.wikipedia.org/wiki/Protected_mode), and then in enabled paging.

Before paging, the segment registers were used like this:

> In real mode each logical address points directly into physical memory location, every logical address consists of two 16 bit parts: The segment part of the logical address contains the base address of a segment with a granularity of 16 bytes, i.e. a segments may start at physical address 0, 16, 32, ..., 2^20-16. The offset part of the logical address contains an offset inside the segment, i.e. the physical address can be calculated as `physical_address := segment_part × 16 + offset` (if the address line A20 is enabled), respectively `(segment_part × 16 + offset`) mod 2^20` (if A20 is off) Every segment has a size of 2^16 bytes.

**Let's see some examples (286-386 era) :**

The 286 architecture introduced 4 segments: `CS` (code segment) `DS` (data segment) `SS` (stack segment) `ES` (extra segment) the 386 architecture introduced two new general segment registers `FS`, `GS`.

typical assembly opcode (in Intel syntax) would look like:

```nasm
mov dx, 850h
mov es, dx     ; Move 850h to es segment register
mov es:cx, 15h ; Move 15 to es:cx
```

Using paging (protected mode) the segment registers weren't used anymore for addressing memory locations.

> In protected mode the `segment_part` is replaced by a 16 bit selector, the 13 upper bits (bit 3 to bit 15) of the selector contains the index of an entry inside a descriptor table. The next bit (bit 2) specifies if the operation is used with the GDT or the LDT. The lowest two bits (bit 1 and bit 0) of the selector are combined to define the privilege of the request; where a value of 0 has the highest priority and value of 3 is the lowest.

The segments however still used to enforce hardware security in the `GDT`:

> The Global Descriptor Table or GDT is a data structure used by Intel x86-family processors starting with the 80286 in order to define the characteristics of the various memory areas used during program execution, including the base address, the size and access privileges like executability and writability. These memory areas are called segments in Intel terminology.

So, in practice the segment registers in protected mode are used to store indexes to the `GDT`.

Several operating systems such as Windows and Linux, use some of these segments for internal usage. for instance Windows x64 uses the `GS` register to access the TLS (thread local storage) and in Linux it's for accessing cpu specific memory.

## `times`

The `TIMES` prefix causes the instruction to be assembled multiple times. This is partly present as NASM's equivalent of the `DUP` syntax supported by MASM–compatible assemblers, in that you can code:

```nasm
times 64 db 0
```

## More Readings
 
+ [Assembly - Registers](https://www.tutorialspoint.com/assembly_programming/assembly_registers.htm)
+ [Carry Flag, Auxiliary Flag and Overflow Flag in Assembly](https://stackoverflow.com/questions/19301498/carry-flag-auxiliary-flag-and-overflow-flag-in-assembly/19301682)
+ [How are the segment registers (fs, gs, cs, ss, ds, es) used in Linux?](https://reverseengineering.stackexchange.com/questions/2006/how-are-the-segment-registers-fs-gs-cs-ss-ds-es-used-in-linux)

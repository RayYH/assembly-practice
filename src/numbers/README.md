# Numbers

Numerical data is generally represented in binary system. Arithmetic instructions operate on binary data. When numbers are displayed on screen or entered from keyboard, they are in ASCII form. 

Decimal numbers can be represented in two forms:

+ ASCII form
+ BCD or Binary Coded Decimal form

### ASCII Representation

In ASCII representation, decimal numbers are **stored as string of ASCII characters**. For example, the decimal value `1234` is stored as:

```none
31	32	33	34H
```

Where, `31H` is ASCII value for `1`, `32H` is ASCII value for `2`, and so on. There are four instructions for processing numbers in ASCII representation:

+ `AAA` − ASCII Adjust After Addition
+ `AAS` − ASCII Adjust After Subtraction
+ `AAM` − ASCII Adjust After Multiplication
+ `AAD` − ASCII Adjust Before Division

These instructions do not take any operands and assume the required operand to be in the `AL` register.

## BCD Representation

There are two types of BCD representation:

+ Unpacked BCD representation
+ Packed BCD representation

In unpacked BCD representation, each byte stores the binary equivalent of a decimal digit. For example, the number 1234 is stored as:

```none
01	02	03	04H
```

There are two instructions for processing these numbers:

+ `AAM` − ASCII Adjust After Multiplication
+ `AAD` − ASCII Adjust Before Division

The four ASCII adjust instructions, `AAA`, `AAS`, `AAM`, and `AAD`, can also be used with unpacked BCD representation. In packed BCD representation, each digit is stored using four bits. Two decimal digits are packed into a byte. For example, the number `1234` is stored as:

```none
12	34H
```

There are two instructions for processing these numbers:

+ `DAA` − Decimal Adjust After Addition
+ `DAS` − decimal Adjust After Subtraction

There is no support for multiplication and division in packed BCD representation.

## More Readings

+ [How do ASCII Adjust and Decimal Adjust instructions work?](https://stackoverflow.com/questions/24092600/how-do-ascii-adjust-and-decimal-adjust-instructions-work)

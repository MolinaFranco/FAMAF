#### Ej1

    f   g   h   i   j
    X0  X1  X2  X3  X4

```
a)f = g + h + i + j;
add>> x1 x1 x2
add>> x3 x3 x4
add>> x0 x1 x3
ó
add>> x0 x1 x2
add>> x0 x0 x3
add>> x0 x0 x4

b)f = g + (h + 5);
addi>>  x9 x2 #5
add>>   x0 x1 x9  

c)f = (g + h) + (g + h);
add>>   x9 x2 x1
add>>   x0 x9 x9
```

#### Ej2

    X0  X1  X2
    f   g   h

```
a)  ADD  X0, X1, X2
    f = g + h

b)  ADDI X0, X0, #1
    ADD  X0, X1, X2
    f = g + h
```

#### Ej3

    f   g
    x0  x1

```
a)f = -g - f;
add>>   x0 x0 x1
add>>   x0 xzr x0

b)f = g + (-f - 5);
addi>>  x0 x0 #5
add>>   x0 xzr x0
add>>   x0 x0 x1
```

#### Ej4

    X0  X1  X2
    f   g   h

```
a)  SUB  X1, XZR, X1
    ADD  X0, X1, X2
    f = h - g

b)  ADDI X2, X0, #1
    SUB  X0, X1, X2
    f = g - (f + 1)
``` 

#### Ej5

    f   g   h   i 
    X0  X1  X2  X3

dirección base de los arreglos 

    A   B
    X6  X7 

- Por defecto asumimos que los elementos de los arreglos son doubleword

```
a)  f = -g - A[4];

LDUR>>  X0, [X6, #32]           // f = A[4] // & A[4] = & A[0] + 4*8
ADD>>   X0, X0, X1 
SUB>>   X0, XZR, X0

b)  B[8] = A[i - j];


```
- ¿Cuántos registros se utilizan para llevar a cabo las operaciones anteriores?

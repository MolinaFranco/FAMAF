parte teorica del ejer 2

a)

{Pre: x = X, y = Y} 
x, y := x + 1, x + y
{Post: x = X + 1, y = X + Y} */

==asigancion simple==>

{Pre: x = X, y = Y}
y := x + y;
x := x + 1
{Post: x = X + 1, y = X + Y} */

b)

{Pre: x = X, y = Y, z = Z}
x, y, z := y, y + x + z, y + x
{Post: x = Y, y = Y + X + Z, z = Y + X} 

==asigancion simple==>

{Pre: x = X, y = Y, z = Z}
 a := y
 b := y + x + z
 c := y + x
 x := a
 y := b
 z := c
{Post: x = Y, y = Y + X + Z, z = Y + X}

==otra opcion de asigancion simple==>

{Pre: x = X, y = Y, z = Z}
 y := y + x + z;
 z := y - z;
 x := y - x - z;
{Post: x = Y, y = Y + X + Z, z = Y + X} 
#38)

soloCeros::[Num]->Bool
{1} soloCeros [] = True
{2} soloCeros (x.xs) = x=0 ∧ soloCeros.xs

e :: num -> [Num] -> Bool
{3} e x [] = False
{4} e x (y:ys) = x == y ∨ xeys 

HIPOTESIS INDUCTIVA
soloCeros.xs ≡ <Ax : xexs : x=0>

CASO BASE
soloCeros.[] ≡ <Ax : xe[] : x=0>
{1 y 3}
True ≡ <Ax : [] : x=0>
{Rango Vacıo de∀}
True ≡ True

CASO INDUCTIVO
soloCeros.(x:xs) ≡ <Az : z e (x:xs) : z=0>
{2 y 4}
x=0 ∧ soloCeros.xs ≡ <Az : z == x ∨ zexs  : z=0>
{H.I}
x=0 ∧ <Ax : xexs : x=0> ≡ <Az : z == x ∨ zexs : z=0>
{particion del rango}
x=0 ∧ <Ax : xexs : x=0> ≡ <Az : z == x : z=0> ∧ <Az : zexs : z=0>
{Rango unitario de∀}
x=0 ∧ <Ax : xexs : x=0> ≡ x=0 ∧ <Az : zexs : z=0>
{cambio de variable}
x=0 ∧ <Ax : xexs : x=0> ≡ x=0 ∧ <Ax : xexs : x=0>
{}
True

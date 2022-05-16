quitarCeros:: [Num] -> [Num]
{1} quitarCeros [] = []
{2} quitarCeros x:xs =  |x != 0 = x:quitarCeros.xs
{3}                    |x == 0 = quitarCeros.xs

sum:: [Num] -> Num
{4} sum [] = 0
{5} sum (x:xs) = x+sum.xs

HIPOTESIS INDUCTIVA

sum(quitarCeros.xs) = sum.xs

CASO BASE

sum(_quitarCeros.[]_) = _sum.[]_
{1} y {4}
_sum(0)_ = 0
{4}
0 = 0

PASO INDUCTIVO x!=0

sum(quitarCeros.x:xs) = _sum.x:xs_
{5}
sum(quitarCeros.x:xs) = x + _sum.xs_
H.I
sum(_quitarCeros.x:xs)_ = x + sum(quitarCeros.xs)
{2}
sum(x:quitarCeros.xs) = x + sum(quitarCeros.xs)
{5}
x + sum(quitarCeros.xs) = x + sum(quitarCeros.xs)

PASO INDUCTIVO x!=0

sum(quitarCeros.x:xs) = _sum.x:xs_
{5}
sum(quitarCeros.x:xs) = x + _sum.xs_
H.I
sum(_quitarCeros.x:xs)_ = x + sum(quitarCeros.xs)
{3}
sum(quitarCeros.xs)_ = x + sum(quitarCeros.xs)
{x = 0}
sum(quitarCeros.xs)_ = 0 + sum(quitarCeros.xs)
{neutro de la suma}
sum(quitarCeros.xs)_ = sum(quitarCeros.xs)
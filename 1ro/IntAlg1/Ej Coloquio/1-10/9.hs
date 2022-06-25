invertir:: [Num] -> [Num]
{1} invertir [] = []
{2} invertir (x:xs) = (-x):(invertir.xs) 

sum:: [Num] -> Num
{3} sum [] = 0
{4} sum (x:xs) = x+sum.xs

HIPOTESIS INDUCTIVA
sum(invertir.xs) = -sum.xs

CASO BASE
sum(_invertir.[]_) = -_sum.[]_
{1 y 3}
sum([]) = -0
{3}
0 = 0

CASO INDUCTIVO
sum(_invertir(x:xs)_) = -sum(x:xs)
{2 y 4}
sum((-x):(invertir.xs)) = -(x+sum.xs)
{4}
(-x)+sum(invertir.xs) = -x-sum.xs
{H.I y distibutiva de la suma}
-x-sum.xs = -x-sum.xs
#37)

algunCuadrado::[Figura]->Bool
{1} algunCuadrado [] = False
{2} algunCuadrado (x:xs) = cuadrado.x ∨ algunCuadrado.xs

e :: num -> [Num] -> Bool
{3} e x [] = False
{4} e x (y:ys) = x == y ∨ e.x.ys

HIPOTESIS INDUCTIVA
algunCuadrado.xs ≡ <Ex : xexs : cuadrado.x>

CASO BASE
algunCuadrado.[] ≡ <Ex : xe[] : cuadrado.x>
{1}
False ≡ <Ex : xe[] : cuadrado.x>
{3}
False ≡ <Ex : False : cuadrado.x>
{Rango Vacıo de ∃}
False ≡ False

PASO INDUCTIVO
algunCuadrado.(x:xs) ≡ <Ez : ze(x:xs) : cuadrado.x>
{2}
cuadrado.x ∨ algunCuadrado.xs ≡ <Ez : ze(x:xs) : cuadrado.x>
{H.I}
cuadrado.x ∨ <Ex : xexs : cuadrado.x> ≡ <Ez : ze(x:xs) : cuadrado.x>
{4}
cuadrado.x ∨ <Ex : xexs : cuadrado.x> ≡ <Ez : z == x ∨ e.z.xs : cuadrado.x>
{Partici ́on de rango de∃}
cuadrado.x ∨ <Ex : xexs : cuadrado.x> ≡ <Ez : z == x : cuadrado.x> ∨ <Ez : zexs : cuadrado.x>
{rango unitario}
cuadrado.x ∨ <Ex : xexs : cuadrado.x> ≡ cuadrado.z ∨ <Ez : zexs : cuadrado.x>
{cambio de variable}
cuadrado.x ∨ <Ex : xexs : cuadrado.x> ≡ cuadrado.z ∨ <Ex : xexs : cuadrado.x>
{reflexiilidad del igual}
True


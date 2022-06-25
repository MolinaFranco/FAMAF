#39)

hayTR::[Figura]->Bool
{1} hayTR [] = False
{2} hayTR (x:xs) = (triangulo.x ∧ rojo.x) ∨ hayTR.xs

e :: num -> [Num] -> Bool
{3} e x [] = False
{4} e x (y:ys) = x == y ∨ xeys 

HIPOTESIS INDUCTIVA
hayTR.xs ≡ <Ey : yexs : triangulo.y ∧ rojo.y>

CASO BASE
hayTR.[] ≡ <Ey : ye[] : triangulo.y ∧ rojo.y>
{1 y 3}
False ≡ <Ey : False : triangulo.y ∧ rojo.y>
{Rango Vacıo de E}
False ≡ False

CASO INDUCTIVO
hayTR.(x:xs) ≡ <Ey : ye(x:xs) : triangulo.y ∧ rojo.y>
{2 y 4}
(triangulo.x ∧ rojo.x) ∨ hayTR.xs ≡ <Ey : y == x ∨ yexs  : triangulo.y ∧ rojo.y>
{particion del rango}
(triangulo.x ∧ rojo.x) ∨ hayTR.xs ≡ <Ey : y == x : triangulo.y ∧ rojo.y> ∨ <Ey : yexs  : triangulo.y ∧ rojo.y>
{Rango unitario de ∃}
(triangulo.x ∧ rojo.x) ∨ hayTR.xs ≡ (triangulo.x ∧ rojo.x) ∨ <Ey : yexs  : triangulo.y ∧ rojo.y>
{H.I}
(triangulo.x ∧ rojo.x) ∨ hayTR.xs ≡ (triangulo.x ∧ rojo.x) ∨ hayTR.xs
{refle del ≡} 
True
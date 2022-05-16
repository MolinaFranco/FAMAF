#40)

hayCoT::[Figura]->Bool
{1} hayCoT [] = False
{2} hayCoT (x:xs) = (ciculo.x ∨ triangulo.x) ∨ hayCoT.xs

e :: num -> [Num] -> Bool
{3} e x [] = False
{4} e x (y:ys) = x == y ∨ xeys 

HIPOTESIS INDUCTIVA
hayCoT.xs ≡ <Ey : yexs : circulo.y ∨ triangulo.y>

CASO BASE
hayCoT.[] ≡ <Ey : ye[] : circulo.y ∨ triangulo.y>
{1 y 3}
False ≡ <Ey : False : circulo.y ∨ triangulo.y>
{Rango Vacıo de E}
False ≡ False

CASO INDUCTIVO
hayCoT.(x:xs) ≡ <Ey : ye(x:xs) : circulo.y ∨ triangulo.y>
{2 y 4}
(ciculo.x ∨ triangulo.x) ∨ hayCoT.xs ≡ <Ey : y == x ∨ yexs : circulo.y ∨ triangulo.y>
{Particion de rango de E}
(ciculo.x ∨ triangulo.x) ∨ hayCoT.xs ≡ <Ey : y == x : circulo.y ∨ triangulo.y> ∨ <Ey : yexs : circulo.y ∨ triangulo.y>
{Rango unitario de ∃}
(ciculo.x ∨ triangulo.x) ∨ hayCoT.xs ≡ (circulo.x ∨ triangulo.x) ∨ <Ey : yexs : circulo.y ∨ triangulo.y>
{H.I}
(ciculo.x ∨ triangulo.x) ∨ hayCoT.xs ≡ (circulo.x ∨ triangulo.x) ∨ hayCoT.xs
{Reflexividad del igual}
True


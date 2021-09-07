#26)

<|Ex : : cuadrado.x|> ∧ <|Ay : : amarillo.y|> => <|Ex : : cuadrado.x ∧ amarillo.x|>
{Caracterizaci ́on de implicaci ́on}
¬(<|Ex : : cuadrado.x|> ∧ <|Ay : : amarillo.y|>) ∨ <|Ex : : cuadrado.x ∧ amarillo.x|>
{De Morgan para la conjunci ́on}
¬<|Ex : : cuadrado.x|> ∨ ¬<|Ay : : amarillo.y|>) ∨ <|Ex : : cuadrado.x ∧ amarillo.x|>
{Definici ́on de ∃}
¬<|Ex : : cuadrado.x|> ∨ <|Ey : : ¬amarillo.y|>) ∨ <|Ex : : cuadrado.x ∧ amarillo.x|>
{cambio de bariable de E}
¬<|Ex : : cuadrado.x|> ∨ <|Ex : : ¬amarillo.x|>) ∨ <|Ex : : cuadrado.x ∧ amarillo.x|>
{Caracterizaci ́on de implicaci ́on}
<|Ex : : cuadrado.x|> => <|Ex : : ¬amarillo.x|> ∨ <|Ex : : cuadrado.x ∧ amarillo.x|>
{Regla del t ́ermino de∃}
<|Ex : : cuadrado.x|> => <|Ex : : ¬amarillo.x ∨ (cuadrado.x ∧ amarillo.x)|>
{distributiva}
<|Ex : : cuadrado.x|> => <|Ex : : ((¬amarillo.x ∨ cuadrado.x) ∧ (¬amarillo.x ∨ amarillo.x))|>
{Principio de no contradicci ́on}
<|Ex : : cuadrado.x|> => <|Ex : : ((¬amarillo.x ∨ cuadrado.x) ∧ True|>
{Intercambio entre rango y t ́ermino de∃:}
<|Ex : : cuadrado.x|> => <|Ex : : ¬amarillo.x ∨ cuadrado.x|>
{Regla del t ́ermino de∃}
<|Ex : : cuadrado.x|> => <|Ex : : ¬amarillo.x|> ∨ <|Ex : : cuadrado.x|>
{debilitamiento para v}
True


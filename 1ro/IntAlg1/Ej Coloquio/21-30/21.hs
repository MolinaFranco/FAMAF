#21 a)

(p=>q)=>(p^r=>q)
{Caracterizacion de implicacion}
¬(¬p v q)v(¬(p ∧ r) v q)
{morgan para la disyuncion y conjuncion}
(¬¬p ∧ ¬q)v((¬p ∨ ¬r v q)
{doble negacion}
(p ∧ ¬q) v ¬p ∨ ¬r v q
{Asociativa}
(p v ¬p) ∧ (¬q v ¬p) ∨ ¬r v q
{tercero excluido}
True ∧ (¬q v ¬p) ∨ ¬r v q
{Neutro de la conjuncion}
(¬q v ¬p) ∨ ¬r v q
{Asociativa}
(¬q v q) v (¬p v q) ∨ ¬r 
{tercero excluido}
True v ¬p v q ∨ ¬r 
{Elemento absorbente de la disyuncion}
True 

#21 b)

(¬q=>¬p) ∨ r ≡ p ∨ q ∨ r ≡ q ∧ r ≡ q ≡ r
{Caracterizaci ́on de implicaci ́on}
¬¬q ∨ ¬p ∨ r ≡ p ∨ q ∨ r ≡ q ∧ r ≡ q ≡ r
{doble negacion}
(q ∨ ¬p ∨ r) ≡ (p ∨ q ∨ r) ≡ _(q ∧ r) ≡ q ≡ r_
{regla dorada}
(q ∨ ¬p ∨ r) ≡ (p ∨ q ∨ r) ≡ (q ∨ r)
{acomodo}
¬p ∨ (q ∨ r) ≡ p ∨ (q ∨ r) ≡ (q ∨ r)
{Caracterizaci ́on de implicaci ́on}
p => (q ∨ r) ≡ p ∨ (q ∨ r) ≡ (q ∨ r)
{Definici ́on de implicaci ́on}
p => (q ∨ r) ≡ p => (q ∨ r) 
{equivalencia del igual}
True














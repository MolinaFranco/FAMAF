#32)

<Ax : : ¬(P.x => Q.x)> ≡ (<Ax : : P.x> ∧ <Ax : : ¬Q.x>) 
{regla de termino de A}
<Ax : : ¬(P.x => Q.x)> ≡ <Ax : : P.x ∧ ¬Q.x> 
{de morgan para la conjuncion}
<Ax : : ¬(P.x => Q.x)> ≡ <Ax : : ¬(¬P.x ∧ Q.x)> 
{caracterizacion de implica}
<Ax : : ¬(P.x => Q.x)> ≡ <Ax : : ¬(P.x => Q.x)> 
{reflex del ≡}
True

#32)a)

<Ax : : T.x> => <Ax : R.x : T.x>
{definicion dual del implica}
<Ax : : T.x> ∧ <Ax : R.x : T.x> ≡ <Ax : : T.x>
{intercambio entre rango y termino}
<Ax : : T.x> ∧ <Ax : : R.x => T.x> ≡ <Ax : : T.x>
{regla de termino de A}
<Ax : : (R.x => T.x) ∧ T.x> ≡ <Ax : : T.x>
{caracterizacion de implica}
<Ax : : (¬R.x ∨ T.x) ∧ T.x> ≡ <Ax : : T.x>
{ley de absorcion}
<Ax : : T.x> ≡ <Ax : : T.x>




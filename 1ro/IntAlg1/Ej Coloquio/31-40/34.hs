#34)

<Ax : : P.x => Q.x> => (<Ex : : P.x> => <E.x : : Q.x>)
{caracterizacion del implica}
<Ax : : ¬P.x ∨ Q.x> => (<Ex : : P.x> => <E.x : : Q.x>)
{Definicion de E}
¬<Ex : : ¬(¬P.x ∨ Q.x)> => (<Ex : : P.x> => <E.x : : Q.x>)
{morgan}
¬<Ex : : P.x ∧ ¬Q.x> => (<Ex : : P.x> => <E.x : : Q.x>)
{Definicion de implica}
<Ex : : P.x ∧ ¬Q.x> ∨ ¬<Ex : : P.x> ∨ <E.x : : Q.x>
{conmutatividad}}
¬<Ex : : P.x> ∨ <Ex : : P.x ∧ ¬Q.x> ∨ <E.x : : Q.x>
{regla del termino E}
¬<Ex : : P.x> ∨ <Ex : : (P.x ∧ ¬Q.x) ∨ Q.x>
{Distributiva}
¬<Ex : : P.x> ∨ <Ex : : (P.x ∨ Q.x) ∧ (¬Q.x ∨ Q.x)>
{tercer explucido}
¬<Ex : : P.x> ∨ <Ex : : (P.x ∨ Q.x) ∧ True>
{neutro}
¬<Ex : : P.x> ∨ <Ex : : (P.x ∨ Q.x)>
{regla del termino E}
¬<Ex : : P.x> ∨ <Ex : : P.x> ∨ <Ex : : Q.x>
{tercer excluido}
True ∨ <Ex : : Q.x>
{elemento absorvente de la disyuncion}
True



<Ex : : P.x> => <Ex : : P.x> ∨ <Ex : : Q.x>
{devilitamiento para ∨}
True



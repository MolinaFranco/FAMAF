#33)

(<Ex : R.x : T.x> ∧ <Ax : R.x : S.x>) => <Ex : R.x : T.x ∧ S.x>
{definicion de E}
(<Ex : R.x : T.x> ∧ ¬<Ex : R.x : ¬S.x>) => <Ex : R.x : T.x ∧ S.x>
{caracterizacion de implica}
¬(<Ex : R.x : T.x> ∧ ¬<Ex : R.x : ¬S.x>) ∨ <Ex : R.x : T.x ∧ S.x>
{morgan}
¬<Ex : R.x : T.x> ∨ <Ex : R.x : ¬S.x> ∨ <Ex : R.x : T.x ∧ S.x>
{}
¬<Ex : R.x : T.x> ∨ <Ex : : (R.x ∧ ¬S.x)> ∨ <Ex : : (R.x ∧ (T.x ∧ S.x))>
{regla dle termino}
¬<Ex : R.x : T.x> ∨ <Ex : : (R.x ∧ ¬S.x) ∨ (R.x ∧ (T.x ∧ S.x))>
{distributiva}
¬<Ex : R.x : T.x> ∨ <Ex : : (R.x ∧ ¬S.x) ∨ (R.x ∧ T.x) ∧ (R.x ∧ S.x)>
{factor comun}
¬<Ex : R.x : T.x> ∨ <Ex : : R.x ∧ (¬S.x ∨ T.x ∨ S.x)>
{principio de no contradiccion}
¬<Ex : R.x : T.x> ∨ <Ex : : R.x ∧ (True ∨ T.x)>
{elemento neutro de la conjuncion}
¬<Ex : R.x : T.x> ∨ <Ex : : R.x ∧ T.x>
{regla de termino}
¬<Ex : R.x : T.x> ∨ <Ex : R.x : T.x>
{tercer excluido}
True



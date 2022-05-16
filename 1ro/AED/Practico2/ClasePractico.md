sum_par.n = 〈 Σ i : 0 ≤ i ≤ n ∧ par.i : i 〉 

Sum_par:: Nat -> Nat

Caso Base 
N = 0

Sum_par.0
= {esp}
〈 Σ i : 0 ≤ i ≤ 0 ∧ par.i : i 〉
= { Aritmetica}
〈 Σ i : i = 0 ∧ par.i : i 〉 tendriamos que usar esto no?
= {Rango unitario y condición}
(par 0 → 0
¬par 0 → 0
)
= {Se cumple par 0}
0
〈 Σ i : par.0 : i 〉
sum_par.0 = 0

Caso Inductivo  n = m+1
{HI} = sum_par.m = 〈 Σ i : 0 ≤ i ≤ m ∧ par.i : i 〉

Sum_par.m+1
 = {esp}
〈 Σ i : 0 ≤ i ≤ m+1 ∧ par.i : i 〉
= {Aritmetica}
〈 Σ i : (0 ≤ i ≤ m v i=m+1) ∧ par.i : i 〉
= { distributividad del ∧ respecto de la v}
 〈 Σ i : (0 ≤ i ≤ m ∧ par.i) v(i=m+1 ∧ par.i ) : i 〉
={ Particion de rango}
〈 Σ i : (0 ≤ i ≤ m ∧ par.i) : i 〉+〈 Σ i :i=m+1 ∧ par.i  : i 〉
= {Hipotesis Inductiva}
Sum_par.m + 〈 Σ i :i=m+1 ∧ par.i: i 〉
={rango unitario y condición}
Sum_par.m +(par m+1 → m+1
¬par m+1 → 0
   )

Sum_par m+1 = (par m+1 → m+1 + Sum_par.m
                                                  ¬par m+1 → 0 + Sum_par.m
               )

Ah creo que si, quedaria definida como con |?
Si es lo mismo
Sisis creo que estaria bien asi
Sum_par.m+1 | par m+1 ≐  m+1 + Sum_par.m
                                       |¬par m+1 ≐  0 + Sum_par.m
Algo asi? Si, pero eso seria en Haskell creo y en el teorico practico tenemos que usar esta notacion me parece

Sum_par:: Nat -> Nat
sum_par.0 = 0
Sum_par m+1 = (par m+1 → m+1 + Sum_par.m
                                                  ¬par m+1 → 0 + Sum_par.m
               )

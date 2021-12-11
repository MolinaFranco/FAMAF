## 1)  

#### a) 

```haskell
Derivar un programa que calcule el menor entero x que satisface 
x³+x≥N

{N>=0}
S1;
{x³+x>=N ∧ 〈∀a : 0<=a<x : a³+a<N〉}


- Lo refinamos como (la composición secuencial) una inicialización y un ciclo.

{N>=0}
S0;
{I}
do B →
 S₁
od
{x³+x>=N ∧ 〈∀a : 0<=a<x : a³+a<N 〉}

- Definir el invariante tal que P=>I

{N>=0}
S0;
{I : 〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N}

- Para esto necesitamos que 0<=x y por esto lo inicializo en 0 

{N>=0}
x:=0
{I : 〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N}

- y necesitamos la guarda, garantizando I∧¬B ⇒ Q

{I : 〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N} ∧ ¬B => {x³+x>=N  ∧ 〈∀a : 0<=a<x : a³+a<N 〉}

- por ende ¬B = (x³+x>=N) 
- planteo lo que sabemos ademas agrego { I ∧ b } c { I } para deribar el programa

{N>=0}
x:=0
{I}
do (x³+x<N) →
    { I ∧ (x³+x<N) }
    S₁
    { I }
od
{x³+x>=N  ∧ 〈∀a : 0<=a<x : a³+a<N 〉}

- refinamos S₁ planteando una asignacion de las variables

{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) }
    x := E
{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N}

- Como queremos que el ciclo termine agreguemos la condición sobre la cota (que decrezca)

{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
    x := E
{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ T>N-x}

- Esto nos indica que x tiene que incrementarse , entonces refinamos S₁ .

{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
    x := x+1 
{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ T>N-x}

- Planteo lo que se hasta el momento

{N>=0}
x:=0
{I}
do (x³+x < N) →
    {〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
    x := x+1
    {〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ T>N-x}
od
{x³+x>=N  ∧ 〈∀a : 0<=a<x : a³+a<N 〉}

- verifico el planteamiento de x:=x+1

{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
    x := x+1 
{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ T>N-x}

={ utilizo caso de prueba de asignacion}

{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
=>
(x := x+1){〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ T>N-x}

={ remplazo x }

{〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
=>
{〈∀a : 0<=a<x+1 : a³+a<N 〉 ∧ 0<=x+1<=N ∧ T>N-x}

={hipotesis de T=N-x}

{〈∀a : 0<=a<x+1 : a³+a<N 〉 ∧ 0<=x+1<=N ∧ N-x+1>N-x}

={aritmetica y como 0<=a<x entonces 0<=a<x+1 es True}

{True ∧ 0<=x+1<=N ∧ True}

={neutro del ∧}

{0<=x+1<=N}

- Como la cota es T != 0 ya que la guarda asegura que x<N y de hipotesis 0<=x<=N
- entonces sabemos que 0<=x+1<=N se cumple 

Programa final:

{N>=0}
x:=0
{I}
do (x³+x < N) →
    {〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ (x³+x<N) ∧ T=N-x}
    x := x+1
    {〈∀a : 0<=a<x : a³+a<N 〉 ∧ 0<=x<=N ∧ T>N-x}
od
{x³+x>=N  ∧ 〈∀a : 0<=a<x : a³+a<N 〉}

```

#### B)


```haskell

Derivar un programa que calcule el mayor entero x que satisface x³+x≤N

{x³+x≤N}
S1;
{x³+x<=N ∧ 〈∀a : 0<=x<a : a³+a>N〉}

- Lo refinamos como (la composición secuencial) una inicialización y un ciclo.

{N>=0}
S0;
{I}
do B →
 S₁
od
{x³+x<=N ∧ 〈∀a : 0<=x<a : a³+a>N〉}

- Definir el invariante tal que P=>I

{N>=0}
S0;
{I : 〈∀a : 0<=x<a : a³+a>N〉 ∧ 0<=x<=N}

- Para esto necesito inicializar x, y lo derivo

{N>=0}
x := E
{I : 〈∀a : 0<=x<a : a³+a>N〉 ∧ 0<=x<=N}

={comprobacion de asignacion}

{N>=0}=>(x := E){I : 〈∀a : 0<=x<a : a³+a>N〉 ∧ 0<=x<=N}

{N>=0} => {I : 〈∀a : 0<=E<a : a³+a>N〉 ∧ 0<=E<=N}

={propongo E:=0}

{N>=0} => {I : 〈∀a : 0<=0<a : a³+a>N〉 ∧ 0<=0<=N}

{N>=0} => {I : 〈∀a : 0<a : a³+a>N〉 ∧ 0<=N}

={por hipotesis}

{I : 〈∀a : 0<a : a³+a>N〉 ∧ True}

- Como 0<=N todo a mayor a 0 implica que a³+a>N
- Por ende la propuesta es valida

    Esto desperdicio mucho tiempo de mi vida


```

## 2)

```haskell


```
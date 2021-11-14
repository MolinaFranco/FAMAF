## Ejercicio 1.

#### a)
  
```haskell
Var x,y : Num;
{}
x:=x+y
{x=6 ∧ y=5}

wp.(x:=x+y).{x=6 ∧ y=5} = {x?=6 ∧ y=5}(x:=x+y)

                        = {}

                        = {x+y=6 ∧ y=5}

                        ((leibniz))
                        
                        = {x=1 ∧ y=5}

```

#### b)

```haskell

Var x : Num;
{  }
x:= 8
{x= 8}

wp.(x:= 8).{x= 8}       = {x? = 8}(x:= 8)

                        ={comleto}

                        = {8 = 8}

                        ={logica}

                        = {True}

```



#### e)

```haskell

        Var x,y,a:Num;
P       {}
C1      a,x:=x,y;
R       {}
C2      y:=a
Q       {x=B∧y=A}

wp.(a,x:=x,y; y:=a;).{x=B∧y=A} = wp.c₁.(wp.c₂.Q)

= wp.(a,x:=x,y;).(wp.(y:=a).{x = B ∧ y? = A})

= wp.(a,x:=x,y;).{x? = B ∧ a? = A}

= {y=B ∧ x=A}

WP = {y=B ∧ x=A}

R = {x=B ∧ a=A}

```

#### f)

```haskell

        Var x,y : Num;
P       {  }
B1      if  x≥y → 
            {  }
C1          x:=0
            {  }
B2      []  x≤y → 
            {  }
C2          x:=2
            {  }
        fi
Q       {(x=0 ∨ x=2) ∧ y=1}

wp.(if (x≥y) → (x:=0) [] (x≤y) → (x:=2) fi).{(x=0 ∨ x=2) ∧ y=1}

= ((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ wp.(x:=0).{(x?=0 ∨ x?=2) ∧ y=1}) ∧ ((x≤y) ⇒ wp.(x:=2).{(x?=0 ∨ x?=2) ∧ y=1})

= ((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ {y=1}) ∧ ((x≤y) ⇒ {y=1})

= (True) ∧ ((x≥y) ⇒ {y=1}) ∧ ((x≤y) ⇒ {y=1})

= ((x≥y) ⇒ {y=1}) ∧ ((x≤y) ⇒ {y=1})

= (¬(x≥y) ∨ {y=1}) ∧ (¬(x≤y) ∨ {y=1})

= (¬(x≥y) ∧ ¬(x≤y)) ∨ ({y=1})

= (False) ∨ ({y=1})

= {y=1}



```

## Ejercicio 2.

#### a)
```haskell
{True}
if x≥1 → x:=x+1
[] x≤1 → x:=x−1
fi
{x != 1}

-- True implica wp? Veamos!

wp.(if..fi).(x!=1) 
= (x >= 1) => wp.(x:=x+1).(x!=1) ∧ (x <= 1) => wp.(x:=x-1).(x!=1)

                   = (x >= 1) => (x+1!=1) ∧ (x <= 1) => (x-1!=1)

                   = (x >= 1) => (x!=0) ∧ (x <= 1) => (x!=2)

                   = True ∧ True

                   = True

P implica la wp (True => True)

```


#### b)

```haskell
P       {x!=y}
B1      if (x>y) → skip
B2      [] (x<y) → x,y:=y,x
        fi
Q       {x > y}

-- (P => WP)????

wp.(if...fi).{x > y}

= ((x>y) ∨ (x<y)) ∧ ((x>y) ⇒ wp.(skip).{x > y}) ∧ ((x<y) ⇒ wp.(x,y:=y,x).{x > y})

= (x!=y) ∧ ((x>y) ⇒ {x>y}) ∧ ((x<y) ⇒ {y>x})

= (x!=y) ∧ (True) ∧ (¬(x<y) ∨ {y>x})

= (x!=y) ∧ (True)

= (x!=y)

P implica WP ({x!=y} => {x!=y})

```

#### e)

```haskell
P       {N≥0}
C1      x:= 0;
        {I}        
B       do (x!=N) → 
C2          x:=x+1
        od
Q       {x=N}


- 1) (¬B ∧ I) ⇒ Q	

- 2) { B ∧ I } S { I }	

Primero planteo una invariante que P=>I: 

I = (0<=x<=N) 

1)

(¬B ∧ I) ⇒ Q 

(¬(x!=N) ∧ (0<=x<=N)) => {x=N}
{doble negacion}
((x=N) ∧ (0<=x<=N)) => {x=N}
{debilitamiento}
True


{N≥0} => (0<=x<=N) 

2)

{ (x!=N) ∧ (0<=x<=N) } x:=x+1 {(0<=x<=N)}
≡  {Prop terna / wp}
{(x!=N) ∧ (0<=x<=N)} ⇒  wp.(x:=x+1).(0≤x≤N)
= {}
{(x!=N) ∧ (0<=x<=N)} ⇒ (0≤x+1≤N)
={logica}
(0<=x<N) ⇒ (0≤x+1≤N)
={distibutividad}
(0<=x ∧ x<N) ⇒ (0≤x+1 ∧ x+1≤N)
{logica (como x<N, si le sumo 1 puede ser <=)}
True

3)

t = N-x

(i) I ∧ b ⇒ t ≥ 0
(0<=x<=N) ∧ (x!=N) ⇒ (N-x ≥ 0)
(0<=x<N) ⇒ (N-x ≥ 0)
¬(0<=x<N) ∨ (N-x ≥ 0)
(0>x>=N) ∨ (N >= x)
True

(ii) { I ∧ b ∧ t = T } c { t < T }

{(0<=x<=N) ∧ (x!=N) ∧ (N-x) = T } 
x:=x+1;
{(N-x) < T}

={wp}

{(0<=x<=N) ∧ (x!=N) ∧ (N-x) = T } => wp.(x:=x+1){(N-x) < T}

{(0<=x<=N) ∧ (x!=N) ∧ (N-x) = T } => {(N-x+1) < T}

{(0<=x<N) ∧ (N-x)=T } => {(N-x-1) < T}

{(0<=x<N) ∧ (N-x)=T } => {(T-1) < T}

{(0<=x<N) ∧ (N-x)=T} => True

True josha

```

#### f)

```haskell
P       {True}
C1      r:=N;
B1      do (r!=0) →
                {}
B2              if r<0 → r:=r+1
B3              [] r>0 → r:=r−1
                fi
        od
Q       {r=0}


Planteo una invariante tal que 

I = { |r| <= N }

0. P ⇒ {C1}.I
        {True} => { |r| <= N }
        { |r| <= N }
        ={post ini. variables}
        { |r| <= r }
        True

1.  I ∧ ¬b ⇒ Q
        { |r| <= N } ∧ (r=0) ⇒ {r=0}
        ={debilitamiento del implica}
        True

2.  { I ∧ b } c { I }
        ({ |r| <= N } ∧ (r!=0)) c { |r| <= N }

Pre3 Verificar el if

{True}
if r<0 → r:=r+1
[] r>0 → r:=r−1
fi
{r=0}

1.  P ⇒ b₁ ∨ b₂
        True => r<0 ∨ r>0
        ={True=>a === a}
        r<0 ∨ r>0
        ={logica}
        r!=0
        ={por B}
        True

2.  { P ∧ b₁ } c₁ { Q} ∧ { P ∧ b₂ } c₂ { Q}
    {True} ∧ (r<0) r:=r+1 {r=0} ∧ {True} ∧ (r>0) r:=r−1 {r=0}
    ={wp en asignacion }
    {True} ∧ (r<0) => {r+1=0}   ∧   {True} ∧ (r>0) => {r−1=0}
    ={neutro del ∧}
    (r<0) => {r+1=0}   ∧   (r>0) => {r−1=0}
    ={}
    (r<0) => {r+1=0}   ∧   (r>0) => {r−1=0}


3. Cota
        t = |r|

	(i) I ∧ b ⇒ t ≥ 0

        { |r| <= N } ∧ (r!=0) ⇒ |r| ≥ 0
        ={logica}
        { |r| <= N } ∧ (r!=0) ⇒ True
        ={esto}
        True

	(ii) { I ∧ b ∧ t = K } c { t < K ∧ I }

        { |r| <= N ∧ r!=0 ∧ |r| = K}
        if r < 0 -> r := r + 1
        r > 0 -> r := r − 1
        fi
        { |r| <= N ∧ t < K}

        {Uso la obligacion de prueba del If}

1.      (|r|<=N ∧ r!=0 ∧ |r| =K) => r<0 V r>0
        ={r!=0}
        (|r|<=N ∧ r!=0 ∧ |r| =K) => True
        ={=> True}
        True
        
2.1     {(|r| <= N ∧ r!=0 ∧ |r| = K) ∧ r < 0} 
        r := r + 1
        { |r| <= N ∧ t < K}
        ={wp}
        (|r|<=N ∧ r!=0 ∧ |r| =K ∧ r<0)
        => |r+1|<=N ∧ |r+1|<K
        ={ hipotesis}
        True => |r+1|<=N ∧ |r+1|<K
        ={}
        |r+1|<= ∧ |r+1|<K


2.2     {(|r| <= N ∧ r!=0 ∧ |r| = K) ∧ r > 0}
        r := r − 1
        { |r| <= N ∧ t < K}
        ={wp}
        (|r|<=N ∧ r!=0 ∧ |r| =K ∧ r>0)
        => |r-1|<=N ∧ |r-1|<K
        ={ hipotesis}
        (|r|<=N ∧ r!=0 ∧ |r| =K ∧ r>0)
        => |r-1|<=N ∧ |r-1|<K
        Por hipotesis:
        |r| <= N por lo que |r-1|<=N es true
        |r| = K  por lo que |r-1|<K es true
        
        Por esto el cuerpo del bucle es valido y sabemos que el programa termina.

        El programa es valido.
```

## Ejercicio 3.

#### a)

```haskell
Var x,y:Nat;
{True}                  
x,y := x+1,E            
{y=x+ 1}

True => {y=x+ 1}(x,y:=x+ 1,E)
True => {y? = x? + 1}(x,y:=x+ 1,E)
True => {E = x + 1 + 1}
True => {E = x + 2}

E = x + 2

```

#### b)

```haskell

Var a,q,c,w : Num;
{q=a∗c∧w=c²}
a,q:=a+c,E
{q=a∗c}

{q=a∗c∧w=c²} => {q? = a?∗c}(a,q:=a+c,E)
{q=a∗c ∧ w=c²} => {E = a+c²}
{q=a∗c ∧ w=c²} => {E = a + w}
¬{q=a∗c ∧ w=c²} ∨ {E = a + w}
False ∨ {E = a + w}
{E = a + w}

```

#### c)

```haskell
Const A,B : Nat;
Var q,r : Nat;
{A=q∗B+r}
q:=E;r:=r−B
{A=q∗B+r}

P ⇒ Q(x→E)
{A=q∗B+r} => {A=q∗B+r}(q:=E;r:=r−B)
={asignacion}
{A= q∗B + r } => {A= E∗B + r − B}
={logica}
{A= q∗B} => {A= B*(E-1)}
E=q+1





```

## Ejercicio 4.

#### a)
  
```haskell

Var r,x,y : Num;
{True}
S1
{r = min (x, y)}

P=>Q
Hay casos en los q no.

Tenemos q reforzar 

{x<y ∨ x>y}
S1
{r = min (x, y)}

inicialiso r

{x<y ∨ x>y}
r:=R
{r = min (x, y)} 

se que el programa es valido si (x<y ∧ r=x) ∨ (x>y ∧ r=y) y se necesita 
por ende if B₁ → S₁, [] B₂ → S₂

{x<y ∨ x>y}
if x<y → r=x 
[] x>y → r=y 
fi
{r = min (x, y) ∧ (r=x ∨ r=y)} 

ahora habiendo remplazado en el condicial, nuestras guardas con las asignaciones
verificamos el programa

1.  P ⇒ b₁ ∨ b₂

{x<y ∨ x>y} ⇒ x<y ∨ x>y
={implicancia de lo mismo}
true

2.  { P ∧ b₁ } c₁ { Q}      y      { P ∧ b₂ } c₂ { Q}

({x<y ∨ x>y} ∧ x<y)  r=x {r = min (x, y) ∧ (r=x ∨ r=y)} 
={obligacion de pruba de la asignacion}
({x<y ∨ x>y} ∧ x<y)  => {x = min (x, y) ∧ (x=x ∨ x=y)} 
={logica}
(x<y)  => {x = min (x, y) ∧ (true ∨ x=y)}
={neutro del ∨ y del ∧} 
(x<y)  => {x = min (x, y)}
={si x es menos a y, implica que x sea el menor entre los dos}
True


({x<y ∨ x>y} ∧ x>y)  r=y {r = min (x, y) ∧ (r=x ∨ r=y)} 
={obligacion de pruba de la asignacion}
(x>y)  => {y = min (x, y) ∧ (x=y ∨ y=y)} 
={logica} 
(x>y)  => {y = min (x, y) ∧ (true ∨ y=y)} 
={neutro del ∨ y del ∧} 
(x>y)  => {y = min (x, y)} 
={si y es menos a x, implica que y sea el menor entre los dos}
True

```

## 5)

```haskell

a)      {P}
        if B0→S0
        [] B1→S1
        fi
        {Q}
b)
        {P}
        if B0→S0
        [] ¬B0→S1
        fi
        {Q}

```
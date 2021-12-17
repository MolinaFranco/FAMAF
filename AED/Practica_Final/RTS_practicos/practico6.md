## EJ1

Para cada uno de los siguientes programas, calcule la precondici ́on m ́as d ́ebil y las anotaciones intermedias.
Para ello utilice el transformador de predicados wp

```haskell
a) 

Var x, y : N um;
{ }
x := x + y
{x=6 ∧ y=5}

wp.(x:=x+y).{x=6 ∧ y=5} 
= {x+y=6 ∧ y=5}
= {x+5=6 ∧ y=5}
= {x=1 ∧ y=5}

e) 

Var x, y, a : N um;
{ }
a,x:=x,y;
{ }
y:=a
{x = B ∧y = A}

wp.(c₁ ; c₂).Q = wp.c₁.(wp.c₂.Q)

wp.(a,x:=x,y ; y:=a).{x = B ∧y = A} 
= wp.(a,x:=x,y).(wp.(y:=a).{x=B ∧ y=A})
= wp.(a,x:=x,y).{x=B ∧ a=A}
= {y=B ∧ a=A}

f) 
Var x, y : N um;
{y=1}
if (x≥y) →
    {y=1}
    x:=0
    { }
[]  (x≤y) →
    {y=1}
    x:=2
{ }
fi
{(x = 0 ∨x = 2) ∧y = 1}

wp.(if b₁ → c₁ []  b₂ → c₂ fi).Q =

(b₁ ∨ b₂) ∧ (b₁ ⇒ wp.c₁.Q) ∧ (b₂ ⇒ wp.c₂.Q)

wp.(if (x≥y) → x:=0 []  (x≤y) → x:=2 fi).{(x=0 ∨ x=2) ∧ y=1} =

=((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ wp.(x:=0).{(x?=0 ∨ x?=2) ∧ y=1}) 
∧ (x≤y ⇒ wp.(x:=2).{(x?=0 ∨ x=2) ∧ y=1})

=((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ ((0=0 ∨ 0=2) ∧ y=1)) ∧ (x≤y ⇒ {(2=0 ∨ 2=2) ∧ y=1})
{logica}
=((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ (True ∧ y=1)) ∧ (x≤y ⇒ {True ∧ y=1})
{neutro para el ∧}
=((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ {y=1}) ∧ (x≤y ⇒ {y=1})
{logica}
= ((x≥y) ⇒ {y=1}) ∧ (x≤y ⇒ {y=1})
{def del implica}
= (¬(x≥y) ∨ {y=1}) ∧ (¬(x≤y) ∨ {y=1})
{morgan}
= (¬(x≥y) ∧ ¬(x≤y)) ∨ {y=1}
{logica}
= True ∨ {y=1}
{neutro}
= {y=1}

```

## EJ2

Demuestre que las siguientes ternas de Hoare son correctas. 
En todos los casos las variables x, y son de tipo Int, y a, b de tipo Bool.

#### a)

```haskell

P   {True}
b1  if (x≥1) -> 
c1          x:= x+1
b2  [] (x≤1) -> 
c2          x:= x−1
    fi
Q   {x != 1}

1.  P ⇒ b₁ ∨ b₂

True => (x≥1) ∨ (x≤1)
{logica}
True => True
{logica}
True

2.  { P ∧ b₁ } c₁ { Q}      y      { P ∧ b₂ } c₂ { Q}

2.1 {{True} ∧ (x≥1)} (x:= x+1) {x != 1}

{{True} ∧ (x≥1)} => {x != 1}(x:= x+1)
{neutro del ∧ y pruba de asignacion}

2.2 { {True} ∧ (x≤1)} (x≤1) {x 6= 1}



P   {True}
b1  if (x≥1) -> 
c1          x:= x+1
b2  [] (x≤1) -> 
c2          x:= x−1
    fi
Q   {x != 1}

1.  P ⇒ b₁ ∨ b₂

True => (x≥1) ∨ (x≤1)
{logica}
True => True
{logica}
True

2.  { P ∧ b₁ } c₁ { Q}      y      { P ∧ b₂ } c₂ { Q}

2.1 {{True} ∧ (x≥1)} (x:= x+1) {x != 1}

{{True} ∧ (x≥1)} => {x? != 1}(x:= x+1)
{neutro del ∧ y pruba de asignacion}
(x≥1) => {x+1 != 1}
{algebra}
(x≥1) => {x!=0}
{logica}
True

2.2 { {True} ∧ (x≤1)} (x≤1){x:= x−1}

{ {True} ∧ (x≤1)}=> {x? != 1}(x:= x−1)
{neutro del ∧ y pruba de asignacion}
(x≤1) => {x−1 != 1}
{algebra}
(x≤1) => {x!=2}
{logica}
True

```

#### c)

```haskell

P   {True}
C1  x, y := y∗y, x∗x;
R   {  WP  }
B1  if (x≥y) ->
C2      x:=x−y
B2  [] (x≤y) ->
C3      y:=y−x
    fi
Q   {x ≥0 ∧y ≥0}

wp.(if b₁ → c₁ []  b₂ → c₂ fi).Q = (b₁ ∨ b₂) ∧ (b₁ ⇒ wp.c₁.Q) ∧ (b₂ ⇒ wp.c₂.Q)

=((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ wp.(x:=x−y).{x ≥0 ∧y ≥0}) ∧ ((x≤y) ⇒ wp.(y:=y−x).{x ≥0 ∧y ≥0})
{wp}
=((x≥y) ∨ (x≤y)) ∧ ((x≥y) ⇒ {x−y≥0 ∧ y≥0}) ∧ ((x≤y) ⇒ {x≥0 ∧ y−x≥0})
{algebra}
= True ∧ ((x≥y) ⇒ {x≥y ∧ y≥0}) ∧ ((x≤y) ⇒ {x≥0 ∧ y≥x})
{def de =>}
= True ∧ (¬(x≥y) ∨ {x≥y ∧ y≥0}) ∧ (¬(x≤y) ∨ {x≥0 ∧ y≥x})
{distri}
= True ∧ (True ∧ ¬(x≥y) ∨ y≥0}) ∧ ((¬(x≤y) ∨ x≥0) ∧ True)
{neutro}
= (¬(x≥y) ∨ y≥0) ∧ (¬(x≤y) ∨ x≥0) 
{def del ¬}
= {((x<=y) ∨ y≥0) ∧ ((x>=y) ∨ x≥0)}
{logica}
= {((x<=y) ∨ y≥0) ∧ ((x>=y) ∨ x≥0)}

ahora hacemos la prueba del condicional

{True} => {((x?<=y?) ∨ y?≥0) ∧ ((x?>=y?) ∨ x?≥0)}.(x, y := y∗y, x∗x;)  
{True} => {((y∗y<=x∗x) ∨ x∗x≥0) ∧ ((y∗y>=x∗x) ∨ y∗y≥0)}
{True} => {((y∗y<=x∗x) ∨ True) ∧ ((y∗y>=x∗x) ∨ True)}
{True} => {(True) ∧ (True)}
{True} => {True}
True

```

#### e) 


```haskell

{N≥0}           | P
x := 0;         | C1
{I}             | I
do (x!=N) ->    | B
    x := x+1    | C2
od              |
{x = N}         | Q

0. P ⇒ I
1.  I ∧ ¬b ⇒ Q
2.  { I ∧ b } c { I }
3. El ciclo termina: existe una función de cota t : Estados → Int tal que:
		 (i) I ∧ b ⇒ t ≥ 0
		(ii) { I ∧ b ∧ t = T } c { t < T }

Propongo invariante 

I = {0<=x<=N}

0. P ⇒ I
N≥0 => {0<=x<=N}
{def de =>}
¬(N≥0) ∨ {0<=x<=N}
{def ¬}
(N<=0) ∨ {0<=x<=N}
{logica}
True

1.  I ∧ ¬b ⇒ Q
{0<=x<=N} ∧ ¬(x!=N) => {x = N}
{doble negacion}
{0<=x<=N} ∧ (x=N) => {x = N}
{debilitamiento}
True

2.  { I ∧ b } c { I }

{{0<=x<=N} ∧ (x!=N)}(x := x+1){{0<=x<=N}}
{caso prueba asignacion}
{{0<=x<=N} ∧ (x!=N)}=>{0<=x<=N}.(x := x+1)
{asignacion}
{{0<=x<=N} ∧ (x!=N)}=>{0<=x+1<=N}
{logica}
{0<=x<N}=>{0<=x+1<=N}
{logica}
{0<=x<N}=>{0<=x<N}
{devilitamiento}
True

Planteo un t=(N-x)

(i) I∧b ⇒ t≥0 

{{0<=x<=N} ∧ (x!=N)} => (N-x) >= 0
{algebra y logica}
{0<=x<N} => {(N-x) >= 0}
{def de =>}
¬{0<=x<N} ∨ {(N-x)>=0}
{def de ¬}
{0>x>=N} ∨ (N-x)>=0
{logica}
{0>x ∧ x>=N} ∨ N>=x
{distributiva}
{(0>x ∨ N>=x) ∧ (x>=N ∨ N>=x)}
{logica}
{(0>x ∨ N>=x) ∧ True}
{invariante}

True
        
(ii) { I ∧ b ∧ t = T } c { t < T }

{{0<=x<=N} ∧ (x!=N) ∧ (N-x)=T} x := x+1 {(N-x)<T}
{caso de prueba de asignacion}
{{0<=x<=N} ∧ (x!=N) ∧ (N-x)=T} => {(N-x)<T}.(x:=x+1)
{logica y asignacion}
{{0<=x<N} ∧ (N-x)=T} => {(N-(x+1))<T}
{definicion de T}
{{0<=x<N} ∧ (N-x)=T} => {(T-1)<T}
{logica}
{{0<=x<N} ∧ (N-x)=T} => True
{regla del implica}
True

```

#### f) 

```haskell

{True}              | P             
r := N ;            | C1
do (r!=0) →         | B
    if (r<0) →      | B1
        r:=r+1      | C2
    [] (r>0) →      | B2
        r:=r−1      | C3
    fi
od
{r = 0}             | Q

Propongo un invariante

I = { |r|<=N }

comprobacion del ciclo

0. P ⇒ I
{True} => { |r| <= N}
{def de =>}
False ∨ { |r| <= N}
{nulo del ∨}
{ |r| <= N}
{post inicializacion de varibles}
{ |N| <= N}
{logica}
True

1.  I ∧ ¬b ⇒ Q
{ |r|<=N } ∧ ¬(r!=0) => {r = 0}
{doble negacion}
{ |r|<=N } ∧ (r=0) => {r=0}
{devilitamiento}
True

2.  { I ∧ b } c { I }

{{ |r|<=N } ∧ (r!=0)} c { |r|<=N }

para verificar esto uso los casos de prueba de la condicion

{{ |r|<=N } ∧ (r!=0)} 
if (r<0) →      
    r:=r+1      
[] (r>0) →      
    r:=r−1      
fi
{ |r|<=N }

2.1  P ⇒ b₁ ∨ b₂

{{ |r|<=N } ∧ (r!=0)} => (r<0) ∨ (r>0)
{logica}
{ |r|<=N } ∧ (r!=0) => (r!=0)
{devilitamiento}
True

2.2.1 { P ∧ b₁ } c₁ {Q}     

{{ |r|<=N } ∧ (r!=0) ∧ (r<0)} r:=r+1 { |r|<=N }
{uso el caso de prueba de la asignacion}
{{ |r|<=N } ∧ (r!=0) ∧ (r<0)} => { |r|<=N }(r:=r+1)
{asignacion}
{{ |r|<=N } ∧ (r!=0) ∧ (r<0)} => { |r+1|<=N }
{logica}
{{ |r|<=N } ∧ (r<0)} => { |r+1|<=N }
{sabemos que r<0 y que |r|<=N por lo que 
cualquier numero negativo que le sumes 1 se acerca mas al 0 por lo que su
valor absoluto disminuye. por ende  |r+1|<=N sigue siendo verdadero ya que 
|r+1| < |r| <= N}

2.2.2 { P ∧ b₂ } c₂ {Q}

{{ |r|<=N } ∧ (r!=0) ∧ (r>0)} r:=r+1 { |r|<=N }
{uso caso de prueba de la asignacion}
{{ |r|<=N } ∧ (r!=0) ∧ (r>0)} => { |r|<=N }(r:=r-1)
{asignacion}
{{ |r|<=N } ∧ (r!=0) ∧ (r>0)} => { |r-1|<=N }
{logica}
{{ |r|<=N } ∧ (r>0)} => { |r-1|<=N }
{como r>0 y |r|<=N, podemos hacegurar que |r-1|<=N ya que todo
numero positivo que se le resta 1 sera menor al valor origina
afirmando |r-1| < |r|<=N}
True

3. El ciclo termina: t = |r|
	(i) I ∧ b ⇒ t ≥ 0

    {{ |r|<=N } ∧ (r!=0)} => |r| >= 0
    {logica}
    {{ |r|<=N } ∧ (r!=0)} => True
    {regla del =>}
    True

    (ii) { I ∧ b ∧ t = T } c { t < T }
    {(|r|<=N)  ∧ (r!=0) ∧ (|r| = T)} 
    if (r<0) →      
        r:=r+1      
    [] (r>0) →      
        r:=r−1      
    fi 
    { |r| < T}

    Uso los casos de prueba del if

    3.1  P ⇒ b₁ ∨ b₂
    {(|r|<=N)  ∧ (r!=0) ∧ (|r| = T)} => (r<0) ∨ (r>0)
    {logica}
    {(|r|<=N)  ∧ (r!=0) ∧ (|r| = T)} => (r!=0)
    {devilitamiento}
    True
     
    3.2.1  { P ∧ b₁ } c₁ { Q}
    {(|r|<=N)  ∧ (r!=0) ∧ (|r| = T) ∧ (r<0)}r:=r+1{ |r| < T }
    {uso el caso de prueba de la asignacion}
    {(|r|<=N)  ∧ (r!=0) ∧ (|r| = T) ∧ (r<0)}=>{ |r| < T }(r:=r+1)
    {asignacion}
    {(|r|<=N)  ∧ (r!=0) ∧ (|r| = T) ∧ (r<0)}=>{ |r+1| < T }
    {logica}
    {(|r|<=N) ∧ (|r| = T) ∧ (r<0)}=>{ |r+1| < T }
    {definicion de T}
    {(|r|<=N) ∧ (|r| = T) ∧ (r<0)}=>{ |r+1| < |r| }
    {al ser r<0 esto implica que toda |r| a la que le sumes uno
    el resultado ser menor por lo que esto es verdadero}
    True

    El otro es exactamente igual

```

## EJ3

#### a) 

```haskell

Var x, y : N at;
{True}
x,y := x+1, E
{y = x+1}

{True}(x,y := x+1, E){y = x+1}
utilizo la obligacion de prueba de la asignacion
{True}=>{y = x+1}(x,y := x+1,E)
{asigno}
{True}=>{E = x+1+1}
{algebra}
{True}=>{E = x+2}
```


#### d) 

```haskell

Const N : Num;
Var x, y, p, q : Num;
{x∗y + p∗q = N}
x := x −p;
{  R  }
q := F
{x∗y + p∗q = N}

calculo la wp para R

= Q(x→E)

{R} = {x∗y + p∗q = N}(q := F)
{asigno}
{R} = {x∗y + p∗F = N}

Ahora caso de prueba de la terna
{x∗y + p∗q = N}
x := x −p;
{x∗y + p∗F = N}

{x∗y + p∗q = N}=>{x∗y + p∗F = N}(x := x −p;)
{asigno}
{x∗y + p∗q = N}=>{(x−p)∗y + p∗F = N}
{algebra}
{x∗y + p∗q = N}=>{x∗y − p∗y + p∗F = N}
{algebra}
{x∗y + p∗q = N}=>{x∗y + p∗(F-y) = N}
{para que la implicancia sea True}
{q=F-y
F=q+y}
{remplazo}
{x∗y + p∗q = N}=>{x∗y + p∗(q+y-y) = N}
{algebra}
{x∗y + p∗q = N}=>{x∗y + p∗q = N}
{devilitamiento}
True

```

## EJ4

Especifique los siguientes problemas, enunciando pre y postcondicion, y luego derive programas imperativos a partir de las especificaciones.

#### a)

Calcular el mınimo de dos valores.

```haskell

min.x.y = <Min i : i=x ∨ i=y : i>

P = {x!=y}
S1
Q = {r=min.(x,y)}

Es evidente que necesitamos un condicional para determinar el mayor y el menos
y inicializo r

P = {x!=y}
if (b) ->
    C1
[] (b2) ->
    C2
Q = {r=min.(x,y)}

para encontrar las b utilizo el caso de prueba del condicional

{x!=y} ⇒ b₁ ∨ b₂
{logica y tricotomia}
{x!=y} ⇒ x<y ∨ x>y
{aritmetica}
True

de aca sacamos que b1=x<y y b2=x>y

y usamos la segunda obligacion de prueba para calcular c1 y c2

{ x!=y ∧ x<y } c₁ { r = min.(x,y) } 
{planteo una asignacion momentanea}
{ x!=y ∧ x<y } r=M { r = min.(x,y) } 
{logica}
{ x<y } r=M { r = min.(x,y) } 
{ si x<y, el resultado de min.(x,y) es x}
{ x<y } r=M { r = x }
para que esta comprobacion sea True M tiene que ser x
{ x<y } r=x { r = x }
{caso de prueba de asignacion}
{ x<y } =>{ r = x }(r=x)
{asigno}
{ x<y } =>{ x == x }
{logica}
{ x<y } =>{ True }
{regla del implica}
True

El otro lado es el mismo procedimiento


```

#### b)

Calcular el valor absoluto de un numero.

```haskell
abs.x = <Max i : i=x ∨ i=-x : i>

P = {True}
S1
Q = {r == abs.x}

Para empezar a derivar necesitamos una inicializacion de la variable
ademas necesitamos un condicional para determinar si x es positivo o no 

P = {True}
r = R
if (b) ->
    C1
[] (b2) ->
    C2
Q = {r == abs.x}

para derivar el condicional utilizaremos la obligacion de prueba

1.  P ⇒ b₁ ∨ b₂

Como nuestro P es True plantea remos un b y b2
{True}=>(x>=0)∨(x<0)
{por ticotomia}
{True}=>True
{devilitamiento}
True

Planteo lo obtenido y muevo la inicializacion al condicional

P = {True}
if (x>=0) ->
    r = M
[] (x<0) ->
    r = M2
Q = {r == abs.x}

uso el condicional 2 para calcular las asignaciones

2.
({ True ∧ x>=0 } r = M { r == abs.x }) ∧ ({ True ∧ x<0 } r = M2 { r == abs.x })
{neutro del ∧}
({ x>=0 } r = M { r == abs.x }) ∧ ({ x<0 } r = M2 { r == abs.x })
{si x>=0 el abs.x es x y si x<0 el abs.x es -x}
({ x>=0 } r = M { r == x }) ∧ ({ x<0 } r = M2 { r == -x })
{obligacion de prueba de la asignacion}
({ x>=0 } => { r == x }(r = M)) ∧ ({ x<0 } => { r == -x }(r = M2))
{asigno}
({ x>=0 } => { M == x }) ∧ ({ x<0 } => { M2 == -x })
{ llegamos a el valor de que necesitamos M y M2 para que esto sea True}

Resultado

P = {True}
if (x>=0) ->
    r = x
[] (x<0) ->
    r = -x
Q = {r == abs.x}

```

## EJ5

```haskell

Demuestre que si la terna de Hoare (a) es correcta, entonces la terna (b) tambi ́en lo es:1
a) 
{P}
if B0 →S0
[] B1 →S1
fi
{Q}

b) 
{P}
if  B0 →S0
[] ¬B0 →S1
fi
{Q}

sabemos por las obligaciones de prueba

1.  P1 => B0 ∨  B1
2.  P2 => B0 ∨ ¬B0

1. { P ∧ B0 } S0 { Q } 
1. { P ∧ B1 } S1 { Q }

2. { P ∧  B0 } S0 { Q } 
2. { P ∧ ¬B0 } S1 { Q }

(P => B0 ∨ B1) => (P => B0 ∨ ¬B0)
{def de implica}
¬(¬P ∨ B0 ∨ B1) ∨ (¬P ∨ B0 ∨ ¬B0)
{morgan y logica}
(¬¬P ∧ ¬B0 ∧ ¬B1) ∨ (¬P ∨ True)
{abvsorvente}
(¬¬P ∧ ¬B0 ∧ ¬B1) ∨ True
{abvsorvente}
True

{ P ∧ B0 } S0 { Q } => { P ∧  B0 } S0 { Q }
{devilitamiento}
True

{ P ∧ B1 } S1 { Q } => { P ∧ ¬B0 } S1 { Q }
{para comprobar esto necesito asegurar lo siguiente}
{ P ∧ B1 } => { P ∧ ¬B0 }
{y a esto le agregamos la otra HI}
(P ∧ ¬B0) ∧ (P ⇒ B0 ∨ B1)  => (P ∧ B1)
{def de =>}
¬((P ∧ ¬B0) ∧ (¬P ∨ B0 ∨ B1)) ∨ (P ∧ B1)
{logica}
¬(P ∧ ¬B0) ∨ ¬(¬P ∨ B0 ∨ B1)) ∨ (P ∧ B1)
{morgan}
¬P ∨ ¬¬B0 ∨ (¬¬P ∧ ¬B0 ∧ ¬B1) ∨ (P ∧ B1)
{doble negaacion}
¬P ∨ B0 ∨ (P ∧ ¬B0 ∧ ¬B1) ∨ (P ∧ B1)
{distributiva}
B0 ∨ (P ∧ ¬B0 ∧ ¬B1) ∨ ((¬P ∨ P) ∧ (¬P ∨ B1))
{logiac}
B0 ∨ (P ∧ ¬B0 ∧ ¬B1) ∨ ¬P ∨ B1
{distributiva}
((B0 ∨ ¬B0 ∨ ¬P) ∧ (B0 ∨ ¬B1 ∨ ¬P)) ∨ B1
{logica}
((True ∨ ¬P) ∧ (B0 ∨ ¬B1 ∨ ¬P)) ∨ B1
{distri y logica}
B0 ∨ True ∨ ¬P
{absorvente}
True

TODO COMPROBADO LOCOOOOO

```

## EJ6

Analice los siguientes programas anotados. En cada caso, describa en lenguaje natural la postcondicion, y decida si el programa efectivamente valida las anotaciones.

#### a) 

```haskell

Const N : Int, A : array[0,N) of Num;
Var s : Num, i : Int;
{N ≥ 0}
i, s := 0, 0 ;
do i != N →
    s := s + A.i
od
{s = 〈∑k : 0 ≤k < N : A.k 〉}


{s = 〈∑k : 0≤k<N : A.k 〉}

las postcondicion valua si el valor de s es igual al de la suma de todos los numeros del array A

EL PROGRAMA ESTA MAAAAL
lo que hace es sumar indefinidamente el valor de la posicion A.0

El resto lo hago mentalmente

```

## EJ 9

Derive un programa para calcular el maximo comun divisor entre dos enteros positivos. Utilice la siguiente
especificacion:

```haskell

Const X, Y : Int;
Var x, y : Int;
{X>0 ∧ Y>0 ∧ x=X ∧ y=Y}
S
{x = mcd.X.Y}


Utilice como invariante {I : x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }.

Para la derivacion seran de utilidad las siguientes propiedades del mcd:

a) mcd.x.x = x
b) mcd.x.y = mcd.y.x
c) x > y ⇒ mcd.x.y = mcd.(x −y).y
d ) y > x ⇒ mcd.x.y = mcd.x.(y −x)

Comenzamos la derivacion con la terna y planteamos un bucle

{X>0 ∧ Y>0 ∧ x=X ∧ y=Y}
{I}
do B -> 
    C1 
od
{x = mcd.X.Y}

1. encontrar el invariante

{I : x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }
{ x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }

2. inicializacion

P=>I
{X>0 ∧ Y>0 ∧ x=X ∧ y=Y} => {x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }
{utilizando P como hipotesis, confirmo lo de la izquierda}
{X>0 ∧ Y>0 ∧ x=X ∧ y=Y} => {True ∧ True ∧ mcd.x.y=mcd.X.Y }
{def de x e y}
{X>0 ∧ Y>0 ∧ x=X ∧ y=Y} => {True ∧ True ∧ mcd.X.Y=mcd.X.Y }
{logica}
{X>0 ∧ Y>0 ∧ x=X ∧ y=Y} => {True ∧ True ∧ True }
{regla del implica}
True

3. Finalizacion

como no tengo cota propongo una a base de lo siguiente

I ∧ ¬B ⇒ Q

{ x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y } ∧ ¬B => {x = mcd.x.y}
{def de mcd.X.Y}
{ x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y  } ∧ ¬B => {x = mcd.x.y}
{por regla de mcd para que mcd.x.y = x, x tiene que ser x=y asi que} 

planteo cota por reglas del mcd

¬B = (x=y)
 B = (x!=y) 

planteamos lo q tenemos


{X>0 ∧ Y>0 ∧ x=X ∧ y=Y}
{I : x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }
do (x!=y) -> 
    C1 
od
{x = mcd.X.Y}

4. encontramos cota candidata

I ∧ B ⇒ t ≥ 0

{ x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ (x!=y)} => t ≥ 0
{plateo cota que al ser 0 cierre el ciclo}
{ x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ (x!=y)} =>  (x max y) - (x min y) ≥ 0
{ logica } 
{ x>y>0 ∨ y>x>0 ∧ mcd.x.y=mcd.X.Y} => (x max y) - (x min y) ≥ 0
{sabiendo por hipotesis que lo dos son positivos y diferentes
    por logica un numero mas grande positivo al que se le resta
    un numero mas chico siempre va a ser mayor a 0}
{ x>y>0 ∨ y>x>0 ∧ mcd.x.y=mcd.X.Y} => True


5.Cuerpo del ciclo

por las reglas del mcd sabemos que necesitamos un condicional que determine si x o y es mas grande
ademas necesitamos una inicializacion de variables en cada situacion

{X>0 ∧ Y>0 ∧ x=X ∧ y=Y}
{I : x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }
do (x!=y) -> 
    if b₁ -> 
        x,y = E,Z 
    [] b₂ -> 
        x,y = E2,Z2 
    fi 
od
{x = mcd.X.Y}

derivamos las incognitas con la obligacion de prueba del condicional y del invariante

{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y}
if b₁ -> 
        x,y = E,Z 
    [] b₂ -> 
        x,y = E2,Z2 
fi
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }

1.  P ⇒ b₁ ∨ b₂

{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y} => b1 ∨ b2 
por las reglas del mcd para cuando x!=y 
c) x > y ⇒ mcd.x.y = mcd.(x −y).y
d ) y > x ⇒ mcd.x.y = mcd.x.(y −x)
podemos plantear b1 = x>y y b2= y>x
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y} => x>y ∨ y>x 
{como x!=y, por logica}
{(x>y>0 ∨ y>x>0) ∧ mcd.x.y=mcd.X.Y} => x>y ∨ y>x
{logica} 
{(x>y ∨ y>x) ∧ x>0 ∧ y>0  ∧ mcd.x.y=mcd.X.Y} => x>y ∨ y>x
{deviliatmiento}
True

{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y}
if x>y -> 
    x,y = E,Z 
[] y>x -> 
    x,y = E2,Z2 
fi
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }

2. { P ∧ b₁ } c₁ { Q } 

{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y ∧ x>y }
x,y = E,Z
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }
{oblgacion de prueba de la asignacion}
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y ∧ x>y}
=>
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }(x,y = E,Z)
{asignacion y logica}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{E>0 ∧ Z>0 ∧ mcd.E.Z=mcd.X.Y }
{def de mcd.X.Y}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{E>0 ∧ Z>0 ∧ mcd.E.Z=mcd.x.y}
{como x>y usamos la prop c) en el mcd}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{E>0 ∧ Z>0 ∧ mcd.E.Z=mcd.(x−y).y}
{de aca sacamos la definicion de E y de Z tal que}
 mcd.E.Z=mcd.(x−y).y
 E = (x−y)
 Z = y
{sigo la comprobacion}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{(x − y)>0 ∧ y>0 ∧ True}
{logica}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{True ∧ True ∧ True}
{logica}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{True}
True

3. { P ∧ b2 } c₁ { Q } 

{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y ∧ x<y }
x,y = E,Z
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }
{oblgacion de prueba de la asignacion}
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y ∧ x<y}
=>
{x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y }(x,y = E,Z)
{asignacion y logica}
{mcd.x.y=mcd.X.Y ∧ y>x>0}=>{E>0 ∧ Z>0 ∧ mcd.E.Z=mcd.X.Y }
{def de mcd.X.Y}
{mcd.x.y=mcd.X.Y ∧ y>x>0}=>{E>0 ∧ Z>0 ∧ mcd.E.Z=mcd.x.y}
{como x>y usamos la prop c) en el mcd}
{mcd.x.y=mcd.X.Y ∧ y>x>0}=>{E>0 ∧ Z>0 ∧ mcd.E.Z=mcd.(x−y).y}
{de aca sacamos la definicion de E y de Z tal que}
 mcd.E.Z=mcd.x.(y−x)
 E = x
 Z = (y−x)
{sigo la comprobacion}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{(y−x)>0 ∧ x>0 ∧ True}
{logica}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{True ∧ True ∧ True}
{logica}
{mcd.x.y=mcd.X.Y ∧ x>y>0}=>{True}
True

PLANTEO TODO LO OBTENIDO

{X>0 ∧ Y>0 ∧ x=X ∧ y=Y}
{I: x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y}
do (x!=y) -> 
    {I: x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x!=y }
    if x>y -> 
        x,y = (x−y),y 
    [] y>x -> 
        x,y = x,(y-x) 
    fi
    {I: x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y}
od
{I: x>0 ∧ y>0 ∧ mcd.x.y=mcd.X.Y ∧ x=y}
{x = mcd.X.Y}

}

```



## final no se cual

```haskell

Dado un arreglo A de N numeros enteros, se quiere obtener el
producto de todos los 
elementos que sean mayores al producto de sus antecesores.

<Πi : 0<=i<#N ∧ (xs!!i > <Πj : 0<=j<#i : xs!!j>) : xs!!i>

```
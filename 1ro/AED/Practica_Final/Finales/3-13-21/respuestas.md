## EJ1

#### a) 

Derivar una definicion recursiva para la funcion especificada por:

```haskell

hocho.xs = <∀as,bs : xs=as++bs : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 >

CB: hocho.[]
    {def}
    <∀as,bs : []=as++bs : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 >
    {prop de listas}
    <∀as,bs : []=as++bs ∧ as=[] ∧ bs=[] : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 >
    {leibniz y eliminacion de variable}
    <∀bs : []=bs : (<∑i : 0≤i<#[] : ([]!!i)^2> <= 88)  >
    {def de #}
    <∀bs : []=bs : (<∑i : 0≤i<0 : ([]!!i)^2> <= 88)  >
    {logica}
    <∀bs : []=bs : (<∑i : False : ([]!!i)^2> <= 88)  >
    {rango vacio}
    <∀bs : []=bs : (0 <= 88)  >
    {logica}
    <∀bs : []=bs : True  >
    {rango unitario}
    True

HI: hocho.xs = <∀as,bs : xs=as++bs : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 >

para facilitar el caso inductivo, 
voy a modularizar el la espesificacion anidada
tal que:

sumcuad.xs = <∑i : 0≤i<#xs : (xs!!i)^2>

CB: sumcuad.[]
    {esp}
    <∑i : 0≤i<#[] : ([]!!i)^2>
    {defde #}
    <∑i : 0≤i<0 : ([]!!i)^2>
    {logica}
    <∑i : False : ([]!!i)^2>
    {rango vacio}
    0

HI: sumcuad.xs = <∑i : 0≤i<#xs : (xs!!i)^2>

CI: sumcuad.(x:xs)
    {esp}
    <∑i : 0≤i<#(x:xs) : ((x:xs)!!i)^2>
    {def de #}
    <∑i : 0≤i<#xs+1 : ((x:xs)!!i)^2>
    {logica}
    <∑i : i=0 ∧ 0<i<#xs+1 : ((x:xs)!!i)^2>
    {particion de rango}
    <∑i : i=0 : ((x:xs)!!i)^2> + <∑i : 0<i<#xs+1 : ((x:xs)!!i)^2>
    {rango unitario y algebra}
    ((x:xs)!!0)^2 + <∑i : 0<=i-1<#xs : ((x:xs)!!i)^2>
    {def de !! y cambio de variable (j=i-1)}
    x^2 + <∑j : 0<=j<#xs : ((x:xs)!!j+1)^2>
    {def recur de !!}
    x^2 + <∑j : 0<=j<#xs : ((xs)!!j)^2>
    {HI}
    x^2 + sumcuad.xs
    {necesitamos la def de ^ }

    segun nuestro conocimientos la potenciacion no es un programa por lo
    que derivo el siguiente enunciado 
    
    cuad.x = x^2

    CB: cuad.0
        {esp}
        0^2
        {algebra}
        0

    HI: cuad.x = x^2
    
    CI: cuad.(x+1)
        {esp}
        (x+1)^2
        {algebra}
        x^2 + 2x + 1
        {HI}
        cuad.x + 2x + 1

    cuad :: Num -> Num
    cuad.0 := 0
    cuad.(x+1) := cuad.x + 2x + 1

    {termino la derivacion con el nuevo programa planteado}
    x^2 + sumcuad.xs
    {modularizacion}
    cuad.x + sumcuad.xs

Con esto termino la modularizacion con este resultado

sumcuad.xs = <∑i : 0≤i<#xs : (xs!!i)^2>

sunmcuad :: [Num] -> Num
sumcuad.[] := 0
sumcuad.(x:xs) := cuad.x + sumcuad.xs

con esto continuo la derivacion principal

HI: hocho.xs = <∀as,bs : xs=as++bs : sumcuad.bs <= 88 >

CI: hocho.(x:xs)
    {esp}
    <∀as,bs : (x:xs)=as++bs : sumcuad.bs <= 88 >
    {regla de listas}
    <∀as,bs : [x]++xs=as++bs : sumcuad.bs <= 88 >
    {tercero excluido}
    <∀a,as,bs : [x]++xs=as++bs ∧ (as=[] ∨ as=(a:as)) : sumcuad.bs <= 88 >
    {distributividad}
    <∀a,as,bs : ([x]++xs=as++bs ∧ as=[]) ∨ ([x]++xs=as++bs ∧ as=(a:as)) : sumcuad.bs <= 88 >
    {particion de rango}
    <∀a,as,bs : ([x]++xs=as++bs ∧ as=[]) : sumcuad.bs <= 88 > ∧ <∀as,bs : ([x]++xs=as++bs ∧ as=(a:as)) : sumcuad.bs <= 88 >
    {leibnis y eliminacion de variable}
    <∀bs : [x]++xs=[]++bs : sumcuad.bs <= 88 > ∧ <∀a,as,bs : [x]++xs=(a:as)++bs : sumcuad.bs <= 88 >
    {regla de listas }
    <∀bs : x:xs=bs : sumcuad.bs <= 88 > ∧ <∀a,as,bs : [x]++xs=[a]++as++bs : sumcuad.bs <= 88 >
    {rango unitario u logica}
    (sumcuad.x:xs <= 88) ∧ <∀a,as,bs : x=a ∧ xs=++as++bs : sumcuad.bs <= 88 >
    {elimacion de variable}
    (sumcuad.x:xs <= 88) ∧ <∀as,bs : xs=as++bs : sumcuad.bs <= 88 >
    {HI}
    (sumcuad.x:xs <= 88) ∧ hocho.xs
    {def de sumcuad}
    ((cuad.x + sumcuad.xs) <= 88) ∧ hocho.xs

Resulado

hocho :: [Num] -> Bool
hocho.[] := True
hocho.(x:xs) := ((cuad.x + sumcuad.xs) <= 88) ∧ hocho.xs


```

#### b) 

Calcular f.[−1, 8, −2, 5] usando la especificacion.

```haskell

hocho.xs = <∀as,bs : xs=as++bs : sumcuad.bs <= 88 >

hocho.[−1, 8, −2, 5] = <∀as,bs : [−1, 8, −2, 5]=as++bs : sumcuad.bs <= 88 >

diferentes posibilidades de partir [−1, 8, −2, 5]

as ++ bs

−1, 8, −2, 5 | []
−1, 8, −2 | 5
−1, 8 | −2, 5
−1 | 8, −2, 5
[] | −1, 8, −2, 5

voy planteando las distintas posibilidades posibilidades y voy laburando de a una
al der un para todo, todas tienen que dar True o con una sola que de False


<∀as,bs : as=[−1, 8, −2] ∧ bs=[5] : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 > ∧ 
<∀as,bs : as=[−1, 8] ∧ bs=[−2, 5] : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 > ∧ 
<∀as,bs : as=[−1] ∧ bs=[8, −2, 5] : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 > ∧ 
<∀as,bs : as=[] ∧ bs=[−1, 8, −2, 5] : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 > 

laburo cada caso por separado

<∀as,bs : as=[] ∧ bs=[−1, 8, −2, 5] : <∑i : 0≤i<#bs : (bs!!i)^2> <= 88 > 
{rango unitario y def de #}
<∑i : 0≤i<#4 : ([−1, 8, −2, 5]!!i)^2> <= 88 
{calcular el conjunto}
(1 + 64 + 4 + 25) <= 88 
{algebra}
96 <= 88 
{logica}
False

Como uno de los para todos resuelve False entonces el para todo se niega y resulado es Falso








```


#### c) 

Calcular f.[−1, 8, −2, 5] usando la definicion obtenida en el punto a

```haskell

hocho :: [Num] -> Bool
hocho.[] := True
hocho.(x:xs) := ((cuad.x + sumcuad.xs) <= 88) ∧ hocho.xs


hocho.[−1, 8, −2, 5]
{def}
((cuad.(-1) + sumcuad.[8, −2, 5]) <= 88) ∧ hocho.[8, −2, 5]
{resuelvo}
(1 + 64 + 4 + 25) <= 88) ∧ hocho.[8, −2, 5]
{algebra}
(96 <= 88) ∧ hocho.[8, −2, 5]
{logica}
False ∧ hocho.[8, −2, 5]
{absorvente del ∧}
False


```

## EJ2

Considera el problema especificado de la siguiente manera:

```haskell
Const N : Int;
Var A : array [0, N) of Int;
r : Bool;
{N ≥0}
S
{r = 〈∃i : 0≤i≤N : 〈∑j : 0≤j<i : A.j 〉= −1 〉}
```
#### a) 
Calcula el resultado para A = [3, −1, −1, −1] usando la especificacion. Justifica, enumerando todos los elementos del rango del existencial.

```haskell
N es la cantidad de elemento de A por lo que:
r = 〈∃i : 0≤i≤4 : 〈∑j : 0 ≤j<i : A.j 〉= −1 
{enumerando todos los elementos}
r = <∃i : i e [0,1,2,3,4] : <∑j : 0 ≤j<i : [3, −1, −1, −1].j 〉= −1 > >
{pruebo con cada caso de i el rango unitario}
r = <∑j : 0 ≤j<0 : [3, −1, −1, −1].j 〉= −1 >
  ∨ <∑j : 0 ≤j<1 : [3, −1, −1, −1].j 〉= −1 >
  ∨ <∑j : 0 ≤j<2 : [3, −1, −1, −1].j 〉= −1 >
  ∨ <∑j : 0 ≤j<3 : [3, −1, −1, −1].j 〉= −1 >
  ∨ <∑j : 0 ≤j<4 : [3, −1, −1, −1].j 〉= −1 >

{calculo las sumatorias}

r = 
    (0 == −1 )
  ∨ (3 == −1 )
  ∨ ((3 + −1) == −1 )
  ∨ ((3 + (−1) + (−1)) = −1) 
  ∨ ((3 + (−1) + (−1) + (−1)) = −1)

{sumo y calculo}

r = False ∨ False ∨ False ∨ False ∨ False 
r = False

```

#### b) 
Explica con tus palabras que debe calcular este programa.

este programa calculo si la suma de los elementos de algun prefijo posible, es igual a (-1)

#### c)
Deriva un programa imperativo que resuelva este problema. El programa debe recorrer una
sola vez el arreglo (sin ciclos anidados). Ayuda: Hay problema de borde.

```haskell
Const N : Int;
Var A : array [0, N) of Int;
r : Bool;
{N ≥0}
S
{r = 〈∃i : 0≤i≤N : 〈∑j : 0≤j<i : A.j 〉= −1 〉}

propongo una inicializacion y un ciclo de esta forma

{N ≥0}
S1
do (B) ->
    S2;
od
{r =〈∃i : 0≤i≤N : 〈∑j : 0≤j<i : A.j 〉= −1 〉}

para encontrar el invariante utilizo remplazo de constante por vaiable 
{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n<=N}

y esto nos indica que la guarda sera 
B = (n!=N)

con esto aseguramos que I ∧ ¬B => I

con esto sabemos que n ira creciendo hastya ser igual a N por lo que podemos plantear la cota
de esta manera

t = N-n

con todo esto empezamos a derivar el cuerpo del ciclo con la siguiente terna

{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n<=N ∧ n!=N ∧ N-n=T}
S1
{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n<=N ∧ N-n<T}

para comenzar planteamos una inicializacion de nuestras variables y ademas sabemos que n tendra que ir creciendo

{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n<=N ∧ n!=N ∧ N-n=T}
r,n := E,n+1
{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n<=N ∧ N-n<T}

utilizo wp de la asignacion, tomo lo primero como hipotesis y laburo hasta obtener E

wp.{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n<=N ∧ N-n<T}(r,n := E,n+1)
{wp}
{I: E =〈∃i : 0≤i≤n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n+1<=N ∧ N-(n+1)<T}
{por HI def de T y logica}
{I: E =〈∃i : 0≤i≤n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∧ 0<=n+1<=N}
{por HI (0<=n<=N ∧ n!=N) => 0<=n<N por lo que n+1 puede ser N }
{I: E =〈∃i : 0≤i≤n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉}
{logica}
{I: E =〈∃i : 0≤i≤n ∨ i=n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉}
{particion de rango}
{I: E =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉 ∨ 〈∃i : i=n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉}
{HI}
{I: E = r ∨ 〈∃i : i=n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉}


{rango unitario y cuando se rompa el ciclo}
{I: E = r ∨〈∑j : 0≤j<=N : A.j 〉= −1 }
ESTE ES EL PROBLEMA DE BORDE QUE NO VIMOS

TENIAMOS QUE SEGUIR LABURANDO CON ESTO PARA EVITARLO
{I: E = r ∨〈∑j : 0≤j<=n : A.j 〉= −1 }
{separo}
{I: E = r ∨〈∑j : 0≤j<n : A.j 〉 + 〈∑j : j=n : A.j 〉= −1 }
{ranog unitario}
{I: E = r ∨〈∑j : 0≤j<n : A.j〉+ A.n = −1 }


{no podemos hacer nada aca asi que refuerzo el invariante creando una nueva variable}

planteo la nueva terna con la nueva invariante

{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉∧ k =〈∑j : 0≤j<n : A.j 〉 ∧ 0<=n<=N ∧ n!=N ∧ N-n=T ∧ } 
r,k,n := E,F,n+1
{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉∧ k =〈∑j : 0≤j<n : A.j 〉 ∧ 0<=n<=N ∧ N-n<T }

utilizo wp de la asignacion, tomo lo primero como hipotesis y laburo hasta obtener E

wp.{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉∧ k =〈∑j : 0≤j<n : A.j 〉 ∧ 0<=n<=N ∧ N-n<T }(r,k,n := E,F,n+1)
{wp}
wp.{I: E =〈∃i : 0≤i≤n+1 : 〈∑j : 0≤j<i : A.j 〉= −1 〉∧ F =〈∑j : 0≤j<n : A.j 〉 ∧ 0<=n+1<=N ∧ N-n+1<T }(r,k,n := E,F,n+1)

laburare a base de lo que ya hicimos con el resultado de E por un lado y F por otro

{E = r ∨〈∑j : 0≤j<n : A.j 〉+ A.n = −1 }\
{por def de k en HI}
{E = r ∨ (k + A.n == −1) }\
{conseguimos la def de E}

ahora laburare con el lado de F

{F =〈∃i : i=(n+1)+1 : 〈∑j : 0≤j<i : A.j 〉}
{algebra}
{F =〈∃i : i=n+2 : 〈∑j : 0≤j<i : A.j 〉}
{rango unitario}
{F =〈∑j : 0≤j<=n+1 : A.j 〉}
{particion de rango}
{F =〈∑j : 0≤j<n+1 : A.j 〉+ 〈∑j : j=n+1 : A.j 〉}
{por HI y rango unitario}
{F = k + A.(n+1)}
{resultado de F}

termine de derivar el cuerpo del ciclo
con esto tambien comprobe que la cota decrece

planteo el programa obtenido 

{N ≥0}
S1
{I: r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j 〉= −1 〉∧ k =〈∃i : i=n+1 : 〈∑j : 0≤j<i : A.j 〉}
do (n!=N) ->
    {I ∧ 0<=n<=N ∧ n!=N ∧ N-n=T ∧ } 
    r,k,n := (r ∨ (k + A.n == −1)),(k + A.(n+1)),n+1
    {I ∧ 0<=n<=N ∧ N-n<T }
od
{r =〈∃i : 0≤i≤N : 〈∑j : 0≤j<i : A.j 〉= −1 〉}

repare el codigo la segunda vez que lo hize mirar mas abajo

{N ≥ 0}
r,n,k= False,0,0
{I': r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉}
do(b)->
    {I ∧ b ∧ t=T}
    r,n,k=(r ∨ (A.n + k = −1 )),n+1,(A.n + k)
    {I ∧ t<T}
od;
{r = 〈∃i : 0≤i≤N : 〈∑j : 0 ≤j<i : A.j〉= −1 〉}


```

#### lauti me propone

```haskell

f.xs = <Σ i,j: 0<=i<=j<#xs: (xs.i)*(xs.j)>

<Σ i,j: 0<=i<=j<1+#xs: ((x:xs).i)*((x:xs).j)>

<Σ i,j: 0<=i<=j<=#xs: ((x:xs).i)*((x:xs).j)>
{logica}
<Σ i,j: (0=i ∧ 0<=j<=#xs) ∨ 1<=i<=j<=#xs: ((x:xs).i)*((x:xs).j)>
{particion de rango }
<Σ i,j: (0=i ∧ 0<=j<=#xs) : ((x:xs).i)*((x:xs).j)> + <Σ i,j: 1<=i<=j<=#xs: ((x:xs).i)*((x:xs).j)>
{elim de variable y def de !}
<Σ j: (0<=j<1+#xs) : (x*((x:xs).j))> + <Σ i,j: 1<=i<=j<1+#xs: ((x:xs).i)*((x:xs).j)>
{inecuacion y cambio de vaiable k=j-1 s=i-1}
<Σ j: (0<=j<1+#xs) : (x*((x:xs).j))> + <Σ s,k: 0<=s<=k<#xs: ((x:xs).k+1)*((x:xs).s+1)>
{def de !}
<Σ j: (0<=j<1+#xs) : (x*((x:xs).j))> + <Σ s,k: 0<=s<=k<#xs: ((xs).k)*((xs).s)>
{HI}
<Σ j: (0<=j<=#xs) : (x*((x:xs).j))> + f.xs
{particion de rango}
<Σ j: (0=j) : (x*((x:xs).j))> + <Σ j: (1<=j<=#xs) : (x*((x:xs).j))> + f.xs
{rango unitario y logica}
(x*x) + <Σ j: (0<=j-1<#xs) : (x*((x:xs).j))> + f.xs
{cambio de variable k=j-1}
(x*x) + <Σ j: (0<=k<#xs) : (h*((xs).k))> + f.xs

MODULARIZO

HI aux.xs.h = <Σ j: (0<=k<#xs) : (h*((xs).k))>

CB: aux.[].h
    {def}
    <Σ j: (0<=k<#[]) : (h*(([]).k))>
    {def de # y logica}
    <Σ j: False : (h*(([]).k))>
    {rango vacio}
    0

CI: aux.(x:xs).h
    {def}
    <Σ j: (0<=k<#x:xs) : (h*((x:xs).k))>
    {particion de rango}
    <Σ j: 0=k : (h*((x:xs).k))> + <Σ j: (0<k<#x:xs) : (h*((x:xs).k))>
    {rango unitario, def de # y algebra}
    (h*((x:xs).0)) + <Σ j: (0<=l<#xs) : (h*((x:xs).l+1))>
    {def de . y cambio de variable l=k-1}
    (h*(x) + <Σ j: (0<=l<#xs) : (h*((xs).l))>
    {HI}
    (h*x) + aux.xs.h

RESULTADO
aux.xs.h = <Σ j: (0<=k<#xs) : (h*((xs).k))>
aux.[].h = 0
aux.(x:xs).h = (h*x) + aux.xs.h

continuo con la derivacion

(x*x) + <Σ j: (0<=k<#xs) : (h*((xs).k))> + f.xs
{def de aux}
(x*x) + aux.xs.x + f.xs

RESULTADO DE ALGO NO SE DE DONDE SAQUE ESTO


```

## EJ3

Especificar con pre y post condicion los siguientes problemas. 
Declarar constantes y variables. No
derivar

#### a)

Dado un arreglo A de N ≥ 0 elementos,
calcular si todos los elementos del arreglo son exponentes de 2

```haskell
Const N : Int;
Var A : Array [0,N) of Int
Var r : Bool
Var x,y,n : Int

{0<=N}
S0;

do (B)
    -- aca recorro todos los  elementos del array 
    do(B2)
    -- aca recorro todos los numero entre 0 y el elemento del array
    -- buscando si se cumple en algun elemnto: A!!x = 2^y
    od
od

con esto se que voy a necesitar dos variables x (que rrecorra A) e y que vaya comprobando el enunciado'

ademas vamos a necesitar un n para hacer cambio de constante por variable

{r = <∀i : 0<=i<=N : <∃j : 0<=j<=A!!i : A!!i = 2^j>>}

el igual estaba mal

{r = < ∀i : 0<=i<N : <∃j: 0<=j<=A!!i : 2^j=A!!i> >}

r va a ser una variable inicializada en true y el porgrama sera un ciclo anidado donde al pasar por 

```

#### b)

```haskell

Dado un arreglo A de N > 0 elementos, calcular si la suma de algun segmento 
es mayor que el maximo elemento del arreglo. 
Ejemplo: Con A = [6, −8, 7, −5, 10] la respuesta es afirmativa,
ya que el segmento [7, −5, 10] suma 12 que es mayor que el maximo elemento 10.

Var A : Array [0,N) of Int
Const N : int;
Var x : int
Var r : Bool

{P: 0<N}
S1;
{Q:r = <∀a : 0<=a<=N : A!a<A!x> ∧ 0<x<=N ∧ <E js,is,zs : A = is++js++zs> : <Σb : 0<=b<#js : js!b> > A!x  }

{r = <E as,bs,cs : A=as++bs++cs : <Σi:0<=i<=#bs:bs!!i> > <Max j:0<=j<N:bs!!j> >}
```

## Re practica para segundo final y arreglando las cosas viejas

## EJ1.2

#### a) Derivar una definicion recursiva para la funcion especificada por:

hocho.xs = 〈 ∀as, bs : xs = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉

```haskell

para hacer esta drivacion haremos el caso base y luego el caso inductivo tomando la especificacion como hipotesis

CB: hocho.[]=
    {esp}
    〈 ∀as, bs : [] = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉
    {logica de la concat.}
    〈 ∀as, bs : as=[] bs=[] : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉
    {rango uniario}
    (〈∑i : 0≤i<#[] : ([]!i)^2〉 ≤ 88)
    {caso base de #}
    (〈∑i : 0≤i<0 : ([]!i)^2〉 ≤ 88)
    {algebra}
    (〈∑i : False : ([]!i)^2〉 ≤ 88)
    {rango vasio}
    (0 ≤ 88)
    {algebra}
    True

HI: hocho.xs = 〈 ∀as, bs : xs = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉

CI: hocho.(x:xs) 
    {esp}
    = 〈 ∀as, bs : (x:xs) = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉
    {tercer excluido}
    = 〈 ∀as, bs : (x:xs) = as++bs (as!=[] ∨ as=[]) : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉
    {particion de rango, cambio de variable as=>a:as y logica y eliminacion de varibaele}
    = 〈 ∀ a,as,bs : (x=a) ∧ xs = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉 ∧ 〈 ∀ bs : (x:xs) = bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉
    {eliminacion de variable y rango unitario}
    = 〈 ∀as, bs : xs = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉 ∧ (〈∑i : 0≤i<#(x:xs) : ((x:xs)!i)^2〉 ≤ 88 )
    {HI y logica}
    = hocho.xs ∧ (〈∑i : 0≤i<=#(xs) : ((x:xs)!i)^2〉 ≤ 88 )
    {logica}
    = hocho.xs ∧ (〈∑i : 0≤i<#(xs) : ((x:xs)!i)^2〉 + 〈∑i : i=#(xs) : ((x:xs)!i)^2〉 ≤ 88 )
    {rango unitario} 
    = hocho.xs ∧ (〈∑i : 0≤i<#(xs) : ((x:xs)!i)^2〉 + 〈∑i : i=#(xs) : ((x:xs)!#(xs))^2〉 ≤ 88 )

sos un boludo franco no te olvides de modularizar

HI: hocho.xs = 〈 ∀as, bs : xs = as++bs : 〈∑i : 0≤i<#bs : (bs!i)^2〉 ≤88 〉

para facilitar esto vamos a modularizar sumcuad.xs

sumcuad.xs = 〈∑i : 0≤i<#xs : (bs!i)^2〉

CB: sumcuad.[] 
    {esp}
    = 〈∑i : 0≤i<#[] : (bs!i)^2〉
    {caso base de #}
    = 〈∑i : 0≤i<0 : (bs!i)^2〉
    {logica}
    = 〈∑i : False : (bs!i)^2〉
    {rango vacio}
    0

sumcuad.[] = 0
HI: sumcuad.xs = 〈∑i : 0≤i<#xs : (xs!i)^2〉

CI: sumcuad.(x:xs) 
    {esp}
    = 〈∑i : 0≤i<#(x:xs) : ((x:xs)!i)^2〉
    {logica}
    = 〈∑i : 0=i ∨ 0<i<#(xs)+1 : ((x:xs)!i)^2〉
    {particion de rango y algebra}
    = 〈∑i : 0=i : (xs!i)^2〉 + 〈∑i : 0<=i-1<#(xs) : ((x:xs)!i)^2〉
    {rango unitario y cambio de variable i-1=j}
    = ((x:xs)!0)^2 + 〈∑j : 0<=j<#(xs) : ((x:xs)!j+1)^2〉
    {logica de !!}
    = (x^2) + 〈∑j : 0<=j<#(xs) : ((xs)!j)^2〉
    {HI}
    = (x^2) + sumcuad.xs

sumcuad.[] = 0  
sumcuad.(x:xs) = (x^2) + sumcuad.xs

con esto empiezo a derivar la HI de ocho

HI: hocho.xs = 〈 ∀as, bs : xs = as++bs : sumcuad.bs ≤88 〉

CI: hocho.(x:xs)
    {esp}
    = 〈 ∀as, bs : (x:xs) = as++bs : sumcuad.bs ≤ 88 〉
    {tercero excluido}
    = 〈 ∀as, bs : (x:xs) = as++bs ∧ (as=[] ∨ as!=[]) : sumcuad.bs ≤ 88 〉
    {parrticion de rango, cambio de varibale as=>a:as y eliminaciond e varibale}
    = 〈 ∀ bs : (x:xs) = bs : sumcuad.bs ≤ 88 〉 ∧ 〈 ∀a,as,bs : (x:xs) = a:as++bs : sumcuad.bs ≤ 88 〉
    {rango unitario y logica}
    = (sumcuad.(x:xs) ≤ 88) ∧ 〈 ∀a,as,bs : x=a ∧ xs = as++bs : sumcuad.bs ≤ 88 〉
    {eliminacion de variable}
    = (sumcuad.(x:xs) ≤ 88) ∧ 〈 ∀as, bs : xs = as++bs : sumcuad.bs ≤ 88 〉
    {HI}
    = (sumcuad.(x:xs) ≤ 88) ∧ hocho.xs

resultado

sumcuad.[] = 0  
sumcuad.(x:xs) = (x^2) + sumcuad.xs
hocho.[] = True
hocho.(x:xs) = (sumcuad.(x:xs) ≤ 88) ∧ hocho.xs

```

#### b) Calcular f.[−1, 8, −2, 5] usando la especificacion.

#### c) Calcular f.[−1, 8, −2, 5] usando la definicion obtenida en el punto a.

## EJ2.2 

Considera el problema especificado de la siguiente manera:

```haskell
Const N : Int;
Var A : array [0, N) of Int;
r : Bool;
{N ≥0}
S
{r = 〈∃i : 0 ≤i ≤N : 〈∑j : 0 ≤j < i : A.j 〉= −1 〉}
``` 

#### a) 
Calcula el resultado para A = [3, −1, −1, −1] usando la especificacion. Justifica, enume-
rando todos los elementos del rango del existencial.
```haskell

{r = 〈∃i : 0≤i≤4 : 〈∑j : 0 ≤j<i : A.j 〉= −1 〉}
calculamos todo el rango del existencial
〈∑j : 0 ≤j<0 : A.j 〉= −1 〉 ∨
〈∑j : 0 ≤j<1 : A.j 〉= −1 〉 ∨
〈∑j : 0 ≤j<2 : A.j 〉= −1 〉 ∨
〈∑j : 0 ≤j<3 : A.j 〉= −1 〉 ∨
〈∑j : 0 ≤j<4 : A.j 〉= −1 〉 ∨

calculamos la sumatoria

    0 = −1 ∨
    3 = −1 ∨
    2 = −1 ∨
    1 = −1 ∨
    0 = −1 ∨

calculamos y el resultado es False

```

#### c) 
Deriva un programa imperativo que resuelva este problema. 
El programa debe recorrer una sola vez el arreglo (sin ciclos anidados). 
Ayuda: Hay problema de borde.

```haskell
para empezar el programa sabemos que necesitaremos un ciclo para recorrer el arreglo por lo que planteamos el ciclo con una inicializacion y lo necesario para derivar el programa

Const N : Int;
Var A : array [0, N) of Int;
r : Bool;
{N ≥0}
S0;
{I}
do(b)->
    {I ∧ b ∧ t=T}
    S1;
    {I ∧ t<T}
od;
{r = 〈∃i : 0≤i≤N : 〈∑j : 0 ≤j<i : A.j〉= −1 〉}

viendo Q podemos hacer cambio de constante por variable para poder sacar nuestro invariante
ademas al darnos cuenta que n ira creciendo hasta llegar a N podemos determinar nuesta cota y guarda

{I: r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N }
b = (n<N)
t = (N-n)

con esto planteo una asignacion a nuestras vaiables en SI

{r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ n<N ∧ N-n=T}
r,n=E,n+1
{r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧  N-n>T}

tomo P como HI y laburo en la WP de la asignacion

WP.{r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧  N-n>T}(r,n=E,n+1)
{asigno}
E =〈∃i : 0≤i≤n+1 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n+1<=N ∧  N-n+1>T}
{def de T en HI y algebra y si por HI 0<=n<N entonces por logica y logica}
E =〈∃i : 0≤i<n+1 ∨ i=n+1 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ True ∧ True}
{particion de rango, algebra }
E =〈∃i : 0≤i<=n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉 ∨ 〈∃i : i=n+1 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉 
{HI y rango unitario}
E = r ∨ (〈∑j : 0≤j<n+1 : A.j〉= −1 ) 
{logica, y particion de rango}
E = r ∨ (〈∑j : n=j : A.j〉+ 〈∑j : 0≤j<n : A.j〉= −1 ) 
{rango unitario y algebra}
E = r ∨ (A.n + 〈∑j : 0≤j<n : A.j〉= −1 ) 

ahora en este punto necesitamos fortalecer la invariante

{I': r =〈∃i : 0≤i≤n : 〈∑j : 0≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉}

volvemos a plantear la terna

{r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉∧ n<N ∧ N-n=T}
r,n,k=E,n+1,F
{r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉∧  N-n>T}

planteo la wp tomando la primera como HI

WP.{r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉∧  N-n>T}(r,n,k=E,n+1,F)
{asigno}
{E =〈∃i : 0≤i≤n+1 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n+1<=N ∧ F =〈∑j : 0≤j<n+1 : A.j〉∧  N-n+1>T}
{avanzo todo lo laburado en la parte vieja}
E = r ∨ (A.n + 〈∑j : 0≤j<n : A.j〉= −1 ) ∧ F =〈∑j : 0≤j<n+1 : A.j〉
{por HI}
E = r ∨ (A.n + k = −1 ) ∧ F =〈∑j : 0≤j<n+1 : A.j〉
para laburar mas comodo sigo laburando con F aparte

F =〈∑j : 0≤j<n+1 : A.j〉
{logica y particion de rango}
F =〈∑j : j=n : A.j〉+ 〈∑j : 0≤j<n : A.j〉
{rango unitario y HI}
F = A.n + k

planteo lo que sabemos hasta ahora


Const N : Int;
Var A : array [0, N) of Int;
r : Bool;
{N ≥ 0}
S0;
{I': r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉}
do(b)->
    {I ∧ b ∧ t=T}
    r,n,k=(r ∨ (A.n + k = −1 )),n+1,(A.n + k)
    {I ∧ t<T}
od;
{r = 〈∃i : 0≤i≤N : 〈∑j : 0 ≤j<i : A.j〉= −1 〉}

solo nos falta derivar la inicializacion, lo hacemos con la siguien terna donde planteamos la asignacion de n en su minimo 

{N ≥ 0}
r,n,k=E',0,F'
{I': r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉}

tomamo la primera como HI y laburamos en la wp de la asignacion

WP.{I': r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉}(r,n,k=E',0,F')
{asigno}
WP.{I': E' =〈∃i : 0≤i≤0 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=0<=N ∧ F' =〈∑j : 0≤j<0 : A.j〉}
{HI 0<=N}
WP.{I': E' =〈∃i : 0≤i≤0 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ True ∧ F' =〈∑j : 0≤j<0 : A.j〉}

para mayor comodidad trabajaremos primero con E' y luego con F'

E' =〈∃i : 0≤i≤0 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉
{algebra}
E' =〈∃i : i=0 : 〈∑j : 0 ≤j<i : A.j〉= −1 〉
{rango unitario}
E' =〈∑j : 0≤j<0 : A.j〉= −1 
{logica}
E' =〈∑j : False : A.j〉= −1 
{rango vacio}
E' = (0 = −1) 
{algebra}
E' = False 

F' =〈∑j : 0≤j<0 : A.j〉
{logica}
F' =〈∑j : False : A.j〉
{rango vacio}
F' = 0 

Const N : Int;
Var A : array [0, N) of Int;
r : Bool;
{N ≥ 0}
r,n,k= False,0,0
{I': r =〈∃i : 0≤i≤n : 〈∑j : 0 ≤j<i : A.j〉= −1 〉∧ 0<=n<=N ∧ k =〈∑j : 0≤j<n : A.j〉}
do(b)->
    {I ∧ b ∧ t=T}
    r,n,k=(r ∨ (A.n + k = −1 )),n+1,(A.n + k)
    {I ∧ t<T}
od;
{r = 〈∃i : 0≤i≤N : 〈∑j : 0 ≤j<i : A.j〉= −1 〉}


```

## EJ3.2 

Especificar con pre y post condicion los siguientes problemas. Declarar constantes y variables. No
derivar.

#### a) 

Dado un arreglo A de N ≥ 0 elementos, calcular si todos los elementos del arreglo son expo-
nentes de 2.
```haskell

Const N:Int;
Const A: array [0,N);
Var r: bool;

{N ≥ 0}
S1;
{r = < ∀i : 0<=i<N : <∃j: 0<=j<=A!!i : 2^j=A!!i> >}

``` 

#### b) 
Dado un arreglo A de N > 0 elementos, calcular si la suma de algun segmento es mayor que el
maximo elemento del arreglo. Ejemplo: Con A = [6, −8, 7, −5, 10] la respuesta es afirmativa,
ya que el segmento [7, −5, 10] suma 12 que es mayor que el maximo elemento 10.

```haskell

Const N:Int;
Const A: array [0,N);
Var r: bool;

{N > 0}
S1;
{r = <E as,bs,cs : A=as++bs++cs : <Σi:0<=i<=#bs:bs!!i> > <Max j:0<=j<N:bs!!j> >}

```
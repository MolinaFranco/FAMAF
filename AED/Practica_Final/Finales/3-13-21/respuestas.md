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

Calcular f.[−1, 8, −2, 5] usando la definici ́on obtenida en el punto a

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

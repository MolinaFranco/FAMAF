## EJ 1

expresar en lenguaje natural que devuelven las funciones, 
agregarlessu tipo y derivarlas

#### a)

```haskell
psum.xs = <∀i: 0≤i≤#xs:sum.(xs↑i)>=0>

devuelve un booleano que determina 
si la suma de los elementos de cualquier prefijo son mayor/igual 0

psum :: [Num] -> Bool

CB: psum.[] 
    <∀i: 0≤i≤#[]:sum.([]↑i)>=0>
    {caso base de #}
    <∀i: 0≤i≤0:sum.([]↑i)>=0>
    {logica}
    <∀i: i=0 :sum.([]↑i)>=0>
    {rango unitario}
    sum.([]↑0)>=0
    {caso base de ↑}
    sum.([])>=0
    {caso base de sum}
    0>=0
    {algebra}
    True

HI: psum.xs = <∀i: 0≤i≤#xs:sum.(xs↑i)>=0>

CI: psum.x:xs 
    {esp}
    <∀i: 0≤i≤#x:xs:sum.(x:xs↑i)>=0>
    {logica}
    <∀i: 0=i ∨ 0<i≤#xs+1:sum.(x:xs↑i)>=0>
    {particion de rango y algebra}
    <∀i: 0=i :sum.(x:xs↑i)>=0> ∧ <∀i: 0<=i-1≤#xs:sum.(x:xs↑i)>=0>
    {rango unitario y cambio de variable}
    sum.(x:xs↑0)>=0 ∧ <∀j: 0<=j≤#xs:sum.(x:xs↑j+1)>=0>
    {def de ↑}
    sum.([])>=0 ∧ <∀j: 0<=j≤#xs:sum.x:(xs↑j)>=0>
    {def de sum y logica}
    True ∧ <∀j : 0<=j≤#xs : x + sum.(xs↑j) >= 0>

{generalizo h}

GENERALIZACION

psumGen.h.xs = <∀i : 0<=i≤#xs : h + sum.(xs↑i) >= 0>

CB: psumGen.h.[]
    {esp}
    <∀i : 0<=i≤#[] : h + sum.([]↑i) >= 0>
    {caso base de #}
    <∀i : 0<=i≤0 : h + sum.([]↑i) >= 0>
    {logica}
    <∀i : i=0 : h + sum.([]↑i) >= 0>
    {rango unitario}
    h + sum.([]↑0) >= 0
    {caso base de ↑ y de sum}
    h + 0 >= 0
    {algebra}
    h >= 0

HI_G: psumGen.h.xs = <∀i : 0<=i≤#xs : h + sum.(xs↑i) >= 0>

CI: psumGen.h.x:xs 
    {esp}
    <∀i : 0<=i≤#x:xs : h + sum.(x:xs↑i) >= 0>
    {logica}
    <∀i: 0=i ∨ 0<i≤#xs+1: h +sum.(x:xs↑i)>=0>
    {particion de rango y algebra}
    <∀i: 0=i : h + sum.(x:xs↑i)>=0> ∧ <∀i: 0<=i-1≤#xs: h + sum.(x:xs↑i)>=0>
    {rango unitario y cambio de variable}
    h + sum.(x:xs↑0)>=0 ∧ <∀j: 0<=j≤#xs: h + sum.(x:xs↑j+1)>=0>
    {def de ↑}
    h + sum.([])>=0 ∧ <∀j: 0<=j≤#xs: h + sum.x:(xs↑j)>=0>
    {def de sum y logica}
    h>=0 ∧ <∀j : 0<=j≤#xs : (h+x) + sum.(xs↑j) >= 0>
    {HI_G}
    h>=0 ∧ psumGen.(h+x).xs

Resultado
psumGen.h.[] = (h>=0)
psumGen.h.x:xs = h>=0 ∧ psumGen.(h+x).xs

psum es un caso de psumGen con h = 0

```

#### b)

```haskell

sumant.xs = <∃i : 0≤i<#xs : xs!i=sum.(xs↑i)>

Determina si existe un elemento con el valor de la suma de todo su prefijo

sumant :: [Num] -> Bool

CB: sumant.[]
    {esp} 
    <∃i : 0≤i<#[] : []!i=sum.(xs↑i)>
    {def de #}
    <∃i : 0≤i<0 : []!i=sum.(xs↑i)>
    {logica}
    <∃i : False : []!i=sum.(xs↑i)>
    {rango vacio}
    False

HI: sumant.xs = <∃i : 0≤i<#xs : xs!i=sum.(xs↑i)>

CI: sumant.x:xs 
    {esp}
    <∃i : 0≤i<#x:xs : x:xs!i=sum.(x:xs↑i)>
    {separo y CI de #}
    <∃i : 0=i ∨ 0<i<#xs+1 : x:xs!i=sum.(x:xs↑i)>
    {particiond e rango}
    <∃i : 0=i : x:xs!i=sum.(x:xs↑i)> ∨ <∃i : 0<i<#xs+1 : x:xs!i=sum.(x:xs↑i)>
    {rango unitario y algebra}
    x:xs!0==sum.(x:xs↑0) ∨ <∃i : 0<=i-1<#xs : x:xs!i=sum.(x:xs↑i)>
    {def de ! y ↑ y cambio de variable}
    x==sum.[] ∨ <∃j : 0<=j<#xs : x:xs!j+1=sum.(x:xs↑j+1)>
    {CB de sum y def de ! y ↑}
    x==0 ∨ <∃j : 0<=j<#xs : xs!j=sum.x:(xs↑j)>
    {def de sum}
    x==0 ∨ <∃j : 0<=j<#xs : xs!j==x+sum.(xs↑j)>
    {necesito generalizar}
    x==0 ∨ <∃j : 0<=j<#xs : xs!j== x+n +sum.(xs↑j)>

Generalizo:

sumantGen.n.xs = <∃i : 0≤i<#xs : xs!i=n+sum.(xs↑i)>

CB: sumantGen.n.[]
    {esp} 
    <∃i : 0≤i<#[] : []!i=n+sum.(xs↑i)>
    {def de #}
    <∃i : 0≤i<0 : []!i=n+sum.(xs↑i)>
    {logica}
    <∃i : False : []!i=n+sum.(xs↑i)>
    {rango vacio}
    False

HIG: sumantGen.n.xs = <∃i : 0≤i<#xs : xs!i=n+sum.(xs↑i)>

CI: sumantGen.x:xs 
    {esp}
    <∃i : 0≤i<#x:xs : x:xs!i=n+sum.(x:xs↑i)>
    {separo y CI de #}
    <∃i : 0=i ∨ 0<i<#xs+1 : x:xs!i=n+sum.(x:xs↑i)>
    {particiond e rango}
    <∃i : 0=i : x:xs!i=n+sum.(x:xs↑i)> ∨ <∃i : 0<i<#xs+1 : x:xs!i=n+sum.(x:xs↑i)>
    {rango unitario y algebra}
    x:xs!0==n+sum.(x:xs↑0) ∨ <∃i : 0<=i-1<#xs : x:xs!i=n+sum.(x:xs↑i)>
    {def de ! y ↑ y cambio de variable}
    x==n+sum.[] ∨ <∃j : 0<=j<#xs : x:xs!j+1=n+sum.(x:xs↑j+1)>
    {CB de sum y def de ! y ↑}
    x==n ∨ <∃j : 0<=j<#xs : xs!j=n+sum.x:(xs↑j)>
    {def de sum}
    x==n ∨ <∃j : 0<=j<#xs : xs!j==(x+n)+sum.(xs↑j)>
    {HIG}
    x==n ∨ sumantGen.(x+n).xs

sumant es un caso particular de suimantGen donde n=0
RESULTADO
sumantGen :: Num -> [Num] -> Bool
sumantGen.n.[] := False
sumantGen.x:xs := x==n ∨ sumantGen.(x+n).xs

```

## EJ 2

Especificar formalmente utilizando cuantificadores cada una de las siguientes funciones descriptas informalmente.Luego,derivar soluciones algorıtmicas para cada una.

#### a) 

dado un natural determina si es el cuadrado de un numero


```haskell

esCuad :: Nat -> Bool
esCuad.x = <Ea : 0<=a<=x : x=a*a >

CB: esCuad.0 
    {esp}
    <Ea : 0<=a<=0 : 0=a*a>
    {logica}
    <Ea : a=0 : 0=a*a>
    {rango unitario}
    0=0*0
    {logica}
    True

HI: esCuad.x = <Ea : 0<=a<=x : x=a*a >

CI: esCuad.(x+1)
    {esp}
    <Ei : 0<=i<=(n+1) : (n+1)=i*i>
    {rango de una variable}
    <Ei : 0<=i<=n ∨ i=n+1 : (n+1)=i*i>
    {particion de rango}
    <Ei : i=n+1 : (n+1)=i*i> ∨ <Ei : 0<=i<=n : (n+1)=i*i>
    {rangoo unitario}
    n+1 = (n+1)*(n+1) ∨ <Ei : 0<=i<=n : n+1 = i*i >
    {generalizar}

HIG: esCuadGen.x.n = <Ea : 0<=a<=x : x+n=a*a >

CB: esCuadGen.0.n 
    {esp}
    <Ea : 0<=a<=0 : 0+n==a*a>
    {logica}
    <Ea : a=0 : 0+n==a*a>
    {rango unitario}
    0+n==0*0
    {logica}
    n==0

CI: esCuadGen.(x+1).n
    {esp}
    <Ea : 0<=a<=(x+1) : (x+1)+n=a*a>
    {rango de una variable}
    <Ea : 0<=a<=n ∨ a=n+1 : (x+1)+n=a*a>
    {particion de rango}
    <Ea : a=n+1 : (x+1)+n=a*a> ∨ <Ea : 0<=a<=n : (x+1)+n=a*a>
    {rangoo unitario}
    x+1+n = (x+1)*(x+1) ∨ <Ea : 0<=a<=n : x+(1+n) = a*a >
    {HI}
    (x+1)+n = (x+1)*(x+1) ∨ esCuadGen.x.(n+1)

RESPUESTA
esCuadGen.0.n := n==0
esCuadGen.(x+1).n := (x+1)+n = (x+1)*(x+1) ∨ esCuadGen.x.(n+1)

esCuad es un caso especifico de esCuadGen con n=0

```

#### b)

dada una lista cuenta la cantidad de prefijos que suman 8.

```haskell

sumanOcho :: [Num] -> Nat
sumanOcho.xs = <Ni : 0<=i<#xs : <Σj : 0<=j<i : xs!!j> == 8 >
sumanOcho.xs = <Ni : 0<=i<#xs : sum(xs↑i) == 8 >

CB: sumanOcho.[]
    {esp}
    <Ni : 0<=i<#[] : sum([]↑i) == 8 >
    {def de #}
    <Ni : 0<=i<0 : sum([]↑i) == 8 >
    {logica}
    <Ni : False : sum([]↑i) == 8 >
    {rango vacio}
    0

HI: sumanOcho.xs = <Ni : 0<=i<=#xs : sum(xs↑i) == 8 >

Ci: sumanOcho.x:xs
    {def}
    <Ni : 0<=i<=#x:xs : sum(x:xs↑i) == 8 >
    {def de # y de ↑}
    <Ni : 0<=i<=#xs+1 : sum(x:xs↑i) == 8 >
    {logica}
    <Ni : 0=i ∨ 0<i<=#xs+1 : sum(x:xs↑i) == 8 >
    {algebra y particion de rango}
    <Ni : 0=i : sum(x:xs↑i) == 8 > + <Ni : 0<=i-1<=#xs : sum(x:xs↑i) == 8 >
    {cambio de variable}
    <Ni : 0=i : sum(x:xs↑i) == 8 > + <Ni : 0<=j<=#xs : sum(x:xs↑j+1) == 8 >
    {def de ↑}
    <Ni : 0=i : sum(x:xs↑i) == 8 > + <Ni : 0<=j<=#xs : sum (x:(xs↑j)) == 8 >
    {def de sum}
    <Ni : 0=i : sum(x:xs↑i) == 8 > + <Ni : 0<=j<=#xs : x + sum (xs↑j) == 8 >
    {algebra}
    <Ni : 0=i : sum(x:xs↑i) == 8 > + <Ni : 0<=j<=#xs : sum (xs↑j) == 8-x>
    {generalizo por que necesito una variable}
    

CB: sumanGen.h.[]
    {def}
    <Ni : 0<=i<=#[] : sum([]↑i) == h >
    {def de #}
    <Ni : 0<=i<0 : sum([]↑i) == h >
    {logica}
    <Ni : False : sum([]↑i) == h >
    {rango vacio}
    0

HI: sumanGen.h.xs = <Ni : 0<=i<=#xs : sum(xs↑i) == h >

Ci: sumanGen.h.x:xs
    {def}
    <Ni : 0<=i<=#x:xs : sum(x:xs↑i) == h >
    {def de # y de ↑}
    <Ni : 0<=i<=#xs+1 : sum(x:xs↑i) == h >
    {logica}
    <Ni : 0=i ∨ 0<i<=#xs+1 : sum(x:xs↑i) == h >
    {algebra y particion de rango}
    <Ni : 0=i : sum(x:xs↑i) == h > + <Ni : 0<=i-1<=#xs : sum(x:xs↑i) == h >
    {cambio de variable}
    <Ni : 0=i : sum(x:xs↑i) == h > + <Ni : 0<=j<=#xs : sum(x:xs↑j+1) == h >
    {def de ↑}
    <Ni : 0=i : sum(x:xs↑i) == h > + <Ni : 0<=j<=#xs : sum (x:(xs↑j)) == h >
    {def de sum}
    <Ni : 0=i : sum(x:xs↑i) == h > + <Ni : 0<=j<=#xs : x + sum (xs↑j) == h >
    {algebra}
    <Ni : 0=i : sum(x:xs↑i) == h > + <Ni : 0<=j<=#xs : sum (xs↑j) == h-x>
    {HI}
    <Ni : 0=i : sum(x:xs↑i) == h > + sumanGen.(h-x).xs
    {rango unitario}
    (sum(x:xs↑0) == h)->1[](¬sum(x:xs↑0) == h)->0 + sumanGen.(h-x).xs
    {def de ↑ y sum}
    ((0 == h)->1[](¬(0 == h))->0) + sumanGen.(h-x).xs
    {distributiva}
    ((0 == h)->1 + sumanGen.(h-x).xs [](¬(0 == h))-> sumanGen.(h-x).xs)

RESULTADO
sumanGen.h.[] := 0
sumanGen.h.xs :=    (   (0 == h) -> 1 + sumanGen.(h-x).xs
                        []  (¬(0 == h)) -> sumanGen.(h-x).xs 
                        )

```

## Ej3

 Expresar en lenguaje natural cada una de las siguientes expresiones; 
 para ello primero calcular los rangos, ya sea como conjunto de tuplas o una tabla, 
 y evaluar las expresiones para xs= [9,−5,1,−3] e ys= [9,−5,3].
 
 ```haskell
 a)〈∀as,bs : xs=as++bs : sum.as≥0〉

    La suma de los valores de cualquier prefijo de xs es mayor igual a 0

 b)〈Min as,bs,cs : xs=as++bs++cs : sum.bs〉

    calcula el el valor minimo posible de la suma de los segmentos intermedios

 c)〈N as,b,bs : xs=as++(b.bs) : b>sum.bs〉

    la cantidad de primeros valores de sufijos de xs que son mayores al resto del sufijo

 d)〈Max as,bs,cs : xs=as++bs∧ys=as++cs :  #as〉

    calcula la longitud maxima posible de un prefijo igual en xs e ys
 
 ```

## Ej4

 Expresar utilizando cuantificadores las siguientes sentencias del lenguaje natural
```haskell

a)  La lista xs es un segmento inicial de la lista ys(prefijo.xs.ys).

    prefijo.xs.ys := <∃ bs : : ys==xs++bs>

b)  La lista xs es un segmento de la lista ys(seg.xs.ys).

    seg.xs.ys := <∃ as,bs : : ys=as++xs++bs>

c)  La lista xs es un segmento final de la lista ys(sufijo.xs.ys)
    
    sufijo.xs.ys := <∃ as : : ys==as++xs>

d)  Las listas xs e ys tienen en comun un segmento no vaćıo (segComun.xs.ys).

    segComun.xs.ys := <∃ as,bs,cs,ds,es : : ys=as++cs++bs ∧ ys=ds++cs++es>
    segComun.xs.ys := <∃ as : as!=[] : seg.xs.as ∧ seg.ys.as>

e)  La lista xs posee un segmento que no es ni prefijo ni sufijo y cuyo mınimo es mayor a  los  valores del prefijo y del sufijo (hayMeseta.xs).

    hayMeseta.xs := <∃as,bs,cs : xs=as++bs++cs ∧ as!=[] ∧ cs!=[] : min.bs>max.as ∧ min.bs>max.cs >
    
    hayMeseta.xs := <∃as,bs,cs : ¬(prefijo.as.xs ∨ sufijo.as.xs) ∧ prefijo.bs.xs ∧ sufijo.cs.xs : min.bs>max.as ∧ min.bs>max.cs >

f)  La lista xs de numeros enteros tiene la misma cantidad de elementos pares e impares (balanceada.xs)

    balanceada.xs := (<Np : 0<=p<#xs : par.xs!!p > == <Np : 0<=p<#xs : ¬(par.xs!!p) >)

```

## EJ5

Derivar funciones recursivas para prefijo (4a) y seg (4b)

#### 4a)

```haskell

prefijo.xs.ys := <∃ bs : : ys==xs++bs>

CB: prefijo.[].ys
    {def}
    <∃ bs : : ys==[]++bs>
    {Caso base ++}
    <∃ as : : ys=as>
    { intercambio de rango y término }
    <∃ as : ys=as : True>
    = { término constante }
    True

HI: prefijo.xs.ys := <∃ as : : ys==xs++as>

CI: prefijo.x:xs.ys
    {def}
    <∃ as : : ys==x:xs++as>
    {caso induct ++}
    <∃ as : : ys==x:(xs++as)>

-- caso ys = y:ys

    <∃ as : : y:ys==x:(xs++as)>
    {logica}
    <∃ as : : y==x ∧ ys==(xs++as)>
    {intercambio rango y termino}
    <E as: y=x : ys=xs++as>
    {analisis por casos}
        -- (y=x) = True
            <E as: True : ys=xs++as>
            {hipotesis inductiva}
            prefijo.xs.ys
        -- (y=x) = False
            <E as: False : ys=xs++as>
            {rango vacio del E}
            False

-- caso ys = []
    <∃ bs : : []==x:(xs++bs)>
    {logica}
    <∃ bs : : False>
    {intercamvio rango termino}
    <∃ bs : False : >
    {rango vasio}
    False

RESULTADO

prefijo.[].ys := True
prefijo.(x:xs).(y:ys) :=    (   (x==y)->prefijo.xs.ys
                            [] ¬(x==y)->False
                            )      
prefijo.(x:xs).[] := False

```

#### 4b)

```haskell

seg.xs.ys := <∃ as,bs : : ys=as++xs++bs>

prefijo.xs.ys := <∃ bs : : ys==xs++bs>

CB: seg.[].ys
    {def}
    <∃ as,bs : : ys=as++[]++bs>
    {cb de ++}
    <∃ as,bs : : ys=as++bs>
    {intercambio rango termino}
    <∃ as,bs : ys=as++bs : True >
    {rango unitario}
    True

HI: seg.xs.ys := <∃ as,bs : : ys=as++xs++bs>

CB: seg.x:xs.ys
    {def}
    <∃ as,bs : : ys=as++(x:xs)++bs>
    {def de ++}
    <∃ as,bs : : ys=as++x:(xs++bs)>
    {analisis por caso}
        -- ys==[]
    <∃ as,bs : : []=as++x:(xs++bs)>
    {logica}
    <∃ as,bs : : False>
    {intercambio rango termino}
    <∃ as,bs : False : >
    {rango vacio}
    False
        -- ys==(y:ys)
    <∃ as,bs : : (y:ys)=as++x:(xs++bs)>
    {logica}
    <∃ as,bs : : (y:ys)=as++x:(xs++bs)>

-- vamo a intentar hacer induccion en ys

CB: seg.xs.[]
    {def}
    <∃ as,bs : []=as++xs++bs : True >
    {prop de ++}
    <∃ as,bs : []=as∧[]=xs∧[]=bs : True>
    {intercambio rango termino}
    <∃ as,bs : []=as∧[]=bs : []=xs >
    {rango unitario}
    xs=[]

HI: seg.xs.ys := <∃ as,bs : : ys=as++xs++bs>
prefijo.xs.ys := <∃ bs : : ys==xs++bs>

CI: seg.xs.(y:ys)
    {def}
    <∃ as,bs : y:ys=as++xs++bs : True >
    {distri y particion de rangos}
    <∃ as,bs : y:ys=as++xs++bs ∧ (as=[]) : True > ∨ <∃ as,bs : [y]++ys=as++xs++bs ∧ (as!=[]) : True >
    {leibniz y eliminacion de variable}
    <∃ bs : y:ys=[]++xs++bs : True > ∨ <∃ as,bs : [y]++ys=as++xs++bs ∧ (as!=[]) : True >
    {def de ++}
    <∃ bs : y:ys=xs++bs : True > ∨ <∃ as,bs : [y]++ys=as++xs++bs ∧ (as!=[]) : True >
    {def de prefijo}
    prefijo.xs.(y:ys) ∨ <∃ as,bs : [y]++ys=as++xs++bs ∧ (as!=[]) : True >
    {def de as}
    prefijo.xs.(y:ys) ∨ <∃ as,bs : [y]++ys=as++xs++bs ∧ (as=a:as) : True >
    {lebniz}
    prefijo.xs.(y:ys) ∨ <∃ (a:as),bs : [y]++ys=a:as++xs++bs : True >
    ={Prodiedad de listas}
    prefijo.xs.(y:ys) ∨ <∃ (a:as),bs : [y]=a ∧ ys=as++xs++bs : True >



    --trabajo por casos (y=a)=False ∨ (y=a)=True, ya que existen las dos posibilidades
    prefijo.xs.(y:ys) ∨ <∃ as,bs : False ∧ ys=as++xs++bs : True > ∨ <∃ as,bs : True ∧ ys=as++xs++bs : True >
    {absorvente}
    prefijo.xs.(y:ys) ∨ <∃ as,bs : False : True > <∃ as,bs : ys=as++xs++bs : True >
    {rango vacio y HI}
    prefijo.xs.(y:ys) ∨ False ∨ seg.xs.ys
    {absorvente}
    prefijo.xs.(y:ys) ∨ seg.xs.ys


RESULTADO

seg.xs.[] := (xs=[])
seg.xs.(y:ys) := prefijo.xs.(y:ys) ∨ seg.xs.ys

```

## EJ6

El predicado eco.xs dice si la palabra xs es la duplicacion de un segmento (pensemos en sılabas)
```haskell
eco :: String -> Bool

eco.xs=〈∃ as,bs : xs=as++bs ∧ as!=[] : as=bs〉

Calcular el rango para xs=“frufru”; luego decidir si eco.“frufru”.

xs => "frufru"
rango => xs=as++bs ∧ as!=[]

"frufru"=as++bs ∧ as!=[]

as | bs
f | rufru
fr | ufru 
fru | fru <== 
fruf | ru
frufr | u
frufru | []

eco.“frufru” = True


```

## EJ7

Especificar y derivar
decide si una palabra comienza con eco. 
Ejemplos que satis-facen semiEco son: “paparulo”, “mamado”, “tetera”, “anana”

```haskell

semiEco :: String -> Bool

semiEco.xs = <∃as : prefijo.as.xs : 〈∃ as,bs : xs=as++bs ∧ as!=[] : as=bs〉>
semiEco.xs = <∃as,bs,cs : xs=as++bs++cs ∧ as!=[] : as==bs >

CB: semiEco.[]
    {def}
    <∃as,bs,cs : []=as++bs++cs ∧ as!=[] : as==bs >
    {logica} 
    <∃as,bs,cs :  False : as==bs >
    {rango vacio}
    False

HI: semiEco.xs = <∃as,cs : xs=as++as++cs : as!=[] >

CI: semiEco.(x:xs)
    {def}
    <∃as,cs : (x:xs)=as++as++cs : as!=[] >
    {intercambio rango termino}
    <∃as,cs : (x:xs)=as++as++cs ∧ as!=[] : True >
    {as!=[] => as=(a:as)}
    <∃a,as,cs : (x:xs)=(a:as)++(a:as)++cs ∧ (a:as)!=[] : True >
    {prop de ++}
    <∃a,as,cs : (x:xs)=a:(as++(a:as)++cs) ∧ (a:as)!=[] : True > 
    {logica}
    <∃a,as,cs : (x=a) ∧ xs=(as++(a:as)++cs) ∧ (a:as)!=[] : True > 
    {eliminacion de variable y logica}
    <∃as,cs : xs=(as++(x:as)++cs) : True > 
    {tercer excluido}
    <∃as,cs : xs=(as++(x:as)++cs) ∧ (as=[] ∨ as!=[]) : True > 
    {distributiva}
    <∃as,cs : (xs=(as++(x:as)++cs) ∧ as=[]) ∨ (xs=(as++(x:as)++cs) ∧ as!=[]) : True > 
    {particion de rango}
    <∃as,cs : (xs=(as++(x:as)++cs) ∧ as=[]) : True > ∨ <∃as,cs : (xs=(as++(x:as)++cs) ∧ as!=[]) : True > 
    {leiwis y eliminacion d variable}
    <∃as,cs : (xs=([]++(x:[])++cs)) : True > ∨ <∃as,cs : (xs=(as++(x:as)++cs) ∧ as!=[]) : True > 
    {regla de ++ y intercambio rango termino}
    <∃as,cs : (xs=(x++cs)) : True > ∨ <∃as,cs : xs=as++x:as++cs : as!=[] > 
    {prop lista}
    <∃as,cs : (xs=(x++cs)) : True > ∨ <∃as,cs : xs=as++[x]++as++cs : as!=[] > 
    {no puedo hacer anda con esa x entonces generalizo}
    
    GENERALIZO

genSemiEco.xs.zs = <∃as,bs : xs=as++zs++as++bs : as!=[] >

CD: genSemiEco.[].zs
    {def}
    <∃as,bs : []=as++zs++as++bs : as!=[] >
    {intercambio rango termino}
    <∃as,bs : []=as++zs++as++bs ∧ as!=[] : >
    {logica} 
    <∃as,bs,cs :  False : as==bs >
    {rango vacio}
    False
    
HI: genSemiEco.xs.zs = <∃as,bs : xs=as++zs++as++bs : as!=[] >

CI: genSemiEco.(x:xs).zs
    {def}
    <∃as,cs : (x:xs)=as++zs++as++cs : as!=[] >
    {intercambio rango termino}
    <∃as,cs : (x:xs)=as++zs++as++cs ∧ as!=[] : True >
    {as!=[] => as=(a:as)}
    <∃a,as,cs : (x:xs)=(a:as)++zs++(a:as)++cs ∧ (a:as)!=[] : True >
    {prop de ++}
    <∃a,as,cs : (x:xs)=a:(as++zs++(a:as)++cs) ∧ (a:as)!=[] : True > 
    {logica}
    <∃a,as,cs : (x=a) ∧ xs=(as++zs++(a:as)++cs) ∧ (a:as)!=[] : True > 
    {eliminacion de variable y logica}
    <∃as,cs : xs=(as++zs++(x:as)++cs) : True > 
    {tercer excluido}
    <∃as,cs : xs=(as++zs++(x:as)++cs) ∧ (as=[] ∨ as!=[]) : True > 
    {distributiva}
    <∃as,cs : (xs=(as++zs++(x:as)++cs) ∧ as=[]) ∨ (xs=(as++zs++(x:as)++cs) ∧ as!=[]) : True > 
    {particion de rango}
    <∃as,cs : (xs=(as++zs++(x:as)++cs) ∧ as=[]) : True > ∨ <∃as,cs : (xs=(as++zs++(x:as)++cs) ∧ as!=[]) : True > 
    {leiwis y eliminacion d variable}
    <∃as,cs : (xs=([]++zs++(x:[])++cs)) : True > ∨ <∃as,cs : (xs=(as++zs++(x:as)++cs) ∧ as!=[]) : True > 
    {regla de ++ y intercambio rango termino}
    <∃as,cs : (xs=(zs++x++cs)) : True > ∨ <∃as,cs : xs=as++zs++x:as++cs : as!=[] > 
    {prop lista}
    <∃as,cs : (xs=(zs++x++cs)) : True > ∨ <∃as,cs : xs=as++(zs:x)++as++cs : as!=[] > 
    {HI}
    <∃as,cs : (xs=(zs++x++cs)) : True > ∨ genSemiEco.xs.(zs:x)

```



 
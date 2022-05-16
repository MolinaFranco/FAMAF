## Ejercicio 1.

#### a)
    
    psum.xs = <∀i : 0<=i<=#xs : sum.(xs↑i)>=0>

"Todas las posibles sumas de prefijos son positivas"   
```haskell
psum :: [int] -> Bool 
```

```haskell
CB: psum.[] 
    {esp}
    <∀i : 0<=i<=#[] : sum.([]↑i)>=0>
    {caso base de #}
    <∀i : 0<=i<=0 : sum.([]↑i)>=0>
    {algebra}
    <∀i : i=0 : sum.([]↑i)>=0>
    {rango uniario}
    sum.([]↑0)>=0
    {logica}
    sum.([])>=0
    {caso base de sum}
    0>=0
    {algebra}
    True

HI: psum.xs = <∀i : 0<=i<=#xs : sum.(xs↑i)>=0>

CI: psum.(x:xs)
    {esp}
    <∀i : 0<=i<=#(x:xs) : sum.((x:xs)↑i)>=0>
    {algebra}
    <∀i : 0<=i<=#xs+1 : sum.((x:xs)↑i)>=0>
    {rango de una sola variable}
    <∀i : i=0 ∨ 1<=i<=#xs+1 : sum.((x:xs)↑i)>=0>
    {particion de rango}
    <∀i : i=0 : sum.((x:xs)↑i)>=0> ∧ <∀i : 1<=i<=#xs+1 : sum.((x:xs)↑i)>=0> 
    {rango unitario y algebra}
    sum.((x:xs)↑0)>=0 ∧ <∀i : 0<=i-1<=#xs : sum.((x:xs)↑i)>=0> 
    {cambio de variable j=i-1 y caso base de ↑}
    sum.([])>=0 ∧ <∀j : 0<=j<=#xs : sum.((x:xs)↑j+1)>=0> 
    {caso base sum y algebra}
    True ∧ <∀j : 0<=j<=#xs : sum.((x:xs)↑j+1)>=0> 
    {neutro de ∧}
    <∀j : 0<=j<=#xs : sum.((x:xs)↑j+1)>=0> 
    {caso induc. de ↑}
    <∀j : 0<=j<=#xs : sum.(x:(xs)↑j)>=0>
    {caso indu. de sum} 
    <∀j : 0<=j<=#xs : x + sum.((xs)↑j)>=0>

    {generalizacion de 0 -> k}

    psum.xs.k = <∀i : 0<=i<=#(x:xs) : sum.((x:xs)↑i)>=k>

CB: psum.[].k
    {esp}
    <∀i : 0 <=i<=#[] : sum.([]↑i)>=k)>
    {caso base de #}
    <∀i : 0<=i<=0 : sum.([]↑i)>=k>
    {algebra}
    <∀i : i=0 : sum.([]↑i)>=k>
    {rango uniario}
    sum.([]↑0)>=k
    {logica}
    sum.([])>=k
    {caso base de sum}
    0>=k

HI: psum.xs.k = <∀i : 0<=i<=#xs : sum.(xs↑i)>=k>

CI: psum.(x:xs)
    {esp}
    <∀i : 0<=i<=#(x:xs) : sum.((x:xs)↑i)>=k>
    {algebra}
    <∀i : 0<=i<=#xs+1 : sum.((x:xs)↑i)>=k>
    {rango de una sola variable}
    <∀i : i=0 ∨ 1<=i<=#xs+1 : sum.((x:xs)↑i)>=k>
    {particion de rango}
    <∀i : i=0 : sum.((x:xs)↑i)>=k> ∧ <∀i : 1<=i<=#xs+1 : sum.((x:xs)↑i)>=k> 
    {rango unitario y algebra}
    sum.((x:xs)↑0)>=k ∧ <∀i : 0<=i-1<=#xs : sum.((x:xs)↑i)>=k> 
    {cambio de variable j=i-1 y caso base de ↑}
    sum.([])>=k ∧ <∀j : 0<=j<=#xs : sum.((x:xs)↑j+1)>=k> 
    {caso base sum y algebra}
    0>=k ∧ <∀j : 0<=j<=#xs : sum.((x:xs)↑j+1)>=k> 
    {caso induc. de ↑}
    0>=k ∧ <∀j : 0<=j<=#xs : sum.(x:(xs)↑j)>=k>
    {caso indu. de sum} 
    0>=k ∧ <∀j : 0<=j<=#xs : x + sum.((xs)↑j)>=k>
    {aritmetica}
    0>=k ∧ <∀j : 0<=j<=#xs : sum.((xs)↑j)>=(k-x)>
    {HI}
    0>=k ∧ psum.xs.(k-x)
```

Al final determinamos q psum.xs es un caso de la funcion general de psum.xs.0


#### b)  

    sumant.xs = <∃i : 0<=i<#xs : xs!i=sum.(xs↑i)>

"Existe un elemento con el mismo valor de la suma de su prefijo"
    
```haskell
psum :: [Int] -> Bool
```

```haskell

CB: sumant.[]
    {esp}
    <∃i : 0<=i<#[] : xs!i=sum.([]↑i)>
    {caso base #}
    <∃i : 0<=i<0 : xs!i=sum.([]↑i)>
    {algebra}
    <∃i : False : xs!i=sum.([]↑i)>
    {rango vacio}
    False

HI: sumant.xs = <∃i : 0<=i<#xs : xs!i=sum.(xs↑i)>

CI: sumant.(x:xs)
    {esp}
    <∃i : 0<=i<#(x:xs) : (x:xs)!i=sum.((x:xs)↑i)>
    {algebra}
    {rango de una sola variable}
    <∃i : i=0 ∨ 1<=i<#xs+1 : (x:xs)!i=sum.((x:xs)↑i)>
    {particion de rango}
    <∃i : i=0 : (x:xs)!i=sum.((x:xs)↑i)>
    ∨
    <∃i : 1<=i<#xs+1 : (x:xs)!i=sum.((x:xs)↑i)>
    {ranog unitario y cambio de variable j=i-1}
    (x:xs)!0=sum.((x:xs)↑0) ∨ <∃i : 0<=j<#xs : (x:xs)!j+1=sum.((x:xs)↑j+1)>
    {caso base del ↑ y caso indu. de !}
    x=sum.([]) ∨ <∃i : 0<=j<#xs : (xs!j)=sum.(x:(xs↑j))>
    {caso recur. sum}
    x=sum.([]) ∨ <∃i : 0<=j<#xs : (xs!j)= x + sum.(xs↑j)>

    {generalización}

    sumantg.xs.k = <∃i : 0≤i<#xs : xs!i = k + sum.(xs ↑ i)>

CB: sumant.[].k
    {esp}
    <∃i : 0<=i<#[] : xs!i = k + sum.([]↑i)>
    {caso base #}
    <∃i : 0<=i<0 : xs!i = k + sum.([]↑i)>
    {algebra}
    <∃i : False : xs!i = k + sum.([]↑i)>
    {rango vacio}
    False

HI: sumant.xs.k = <∃i : 0<=i<#xs : xs!i=k+sum.(xs↑i)>

CI: sumant.(x:xs)
    {esp}
    <∃i : 0<=i<#(x:xs) : (x:xs)!i=k+sum.((x:xs)↑i)>
    {algebra}
    {rango de una sola variable}
    <∃i : i=0 ∨ 1<=i<#xs+1 : (x:xs)!i=k+sum.((x:xs)↑i)>
    {particion de rango}
    <∃i : i=0 : (x:xs)!i=k+sum.((x:xs)↑i)>
    ∨
    <∃i : 1<=i<#xs+1 : (x:xs)!i=k+sum.((x:xs)↑i)>
    {ranog unitario y cambio de variable j=i-1}
    (x:xs)!0=k+sum.((x:xs)↑0) ∨ <∃i : 0<=j<#xs : (x:xs)!j+1=k+sum.((x:xs)↑j+1)>
    {caso base del ↑ y caso indu. de !}
    x=k+sum.([]) ∨ <∃i : 0<=j<#xs : (xs!j)=k+sum.(x:(xs↑j))>
    {caso recur. sum}
    x=k ∨ <∃i : 0<=j<#xs : (xs!j) = (x+k) + sum.(xs↑j)>
    {HI}
    x=k ∨ sumant.xs.(x+k)
```
Queda derivado y demostrado que suman.xs es un caso de sumantg.xs.k donde k=0

## Ejercicio 2.

#### a) 

```haskell
esCuad :Nat→Bool
```
dado un natural determina si es el cuadrado de un numero.

```haskell
esCuad.n = <Ei : 0<=i<=n : i*i=n>

CB: esCuad.0
    {esp}
    <Ei : 0<=i<=0 : i*i=0>
    {aritmetica}
    <Ei : i=0 : i*i=0>
    {rango unitario}
    0*0=0
    {aritmetica}
    True

HI: esCuad.n = <Ei : 0<=i<=n : i*i=n>

CI: esCuad.(n+1)
    {esp}
    <Ei : 0<=i<=(n+1) : i*i=(n+1)>
    {rango de una variable}
    <Ei : 1<=i<=n ∨ i=n+1 : i*i=(n+1)>
    {particion de rango}
    <Ei : i=n+1 : i*i=(n+1)> ∨ <Ei : 1<=i<=n : i*i=(n+1)>
    {rangoo unitario}
    n+1 * n+1 = n+1 ∨ <Ei : 1<=i<=n : i*i = n+1>
    {generalizar}
    
esCuadG.n.m = <Ei : 0<=i<=n : i*i=n+m>

CB: esCuadG.0.m 
    {esp}
    <Ei : 0<=i<=0 : i*i=0+m>
    {aritmetica}
    <Ei : i=0 : i*i=0+m>
    {rango unitario}
    0*0=0+m
    {aritmetica}
    m=0

HI: esCuadG.n.m = <Ei : 0<=i<=n : i*i=n+m>

CI: esCuadG.(n+1).m 
    {esp}
    <Ei : 0<=i<=(n+1) : i*i=(n+1)+m>
    {rango de una sola variable}
    <Ei : 0<=i<=n ∨ i=n+1 : i*i=(n+1)+m>
    {particion de rango}
    <Ei : i=n+1 : i*i=(n+1)+m> ∨ <Ei : 0<=i<=n : i*i=(n+1)+m>
    {aso}
    <Ei : i=n+1 : i*i=(n+1)+m> ∨ <Ei : 0<=i<=n : i*i=n+(1+m)>
    {rango unitario y HI}
    (n+1)*(n+1)=(n+1)+m ∨ esCuadG.n.(m+1)

```


#### b)  

```haskell
sumanOcho : [Num]→Nat
```
dada una lista cuenta la cantidad de prefijos que suman 8.

```haskell
sumanOcho.xs = <Ni : 0<=i<=#xs : sum.(xs↑i)=8>

CB: sumanOcho.[] 
    {esp}
    <Ni : 0<=i<=#[] : sum.([]↑i)=8>
    {caso base de #}
    <Ni : 0<=i<=0 : sum.([]↑i)=8>
    {logica}
    <Ni : i=0 : sum.([]↑i)=8>
    {rango unitario}
    sum.([]↑0)=8
    {caso base de ↑}
    sum.([])=8
    {caso base de sum}
    0=8
    {logica}
    False

HI: sumanOcho.xs = <Ni : 0<=i<=#xs : sum.(xs↑i)=8>

CI: sumanOcho.(x:xs)
    {esp}
    <Ni : 0<=i<=#(x:xs) : sum.((x:xs)↑i)=8>
    {logica}
    <Ni : 0<=i<=#xs+1 : sum.((x:xs)↑i)=8>
    {rango una variable}
    <Ni : i=0 ∨ 1<=i<=#xs+1 : sum.((x:xs)↑i)=8>
    {particion de rangos}
    <Ni : i=0 : sum.((x:xs)↑i)=8> + <Ni : 1<=i<=#xs+1 : sum.((x:xs)↑i)=8>
    {rango unitario y aritmetica}
    sum.((x:xs)↑0)=8 + <Ni : 0<=i-1<=#xs : sum.((x:xs)↑i)=8>
    {cambio de variable j=i-1 y caso base de ↑}
    sum.([])=8 + <Ni : 0<=j<=#xs : sum.((x:xs)↑(j+1))=8>
    {caso vacio de sum y caso rec. de ↑}
    0=8 + <Ni : 0<=j<=#xs : sum.(x:(xs↑j))=8>
    {logica y caso rec de sum}
    False + <Ni : 0<=j<=#xs : x + sum.(xs↑j)=8>
    {algebra}
    False + <Ni : 0<=j<=#xs : sum.(xs↑j)= 8-x >
    {generalizacion}

    suman.xs.k = <Ni : 0<=i<=#xs : sum.(xs↑i)=k>

CB: suman.[].k
    {esp}
    <Ni : 0<=i<=#[] : sum.([]↑i)=k>
    {caso base de #}
    <Ni : 0<=i<=0 : sum.([]↑i)=k>
    {logica}
    <Ni : i=0 : sum.([]↑i)=k>
    {rango unitario}
    sum.([]↑0)=k
    {caso base de ↑}
    sum.([])=k
    {caso base de sum}
    k=0

HI: suman.xs.k = <Ni : 0<=i<=#xs : sum.(xs↑i)=k>

CI: suman.(x:xs).k
    {esp}
    <Ni : 0<=i<=#(x:xs) : sum.((x:xs)↑i)=k>
    {logica}
    <Ni : 0<=i<=#xs+1 : sum.((x:xs)↑i)=k>
    {rango una variable}
    <Ni : i=0 ∨ 1<=i<=#xs+1 : sum.((x:xs)↑i)=k>
    {particion de rangos}
    <Ni : i=0 : sum.((x:xs)↑i)=k> + <Ni : 1<=i<=#xs+1 : sum.((x:xs)↑i)=k>
    {rango unitario y aritmetica}
    (sum.((x:xs)↑0)=k -> 1
    ¬sum.((x:xs)↑0)=k -> 0
    ) + <Ni : 0<=i-1<=#xs : sum.((x:xs)↑i)=k>
    {cambio de variable j=i-1 y caso base de ↑}
    (sum.([])=k -> 1
    ¬sum.([])=k -> 0
    ) + <Ni : 0<=j<=#xs : sum.((x:xs)↑(j+1))=k>
    {caso vacio de sum y caso rec. de ↑}
    (0=k->1
    ¬0=k->0
    ) + <Ni : 0<=j<=#xs : sum.(x:(xs↑j))=k>
    {logica y caso rec de sum}
    (0=k->1
    ¬0=k->0
    ) + <Ni : 0<=j<=#xs : x + sum.(xs↑j)=k>
    {algebra}
    (0=k->1
    ¬0=k->0
    ) + <Ni : 0<=j<=#xs : sum.(xs↑j)= k-x >
    {HI}
    (0=k->1
    ¬0=k->0
    ) + suman.xs.(k-x)

```

## Ejercicio 3.

#### a) 

xs= [9,−5,1,−3] ys= [9,−5,3]

```haskell
<∀as,bs : xs = as++bs : sum.as>=0>
```
```haskell
as          | bs
[9,−5,1,−3] | []            -> True
[9,−5,1]    | [−3]          -> True
[9,−5]      | [1,−3]        -> True
[9]         | [−5,1,−3]     -> True
[]          | [9,−5,1,−3]   -> True
```
    Toda suma de valores de los posibles prefijos de la lista XS son >=0 

#### b) 

```haskell
<Min as,bs,cs : xs=as++bs++cs : sum.bs>
```
    El minimo de las posibles sumas de elementos de los segmentos bs 
```haskell
as          | bs    	    | cs
[9,−5,1,−3] | []            | []            -> 0
[9,−5,1]    | [−3]          | []            -> -3
[9,−5]      | [1,−3]        | []            -> -2
[9]         | [−5,1,−3]     | []            -> -7
[]          | [9,−5,1,−3]   | []            -> 2
            |     	        | 
[9,−5,1]    | []            | [−3]          -> 0
[9,−5]      | [1,]          | [−3]          -> 1
[9]         | [−5,1]        | [−3]          -> -4
[]          | [9,−5,1]      | [−3]          -> 5
            |     	        | 
[9,−5]      | []            | [1,−3]        -> 0
[9]         | [−5,]         | [1,−3]        -> -5
[]          | [9,−5,1,−3]   | [1,−3]        -> 2
            |     	        | 
[9]         | []            | [1,−3,−5]     -> 0
[]          | [9]           | [1,−3,−5]     -> 9
            |     	        | 
[]          | []            | [9,1,−3,−5]   -> 0

```

#### c) 

```haskell
<N as,b,bs : xs=as++(b:bs) : b>sum.bs>
```
    La cantidad de casos donde el primer elemento de bs es mayor a la suma de los elementos de bs
```haskell
as          | bs
[9,−5,1]    | [−3]          -> False
[9,−5]      | [1,−3]        -> True
[9]         | [−5,1,−3]     -> True
[]          | [9,−5,1,−3]   -> True

->3
```

#### d) 

```haskell
<Max as,bs,cs : xs=as++bs ∧ ys=as++cs : #as>
```
    La maxima cantidad de elementos que puede tener el mismo prefijo de xs e ys 
```haskell
as          | bs
[9,−5]      | [1,−3]         
[9]         | [−5,1,−3]     
[]          | [9,−5,1,−3]    


as          | cs
[9,−5]      | [1,3]        
[9]         | [−5,1,3]     
[]          | [9,−5,1,3]   

->2
```

## Ejercicio 4.

a)  La lista xs es un segmento inicial de la lista ys(prefijo.xs.ys).
```haskell
prefijo.xs.ys = <∃ as : : ys=xs++as>
```

b)  La lista xs es un segmento de la lista ys(seg.xs.ys).
```haskell
seg.xs.ys = <∃ as,bs : : ys=as:xs:bs>
```

c)  La listaxs es un segmento final de la lista ys(sufijo.xs.ys)
```haskell
sufijo.xs.ys = <∃ as : : ys=as++xs>
```

d)  Las listas xs e ys tienen en comun un segmento no vacıo (segComun.xs.ys).
```haskell
segComun.xs.ys = <∃ as : as!=[] : seg.as.xs ∧ seg.as.ys>
```

e)  La  lista xs posee  un  segmento  que  no  es  ni prefijo ni sufijo y  cuyo  mınimo  es  mayor  a  los  valores  del prefijo y del sufijo (hayMeseta.xs).
```haskell
hayMeseta.xs = <∃ as,bs,cs : xs=as:bs:cs ∧ as!=[] ∧ cs!=[] : min bs < max as ∧ min bs < max cs  >
```

f)  La lista xs de numeros enteros tiene la misma cantidad de elementos pares e impares (balanceada.xs).
```haskell
balanceada.xs = <Ni : 0<i<=#xs : par.(xs!i) > == <Nj : 0<j<=#xs : ¬par.(xs!j) >
```

## Ejercicio 5.

#### a)  
```haskell
prefijo.xs.ys = <∃ as : : ys=xs++as>
```
```haskell
CB: prefijo.[].ys
    {esp}
    <∃ as : : ys=[]++as>
    {Caso base ++}
    <∃ as : : ys=as>
    { intercambio de rango y término }
    <∃ as : ys = as : True>
    = { término constante }
    True

HI: prefijo.xs.ys = <∃ as : : ys=xs++as>

CI: prefijo.(x:xs).ys 
    {esp}
    <∃ as : : ys = (x:xs)++as>
    {caso indu. de ++}
    <∃ as : : ys = x:(xs++as)>

-- Caso: ys=(y:ys)
    prefijo.(x:xs).(y:ys)
    {especificacion}
    <E as:: y:ys=(x:xs)++as>
    {definicion de ++}
    <E as:: y:ys=x:(xs++as)>
    {logica}
    <E as:: y=x ∧ ys=xs++as>
    {intercambio}
    <E as: True ∧ y=x : ys=xs++as>
    {neutro de la conjuncion}
    <E as: y=x : ys=xs++as>
    {rangos disjuntos}
        -- (y=x) = True
            <E as: True : ys=xs++as>
            {hipotesis inductiva}
            prefijo.xs.ys
        -- (y=x) = False
            <E as: False : ys=xs++as>
            {rango vacio del E}
            False

-- Caso: ys=[]
    prefijo.(x:xs).[]
    {especificacion}
    <E as:: []=(x:xs)++as>
    {definicion de ++}
    <E as:: []=x:(xs++as)>
    {propiedad de listas}
    False   

```

#### b)  La lista xs es un segmento de la lista ys(seg.xs.ys).
```haskell
seg.xs.ys = <∃ as,bs : : ys=as++xs++bs>
```

```haskell
CB: seg.[].ys
    {esp}
    <∃ as,bs : : ys=as++[]++bs>
    {caso base de ++}
    <∃ as,bs : : ys=as++bs>
    {intercambio de rango y termino}
    <∃ as,bs : ys=as++bs : True>
    {rango unitario}
    True

HI: seg.xs.ys = <∃ as,bs : : ys=as++xs++bs>
    
CI: seg.(x:xs).ys
    {esp}
    <∃ as,bs : : ys=as++(x:xs)++bs>
    {propiedad ++}
    <∃ as,bs : : ys=as++(x:(xs++bs))>
    {analisis por casos}

-- Caso ys = []
```
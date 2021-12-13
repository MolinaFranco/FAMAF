## EJ1

```haskell
sum : [Num] -> Num
sum [ ]:= 0
sum (x.xs) := x+sum.xs
```

#### a) 

¿Que hace esta funcion? Escriba en lenguaje natural el problema que resuelve.

Esta funcion realiza la sumatoria de los elementos de un array

#### b) 

Escriba una especificacion de la funcion con una expresion cuantificada.

```haskell
    <Σi : 0<=i<#xs : xs!!i>
```

#### c) 

Verifiqueque esta especificaci ́on vale para toda listaxs.

```haskell
CB: xs=[]
sum[ ] = <Σi : 0<=i<#[] : []!!i>
{caso base de #}
sum[ ] = <Σi : 0<=i<0 : []!!i>
{logica}
sum[ ] = <Σi : False : []!!i>
{rango vacio}
sum[ ] = 0

HI: sum.xs === <Σi : 0<=i<#xs : xs!!i>

CI: x:xs 
sum.x:xs === <Σi : 0<=i<#x:xs : x:xs!!i>
{definicion de #x:xs}
sum.x:xs === <Σi : 0<=i<#xs+1 : x:xs!!i>
{logica}
sum.x:xs === <Σi : 0=i ∨ 1<=i<#xs+1 : x:xs!!i>
{algebre}
sum.x:xs === <Σi : 0=i ∨ 0<=i-1<#xs : x:xs!!i>
{particion de rango}
sum.x:xs === <Σi : 0=i : x:xs!!i> + <Σi : 0<=i-1<#xs : x:xs!!i>
{rango unitario y cambio de variable (i-1 = j)}
sum.x:xs === x:xs!!0 + <Σi : 0<=j<#xs : x:xs!!j+1>
{logica}
sum.x:xs === x + <Σi : 0<=j<#xs : xs!!j>
{HI}
sum.x:xs === x + sum.xs
{}
True
```

#### d) 
Ahora derive la definicion de la funcion a partir de su especificacion.
¿Esta derivacion es parecida a la demostraci ́on en el punto 1c?
es exactamente igual

```haskell

CB:

sum [ ]  =  <Σi : 0<=i<#[] : []!!i>
            {caso base de #}
            <Σi : 0<=i<0 : []!!i>
            {logica}
            <Σi : False : []!!i>
            {rango vacio}
            0

HI: sum.xs === <Σi : 0<=i<#xs : xs!!i>

CI:

sum.x:xs =  <Σi : 0<=i<#x:xs : x:xs!!i>
            {definicion de #x:xs}
            <Σi : 0<=i<#xs+1 : x:xs!!i>
            {logica}
            <Σi : 0=i ∨ 1<=i<#xs+1 : x:xs!!i>
            {algebre}
            <Σi : 0=i ∨ 0<=i-1<#xs : x:xs!!i>
            {particion de rango}
            <Σi : 0=i : x:xs!!i> + <Σi : 0<=i-1<#xs : x:xs!!i>
            {rango unitario y cambio de variable (i-1 = j)}
            x:xs!!0 + <Σi : 0<=j<#xs : x:xs!!j+1>
            {logica}
            x + <Σi : 0<=j<#xs : xs!!j>
            {HI}
            x + sum.xs


```



## Ej 2

A partir de las siguientes especificaciones, dar el tipo de cada funcion y derivarlas soluciones algorıtmicas correspondientes.

#### b)  

```haskell
iga.e.xs =<∀i: 0≤i<#xs : xs!i=e>

iga :: a ->[a]->Bool

CB:

iga.e.[] 
= <∀i: 0≤i<#[] : []!i=e>
{caso base de #}
= <∀i: 0≤i<0 : []!i=e>
{algebra}
= <∀i: False : []!i=e>
{rango vacio del ∀}
= True

HI: iga.e.xs =<∀i: 0≤i<#xs : xs!i=e>

CI:

iga.e.x:xs 
= <∀i: 0≤i<#x:xs : x:xs!i=e>
{caso induc. #}
= <∀i: 0≤i<#xs+1 : x:xs!i=e>
{algebra y logica}
= <∀i: 0=i ∨ 0<=i-1<#xs : x:xs!i=e>
{particion de rango y cambio de variable (j=i-1)}
= <∀i: 0=i : x:xs!i=e> ∧ <∀j: 0<=j<#xs : x:xs!j+1=e>
{rango unitario y CI de !!}
= x:xs!0=e ∧ <∀j: 0<=j<#xs : xs!j=e>
{funcional}
= x=e ∧ <∀j: 0<=j<#xs : xs!j=e>
{HI}
= x=e ∧ iga.e.xs

Resultado
iga :: a ->[a]->Bool
iga.e.[] := True
iga.e.x:xs := (x==e) ∧ iga.e.xs

```




#### e)  
```haskell
cuantos.p.xs = <Ni : 0≤i<#xs : p.(xs!!i)>

cuantos :: (a -> Bool) -> [a] -> Int

CB: 
cuantos.p.[] 
{}
= <Ni : 0≤i<#[] : p.([]!!i)>
{def de #}
= <Ni : 0≤i<0 : p.([]!!i)>
{logica}
= <Ni : False : p.([]!!i)>
{rango vacio}
= 0

HI: cuantos.p.xs = <Ni : 0≤i<#xs : p.(xs!!i)>

Ci: 
cuantos.p.(x:xs) 
= <Ni : 0≤i<#x:xs : p.(x:xs!!i)>
{def de #}
= <Ni : 0≤i<#xs+1 : p.(x:xs!!i)>
{separo el <= y algebra}
= <Ni : 0=i ∨ 0<=i-1<#xs : p.(x:xs!!i)>
{particion de rango y cambio de variable j=i-1}
= <Ni : 0=i : p.(x:xs!!i)> + <Ni : 0<=j<#xs : p.(x:xs!!j+1)>
{rango unitario y def de !!}
= (p.(x:xs!!0)->1 [] ¬p.(x:xs!!0)->0) + <Ni : 0<=j<#xs : p.(xs!!j)>
{HI y def de !!}
= (p.(x)->1 [] ¬p.(x)->0) + cuantos.p.xs
{distributividad}
= (     p.(x)->1 + cuantos.p.xs 
    [] ¬p.(x)-> 0 + cuantos.p.xs) 

Resultado:
cuantos :: (a -> Bool) -> [a] -> Int
cuantos.p.[] = 0
cuantos.p.(x:xs) =  | p.(x) = 1 + cuantos.p.xs
                    | ¬p.(x) = 0 + cuantos.p.xs 
```

#### f)  
```haskell
busca.e.xs =<Min i: 0≤i<#xs ∧ xs!i=e : i>

busca.e.xs :: Num -> [Num] -> Num


CB:

busca.e.[] 
= <Min i: 0≤i<#[] ∧ []!i=e : i>
{def de #}
= <Min i: 0≤i<0 ∧ []=e : i>
{logica}
= <Min i: False ∧ []=e : i>
{absorvente de ∧}
= <Min i: False : i>
{rango vacio}
= ∞

HI: busca.e.xs = <Min i: 0≤i<#xs ∧ xs!i=e : i>

CI: 

busca.e.x:xs 
= <Min i: 0≤i<#x:xs ∧ x:xs!i=e : i>
{logica y particion del <=}
= <Min i: 0=i ∨ 0<i<#xs+1 ∧ x:xs!i=e : i>
{particion de rango y algebra}
= <Min i: 0=i ∧ x:xs!i=e : i> min <Min i: 0<=i-1<#xs ∧ x:xs!i=e : i>
{rango unitario  y condicion}
= (x=e->0 [] ¬x=e->∞) min <Min i: 0<=i-1<#xs ∧ x:xs!i=e : i>
{rango unitario y cambio de variable j=i-1}
= (x=e->0 [] ¬x=e->∞) min <Min j: 0<=j<#xs ∧ x:xs!j+1=e : j+1>
{def de !}
= (x=e->0 [] ¬x=e->∞) min <Min j: 0<=j<#xs ∧ xs!j=e : j+1>
{distri}
= (x=e->0 [] ¬x=e->∞) min <Min j: 0<=j<#xs ∧ xs!j=e : j> +1
{hi}
= (x=e->0 [] ¬x=e->∞) min busca.e.xs +1

Resultado
busca.e.xs :: Num -> [Num] -> Num
busca.e.[] := ∞
busca.e.x:xs := (x=e->0 [] ¬x=e->∞) min busca.e.xs +1

```

## EJ 4

#### a)  
```haskell

sumpot :: Num → Nat → Num 

computa la suma de potencias de un numero, esto es

sumpot.x.n = <∑i : 0≤i<n : x^i>

CB:
sumpot.x.0 
= <∑i : 0≤i<0 : x^i>
{logica}
= <∑i : False : x^i>
{rango vaico}
= 0

HI: sumpot.x.n = <∑i : 0≤i<n : x^i>

CI:

sumpot.x.n+1 
= <∑i : 0≤i<n+1 : x^i>
{algebra}
= <∑i : 0=i ∨ 0<i<n+1 : x^i>
{algebra}
= <∑i : 0=i ∨ 0<=i-1<n : x^i>
{particion de rango}
= <∑i : 0=i : x^i> + <∑i : 0<=i-1<n : x^i>
{rango unitario y cambio de variable}
= x^0 + <∑j : 0<=j<n : x^(j+1)>
{algebra}
= 1 + <∑j : 0<=j<n : x^j * x>
{distributividad y hi}
= 1 + sumpot.x.n * x

Resultado
sumpot :: Num → Nat → Num 
sumpot.x.0 := 0
sumpot.x.n+1 := 1 + sumpot.x.n * x
```

#### d)

decide si existe un elemento igual al producto de los elementos que le siguen:

```haskell

prodsuf :: [Num] -> Bool 
prodsuf.xs = <∃i : 0<i≤#xs : <Πj : 0≤j<#(xs↓i) : (xs↓i)!j> = xs!(i−1)>

CB: 
prodsuf.[] 
= <∃i : 0<i≤#[] : <Πj : 0≤j<#([]↓i) : ([]↓i)!j> = []!(i−1)>
{caso base de # y ↓ }
= <∃i : 0<i≤0 : <Πj : 0≤j<0 : []!j> = []!(i−1)>
{logica}
= <∃i : False : <Πj : 0≤j<0 : []!j> = []!(i−1)>
{rango vacio}
= False

HI: prodsuf.xs = <∃i : 0<i≤#xs : <Πj : 0≤j<#(xs↓i) : (xs↓i)!j> = xs!(i−1)>

CI:

prodsuf.x:xs 
= <∃i : 0<i≤#x:xs : <Πj : 0≤j<#(x:xs↓i) : (x:xs↓i)!j> = x:xs!(i−1)>

MODULARISO prod.i.xs
prod :: Num -> [Num] -> Num

CB:
prod i [] 
= <Πj : 0≤j<#([]↓i) : ([]↓i)!j>
{caso base de ↓ y #}
= <Πj : 0≤j<0 : []!j>
{logica}
= <Πj : False : []!j>
{rango vacio}
= 1

HI: prod i xs = <Πj : 0≤j<#(xs↓i) : (xs↓i)!j> 

CI:

prod i x:xs 
= <Πj : 0≤j<#(x:xs↓i) : (x:xs↓i)!j>

-- Caso i=0
= <Πj : 0≤j<#(x:xs↓0) : (x:xs↓0)!j>
{regla ↓}
= <Πj : 0≤j<#(x:xs) : (x:xs)!j>
{ci de # y  separo <=}
= <Πj : 0=j ∨ 0<j<#(xs)+1 : (x:xs)!j>
{particion de rango y aritmetica}
= <Πj : 0=j : (x:xs)!j> * <Πj : 0<=j-1<#(xs) : (x:xs)!j>
{cambio de variable y rango unitario}
= (x:xs)!0 * <Πu : 0<=u<#(xs) : (x:xs)!u+1>
{ci de ! }
= x * <Πu : 0<=u<#(xs) : (xs)!u>
{HI}
prod 0 (x:xs) = x * prod 0 xs

--caso i=(i+1)
= <Πj : 0≤j<#(x:xs↓(i+1)) : (x:xs↓(i+1))!j>
{ci de ↓}
= <Πj : 0≤j<#(xs↓i) : (xs↓i)!j>
{HI}
= prod (i+1) xs

Resultado
prod i [] = 1
prod 0 (x:xs) = x * prod 0 xs
prod (i+1) (x:xs) = prod i xs

SIGO DERIVANDO 

HI: prodsuf.xs = <∃i : 0<i≤#xs : prod.i.xs = xs!(i−1)>

CI:

prodsuf.x:xs 
= <∃i : 0<i≤#x:xs : prod.i.x:xs == x:xs!(i−1)>
{ci de #}
= <∃i : 0<i≤#xs+1 : prod.i.x:xs == x:xs!(i−1)>
{logica}
= <∃i : 1=i ∨ 1<i≤#xs+1 : prod.i.x:xs == x:xs!(i−1)>
{particion de rango}
= <∃i : 1=i : prod.i.x:xs == x:xs!(i−1)> ∧ <∃i : 1<i≤#xs+1 : prod.i.x:xs == x:xs!(i−1)>
{rango unitario}
= prod.1.x:xs == x:xs!(0)> ∨ <∃i : 1<i≤#xs+1 : prod.i.x:xs == x:xs!(i−1)>
{!0 y regla prod}
= (prod.0.xs == x) ∨ <∃i : 1<i≤#xs+1 : prod.i.x:xs == x:xs!(i−1)>
{algebra}
= (prod.0.xs == x) ∨ <∃i : 0<i-1≤#xs : prod.i.x:xs == x:xs!(i−1)>
{cambio de variable j=i-1}
= (prod.0.xs == x) ∨ <∃j : 0<j≤#xs : prod.(j+1).x:xs == x:xs!(j)>
{ci de prod}
= (prod.0.xs == x) ∨ <∃j : 0<j≤#xs : prod.j.xs == x:xs!(j)>
{sabemos que j!=0 por el rango, por lo que ! usa ci 2}
= (prod.0.xs == x) ∨ <∃j : 0<j≤#xs : prod.j.xs == xs!(j-1)>
{HI}
= (prod.0.xs == x) ∨ prodsuf.xs
xd

```



## EJ 5

Especificar formalmente utilizando cuantificadores 
cada una de las siguientes funciones descriptas informalmte

#### a)

determina si los elementos de una lista de tipo A 
son todos iguales entresı. Suponga que el operador = es la igualdad para el tipo A

```haskell
iguales :: [A] -> Bool
iguales xs := <∀i : 0<=i<#xs : xs!!i == xs!!0>
```

#### b)  

calcula el mınimo elemento de una lista no vacıa de enteros.
Nota:La funcion no debe devolver ±∞.

```haskell
minimo :: [Int] -> Int
minimo = <Ni : 0<=i<#xs : (<∀j : 0<=j<#xs : xs!!i<=xs!!j>) > 
ta mal si o si hacerlo con min
```

#### c) 

que determina si los elementos de una lista de enteros 
estan ordenados enforma creciente.

```haskell
creciente :: [Int]→Bool
creciete = <∀i : 0<=i<#xs-1 : <∀j : j=i+1 : xs!!i<=xs!!j> >

```

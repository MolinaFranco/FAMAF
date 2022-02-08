Final que desaprobe, primer intento de volver a hacerlo bien

## 1)

```haskell
f.xs = 〈Max as, bs, cs : xs = as ++ bs ++ cs ∧ as=cs : #as〉
```

#### a)

f calcula el largo maximo de un posible prefijo de xs, que sea igual a un sufijo de xs

#### b)

```haskell

Calcula f.[1, 2, 3, 4, 1, 2]

= 〈Max as, bs, cs : [1, 2, 3, 4, 1, 2] = as ++ bs ++ cs ∧ as=cs : #as〉

existen dos posibles formas de cumplir el rango y
 es planteando as, bs y cs de la siguiente forma

- [1, 2] ++ [3, 4] ++ [1, 2] 
- [] ++ [1, 2, 3, 4, 1, 2] ++ []

ahora resolvemos el termino con de la siguiente forma

#[1,2] = 2
#[] = 0

por ultimo el maximo es de los dos reusltados es 2

f.[1, 2, 3, 4, 1, 2] = 2
```

#### c)

```haskell

Deriva una funcion recursiva para f. 
(Ayuda: para generalizar considera que x:as = [x]++as).

- Para empezar a derivar trbajaremos con el caso base

CB: f.[]
    {def}
    = < Max as,bs,cs : [] = as++bs++cs ∧ as=cs : #as > 
    {logica de ++}
    = < Max as,bs,cs : as=[] ∧ bs=[] ∧ cs=[] : #as > 
    {rango unitario}
    = #[]
    {caso base de #}
    = 0

- Ahora laburaremos con el caso inductivo
- Primero planteamos nuestra hipotesis inductiva 

HI: f.xs = 〈Max as, bs, cs : xs = as ++ bs ++ cs ∧ as=cs : #as〉

CI: f.(x:xs)
    {def}
    = < Max as,bs,cs : (x:xs) = as++bs++cs ∧ as=cs : #as >
    {eliminacion de variable}
    = < Max as,bs : (x:xs) = as++bs++as : #as >
    {logica}
    = < Max as,bs : (x:xs) = as++bs++as ∧ (as=[] ∨ as!=[]) : #as >
    {distributividad y particion de rango}
    = < Max as,bs : (x:xs) = as++bs++as ∧ as=[] : #as > max < Max as,bs : (x:xs) = as++bs++as ∧ as!=[] : #as >
    {eliminacion de variable y logica de ++}
    = < Max bs : (x:xs)=bs : #[] > max < Max as,bs : (x:xs) = as++bs++as ∧ as!=[] : #as >
    {caso base de # y rango constante}
    = 0 max < Max as,bs : (x:xs) = as++bs++as ∧ as!=[] : #as >
    {cambio de variable de as->a:as (ya que as!=[])}
    = 0 max < Max a,as,bs : (x:xs) = (a:as)++bs++(a:as) : #(a:as) >
    {logica de ++}
    = 0 max < Max a,as,bs : (x:xs) = a:(as++bs++[a]++as) : #(a:as) >
    {logica y eliminacion de variable}
    = 0 max < Max as,bs : xs=(as++bs++[x]++as) : #(x:as) >
    {necesitamos generalizar}

    fgen.xs.hs = < Max as,bs : xs=(as++bs++hs++as) : #(hs++as) >
    
- Ahora volvemos a trabajaro con la generalizacion 

CB: fgen.[].hs 
    {def}
    = < Max as,bs : []=(as++bs++hs++as) : #(hs++as) >
    {logica}
    = < Max as,bs : []=as=bs=hs : #(hs++as) >
    {rango unitario y condicion y logica}
    = (hs=[] -> 0)[](hs!=[] -> -∞)

HIgen: fgen.xs.hs = < Max as,bs : xs=(as++bs++hs++as) : #(hs++as) >

CI: fgen.(x:xs).hs 
    {def}
    = < Max as,bs : (x:xs)=(as++bs++hs++as) : #(hs++as) >
    {logica}
    = < Max as,bs : (x:xs)=(as++bs++hs++as) ∧ (as=[] ∨ as!=[]) : #(hs++as) >
    {particion de rango y eliminacion de variable y logica de ++}
    = < Max bs : (x:xs)=(bs++hs) : #hs > max < Max as,bs : (x:xs) = as++bs++hs++as ∧ as!=[] : #(hs++as) >
    {cambio de variable de as->a:as + logica + eliminacion de variable}
    = < Max bs : (x:xs)=(bs++hs) : #hs > max < Max as,bs : xs = as++bs++(hs++[x])++as : #((hs++[x])++as) >
    {HIgen} 
    = < Max bs : (x:xs)=(bs++hs) : #hs > max fgen.xs.(hs++[x])
    {tercer excluido y particion de rango}
    = < Max bs : (x:xs)=(bs++hs) ∧ (bs=[]) : #hs > max < Max bs : (x:xs)=(bs++hs) ∧ (bs!=[]) : #hs > max fgen.xs.(hs++[x])
    {rango unitario y condicion}
    = (((x:xs)=hs -> #hs) [] ((x:xs)!=hs -> -∞)) max < Max bs : (x:xs)=(bs++hs) ∧ (bs!=[]) : #hs > max fgen.xs.(hs++[x])
    {cambio de variable bs->b:bs, logica }
    = (((x:xs)=hs -> #hs) [] ((x:xs)!=hs -> -∞)) max < Max b,bs : x=b ∧ xs=(bs++hs) : #hs > max fgen.xs.(hs++[x])
    {eliminacion de vairbale}
    = (((x:xs)=hs -> #hs) [] ((x:xs)!=hs -> -∞)) max < Max bs : xs=(bs++hs) : #hs > max fgen.xs.(hs++[x])
    {modularizo h.xs.hs = < Max bs : xs=(bs++hs) : #hs >}
    = (((x:xs)=hs -> #hs) [] ((x:xs)!=hs -> -∞)) max mod.xs.hs max fgen.xs.(hs++[x])

- Tengo que modularizar mod

HI: mod.xs.hs = < Max bs : xs=(bs++hs) : #hs >

CB: mod.[].hs 
    {def}
    = < Max bs : []=(bs++hs) : #hs >
    {logica de ++}
    = < Max bs : bs=[] ∧ hs=[] : #hs >
    {eliminacion de varibale y rango unitario y condicion}
    = (hs=[] -> #[])[](hs!=[] -> -∞)

CI: mod.(x:xs).hs 
    {def}
    = < Max bs : (x:xs)=(bs++hs) : #hs >
    {tercer excluido y particion de rango}
    = < Max bs : (x:xs)=(bs++hs) ∧ bs=[] : #hs > max < Max bs : (x:xs)=(bs++hs) ∧ bs!=[] : #hs >
    {rango unitario y condicion y cambio de variable bs->b:bs}
    = ((x:xs)=hs -> #hs)[]((x:xs)!=hs -> -∞) max < Max b,bs : (x:xs)=(b:bs++hs) : #hs >
    {logica y eliminacion de variable}
    = ((x:xs)=hs -> #hs)[]((x:xs)!=hs -> -∞) max < Max bs : xs=(bs++hs) : #hs >
    {HI}
    = ((x:xs)=hs -> #hs)[]((x:xs)!=hs -> -∞) max mod.xs.hs
 
Resultado:
fgen.[].hs =        (hs=[] -> 0)[](hs!=[] -> -∞)
fgen.(x:xs).hs =    (((x:xs)=hs -> #hs) [] ((x:xs)!=hs -> -∞)) max mod.xs.hs max fgen.xs.(hs++[x]) 
mod.[].hs =         (hs=[] -> #[])[](hs!=[] -> -∞)
mod.(x:xs).hs =     ((x:xs)=hs -> #hs)[]((x:xs)!=hs -> -∞) max mod.xs.hs


```

## 1.2)

dale loco lo haces

```haskell
f.xs = 〈Max as, bs, cs : xs = as ++ bs ++ cs ∧ as=cs : #as〉
```

#### a) 

Describi con tus palabras que calcula f.

f calcula la vantidad maxima de valores que puede tener un prefijo de xs que cumpla con ser igual al sufijo

#### b) 

Calcula f.[1, 2, 3, 4, 1, 2]

```haskell
f.xs = 〈Max as, bs, cs : xs = as ++ bs ++ cs ∧ as=cs : #as〉

primero planteare la funcion
f.[1, 2, 3, 4, 1, 2] = 〈Max as, bs, cs : [1, 2, 3, 4, 1, 2] = as ++ bs ++ cs ∧ as=cs : #as〉

ahora veo los posibles as,bs,cs tal que [1, 2, 3, 4, 1, 2] = as ++ bs ++ cs ∧ as=cs

[1, 2, 3, 4, 1, 2] = [] ++ [1, 2, 3, 4, 1, 2] ++ [] ∧ []=[]
[1, 2, 3, 4, 1, 2] = [1, 2] ++ [3, 4] ++ [1, 2] ∧ [1, 2]=[1, 2]

ahora teniendo el rango, calculamos los posibles terminos

#[1, 2] = 2
#[] = 0

como la funcion devuelve el maximo, el resultado es 2

```

#### c) 

Deriva una funcion recursiva para f. 
(Ayuda: para generalizar considera que x : as = [x]++ as)

para realizar esta derivacion utilizaremos induccion

```haskell

lo primero que hacemos es probar el caso base


CB: f.[] 
    = 〈Max as, bs, cs : [] = as ++ bs ++ cs ∧ as=cs : #as〉
    {por logica de la concatenacion}
    = 〈Max as, bs, cs : [] = as = bs = cs : #as〉
    {rango unitario}
    = #[]
    {caso base de #}
    = 0

ahora planteo la hipotesis y laburamos en el caso inductivo

HI: f.xs = 〈Max as, bs, cs : xs = as ++ bs ++ cs ∧ as=cs : #as〉

CI: f.(x:xs) 
    =〈Max as, bs, cs : (x:xs) = as ++ bs ++ cs ∧ as=cs : #as〉
    {eliminacion de variable}
    =〈Max as, bs : (x:xs) = as ++ bs ++ as : #as〉
    {tricotomia}
    =〈Max as, bs : (x:xs) = as ++ bs ++ as ∧ (as!=[] ∨ as=[]) : #as〉
    {particion de rangos y cambio de variable a->a:as y rango unitario}
    #[] max 〈Max a,as, bs : (x:xs) = a:as ++ bs ++ a:as : #a:as〉
    {caso base de # y logica}
    0 max 〈Max a,as, bs : x=a ∧ xs = as ++ bs ++ a:as : #a:as〉
    {eliminacion de variable y recomendacion}
    0 max 〈Max as, bs : xs = as ++ bs ++ [x] ++ as : #h:as〉
    para continuar necesitamos generalizar

fGen.x.h = 〈Max as, bs : xs = as ++ bs ++ [h] ++ as : # h:as〉

volvemos a realizar el procedimiento 

CB: fGen.[].h
    = 〈Max as, bs : [] = as ++ bs ++ [h] ++ as : # h:as〉
    {logica}
    = 〈Max as, bs : [] = as = bs = [h] : # h:as〉
    {rango unitario y condicion}
    = (h=[] => #h)[](h!=[] => -∞)

HI: fGen.xs.h = 〈Max as, bs : xs = as ++ bs ++ [h] ++ as : # h:as〉

CI: fGen.(x:xs).h 
    = 〈Max as, bs : (x:xs) = as ++ bs ++ [h] ++ as : # h:as〉
    {tricotomia}
    = 〈Max as, bs : (x:xs) = as ++ bs ++ [h] ++ as ∧ (as=[] ∨ as!=[]): # h:as〉
    {particion de rango, cambio de variable a->a:as y eliminacion de bariable}
    = 〈Max bs : (x:xs) = [] ++ bs ++ [h] ++ [] : # h:[]〉max〈Max a,as, bs : (x:xs) = (a:as) ++ bs ++ [h] ++ (a:as) : # h:a:as〉
    {logica y tricotomia}
    = 〈Max bs : (x:xs) = bs ++ [h] ∧ (bs=[] ∨ bs!=[]): # h〉max〈Max a,as, bs : x=a ∧ xs = as ++ bs ++ [h] ++ (a:as) : # h:a:as〉
    {eliminacion de variable y particion de rango}
    = 〈Max bs : (x:xs) = bs ++ [h] ∧ bs=[] : # h〉max 〈Max bs : (x:xs) = bs ++ [h] ∧ bs!=[] : # h〉max〈Max as, bs : xs = as ++ bs ++ [h] ++ (x:as) : # h:x:as〉
    {logica y cambio de bariable bs->(b:bs) y rango unitario y condicion}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max 〈Max b,bs : (x:xs) = (b:bs) ++ [h] : #h〉max〈Max as, bs : xs = as ++ bs ++ [h:x] ++ as) : #(h:x):as〉
    {HI y logica}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max 〈Max b,bs : x=b ∧ xs=bs++[h] : #h〉max fGen.xs.(h:x)
    {eliminacion de variable}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max 〈Max bs : xs= bs++[h] : #h〉max fGen.xs.(h:x)
    {utilizo la modularizacion que hice en la otra pagina}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max mod.xs.h max fGen.xs.(h:x)
    

HI: mod.xs.h = 〈Max bs : xs = bs++[h] : #h〉

CB: mod.[].h 
    {esf}
    = 〈Max bs : [] = bs++[h] : #h〉
    {logica}
    = 〈Max bs : bs=[] ∧ h=[] : #h〉
    {rango unitario y condicion}
    = (h=[]=>#h)[](h!=[]=>-∞)

CI: mod.(x:xs).h 
    {esp}
    = 〈Max bs : (x:xs) = bs++[h] : #h〉
    {tricotomia y particion de rango}
    = 〈Max bs : (x:xs) = bs++[h] ∧ bs=[] : #h〉max〈Max bs : (x:xs) = bs++[h] ∧ bs!=[] : #h〉
    {logica, rango unitario con condicion, cambio de variable bs=>b:bs}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max〈Max b,bs : (x:xs) = (b:bs)++[h] : #h〉
    {logica}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max〈Max b,bs : (x=b) ∧ xs = bs++[h] : #h〉
    {eliminacion de variable y HI}
    = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max mod.xs.h


resultado:

mod.[].h = (h=[]=>#h)[](h!=[]=>-∞)
mod.(x:xs).h = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max mod.xs.h 
fGen.[].h = (h=[] => #h)[](h!=[] => -∞)
fGen.(x:xs).h = ((x:xs)=[h] => #h)[]((x:xs)!=[h] => -∞) max mod.xs.h max fGen.xs.(h:x)

yo solito papaaaaa voy a matar o convertirme en un dios

```



## 2)

Considera el problema especificado de la siguiente manera:

```haskell
Const M : Int ;
Var A : array [0, M ) of Int , n : Int ;
{M ≥0}
S
{n = 〈N i : 0 ≤i ≤M : 〈∑j : i ≤j < M : A.j 〉< i 〉}
```

#### a) 
Calcula el resultado para A = [3, −1, 1, −1] usando la especificacion.
Justifica, enumerando todos los elementos del rango del existencial.

```haskell
A : array [0, 4)
n = 〈Ni : i E [0,1,2,3,4] : 〈∑j : i≤j<4 : [3, −1, 1, −1].j 〉< i 〉

n = 〈Ni : i=0 : 〈∑j : 0≤j<4 : [3, −1, 1, −1].j 〉< 0 〉
n = 〈Ni : i=1 : 〈∑j : 1≤j<4 : [3, −1, 1, −1].j 〉< 1 〉
n = 〈Ni : i=2 : 〈∑j : 2≤j<4 : [3, −1, 1, −1].j 〉< 2 〉
n = 〈Ni : i=3 : 〈∑j : 3≤j<4 : [3, −1, 1, −1].j 〉< 3 〉
n = 〈Ni : i=4 : 〈∑j : 4≤j<4 : [3, −1, 1, −1].j 〉< 4 〉

n = 〈Ni : i=0 : 2 < 0 〉
n = 〈Ni : i=0 : -1 < 1 〉
n = 〈Ni : i=0 : 0 < 2 〉
n = 〈Ni : i=0 : -1 < 3 〉
n = 〈Ni : i=0 : 0 < 4 〉

n=4

```

#### b) 
Explica con tus palabras que debe calcular este programa.

Este programa calcula la cantidad de veces que la suma de los valores de los posibles prefijos es menor a la posicion del primer valor del prefijo

#### c) 
Deriva un programa imperativo que resuelva este problema. El programa debe recorrer una
sola vez el arreglo (sin ciclos anidados). Ayuda: Para encontrar el invariante conviene
reemplazar la constante 0

```haskell

planteo lo que sabemos

Const M : Int ;
Var A : array [0, M) of Int , n : Int ;
{M≥0}
S
{n = 〈Ni : 0<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉}

ahora como sabemos que tendremos que recorrer el Arrary planteamos la necesidad de un ciclo y una inicializacion de variantes

planteo todo esto

Const M : Int ;
Var A : array [0, M) of Int , n : Int ;
{M ≥0}
S0
{I}
do(B)->
    {I ∧ B}
    S1
    {I}
od
{n = 〈Ni : 0<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉}

planteo la invariante con un cambio de constante por variable como nos dan la recomendacion
y de esto podemos decucir B y la cota y que savemos que esta variante tendra que ir creciendo hasta encontrarse con la constante M

{I : n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=m<=M }
B = (m!=0)
t = (m)

planteamos todo lo que sabemos hasta ahora


Const M : Int ;
Var A : array [0, M) of Int , n : Int , m : Int ;
{M≥0}
S0
{I : n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=m<=M}
do(m!=0)->
    {I ∧ B ∧ m=T}
    S1
    {I m<T}
od
{n = 〈Ni : 0<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉∧ 0<=m<=M }

ahora derivaremos el cuerpo del ciclo
primero planteamos una asignacion a nuestras viables y con la invariante, cota y guarda, laburaremos en las triada (en este paso tmb comprovaremos nuestra cota)

planteo la asignacion y ademas sabemos que m tendra que ir decreciendo 

{n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉∧ 0<=m<=M ∧ m!=0 ∧ m=T} 
    m,n=m-1,F
{I ∧ m<T}

tomo la primera como HI y laburo en la WP de la asignacion

WP.{n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉∧ 0<=m<=M ∧ (M-m)<T}(m,n=m-1,F)
{asigno y def de T}
{F = 〈Ni : m-1<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉∧ 0<=m-1<=M ∧ (m-1)<m}
{logica y algebra, (0<=m<=M ∧ m!=0 => 0<m<=M) }
{F = 〈Ni : m-1<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉}
{logica y particiond e rango}
{F = 〈Ni : m-1=i : 〈∑j : i<=j<M : A.j〉< i 〉+〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉}
{ranog unitario, logica y HI y distributividad}
{F = (〈∑j : m-1<=j<M : A.j〉< m-1)=>1+n[] (〈∑j : m-1<=j<M : A.j〉>= m-1)=>n}

necesitamos fortalecer la invariante con una nueva variable para poder continuar
saco la expresion con la que voy a fortalecer y la laburo un poco mas

k =〈∑j : m-1<=j<M : A.j〉
{logica y particion de rango}
k =〈∑j : m-1=j : A.j〉+〈∑j : m-1<j<M : A.j〉
{ranog unitario y logica}
k = A.(m-1)+〈∑j : m<=j<M : A.j〉

ahora con esto fortaleceremos la exprecion


{I' : n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=m<=M ∧ k=〈∑j : m<=j<M : A.j〉}

planteo de nuevo la trica para laburar 

{n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉∧ 0<=m<=M ∧ k =〈∑j : m<=j<M : A.j〉∧ m!=0 ∧ m=T} 
    m,n,k=m-1,F,S
{I' ∧ m<T}

laburo en la wp de la asignacion y adelnato los pasos ya laburados 

{F = (〈∑j : m-1<=j<M : A.j〉< m-1)=>1+n[] (〈∑j : m-1<=j<M : A.j〉>= m-1)=>n}
{agrego el laburo extra que hicimos}
{F = ( A.(m-1)+〈∑j : m<=j<M : A.j〉 < m-1)=>1[] ( A.(m-1)+〈∑j : m<=j<M : A.j〉 >= m-1)=>0 + n ∧ S =〈∑j : (m-1)<=j<M : A.j〉}
{nueva HI de k}
{F = ( A.(m-1)+k < m-1)=>1+n[] ( A.(m-1)+k >= m-1)=>n ∧ S =〈∑j : (m-1)<=j<M : A.j〉}

para trabajar mas prolijo seguiremos laburando con la def de S

S =〈∑j : m-1<=j<M : A.j〉
{logica y particion de ranfo}
S =〈∑j : m-1=j : A.j〉 + 〈∑j : m-1<j<M : A.j〉
{rango unitario y algebra y HI}
S = A.(m-1) + k

planteo la asignacion con una condifion que nos determino la definion de F y el resto de resultados

{I' ∧ m!=0 ∧ m=T} 
    if(A.(m-1)+k < m-1)->
        m,n,k = m-1, n+1, A.(m-1)+k
    elif(A.(m-1)+k >= m-1)->
        m,n,k = m-1, n, A.(m-1) + k
{I' ∧ m<T}

ahora nos queda derivar la inicializacion para terminar
ademas sabemos que m debe ser inicializado en su mayor variante para ir disminuyendo

{M≥0}
    m,n,k=M,F,S
{n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=m<=M ∧ k=〈∑j : m<=j<M : A.j}

tomo la primera expresion como HI y laburo en la WP de la asignacion
WP.{n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=m<=M ∧ k=〈∑j : m<=j<M : A.j}(m,n,k=M,F,S)
{asigno}
{F = 〈Ni : M<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=M<=M ∧ S =〈∑j : m<=j<M : A.j}
{por HI y logica}
{F = 〈Ni : i=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ True ∧ S =〈∑j : False : A.j}
{rango unitario y condicion y rango vacio}
{F = (〈∑j : False : A.j〉< M)=>1 [] (〈∑j : False : A.j〉< M)=>0  ∧ S = 0}
{rango vacio}
{F = (0<M)=>1 [] (0>=M)=>0  ∧ S = 0}

planteo el programa completo con la inicializacion
en la cual tenemos una condicion definida por el resultado de F

Const M : Int ;
Var A : array [0, M) of Int , n : Int , m : Int ;
{M≥0}
if(0<M)=>
    m,n,k=M,1,0
elif(0>=M)=>
    m,n,k=M,0,0
{I': n = 〈Ni : m<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉 ∧ 0<=m<=M ∧ k=〈∑j : m<=j<M : A.j}
do(m!=0)->
    {I' ∧ m!=0 ∧ m=T} 
    if(A.(m-1)+k < m-1)->
        m,n,k = m-1, n+1, A.(m-1)+k
    elif(A.(m-1)+k >= m-1)->
        m,n,k = m-1, n, A.(m-1) + k
{I' ∧ m<T}
od
{n = 〈Ni : 0<=i<=M : 〈∑j : i<=j<M : A.j〉< i 〉∧ 0<=m<=M }




```




## 3)
Especificar con pre y post condicion el siguiente problema. Declarar constantes y variables. No derivar.

#### a) 
Dado un arreglo de al menos 2 elementos, decidir (calcular) si hay dos elementos consecutivos cuya diferencia sea menor a una constante K.

Const M : Int,
Array A : [0,M),
Var r : Bool,
Const K : Int, 
{M>=2}
S1
{r=<∃i,j : 0<=i<j<M ∧ j=i+1 : (A.i max A.j) - (A.i min A.j)>}

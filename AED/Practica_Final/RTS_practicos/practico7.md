
## EJ1 

Sea N≥0.

#### a)

Derivar un programa que calcule 
el menor entero x que satisface x3+x ≥ N 

```haskell

para empezar planteo la terna por la informacion dada

{0<=N}
S1;
{N<=x³+x ∧ <∀a : 0<=a<x : N>a³+a >}

es evidente que se necesita un ciclo para ir probando hasta encontrar la menor x

Planteo la invariante y la guarda 
FeaI = { <∀a : N<=a³+a : x<=a > ∧ 0<=x<=N }

I = { <∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N }
B = { N>x³+x }
¬B = { N<=x³+x }

de esta forma aseguramos que I ∧ ¬B => Q


como Q no implica I necesito una incializacion tal que

{0<=N}
x:=E
{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N }

donde {0<=N}=>wp.(x:=E){<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N }

tomo Q por hipotesis y laburo en el resto

wp.(x:=E){<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N }
{utilizo la wp de la asignacion}
{<∀a : 0<=a<E : N>a³+a > ∧ 0<=E<=N }
{separo}
{<∀a : 0<=a<E : N>a³+a > ∧ (0=E ∨ 0<E<=N) }
{como por hipotesis 0<=N }
{<∀a : 0<=a<E : N>a³+a > ∧ (0=E) }
{planteo E=0}
{<∀a : 0<=a<0 : N>a³+a > ∧ (0=0) }
{rango vacio y logica}
True


quedando todo

{0<=N}
x:=0
{I: <∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N }
do(N>x³+x)->
    {I ∧ B} 
    S1; 
    {I} 
od
{N<=x³+x ∧ <∀a : 0<=a<x : N>a³+a >}

Planteo una cota candidata que cumpla con
I ∧ B ⇒ t ≥ 0

{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N>x³+x} => N-x ≥ 0

por invariable N siempre va a ser mayor igual que x por lo que esto es True

ahora derivamos la terna con S1 comenzando con una asignacion ya que gracias a nuestra cota sabemos que x tiene que  crecer

{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N>x³+x} 
x = x+1
{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N} 

{uso la obligacion de prueba de la asignacion para probar esto
 y agrego la cota para comprobar que disminuye}

{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N>x³+x ∧ N-x=T} =>
{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N-x<T}(x = x+1)

tomo lo primero como hipotesis y calculo la wp

wp.{<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N-x<T}(x = x+1)
{asigno}
<∀a : 0<=a<x+1 : N>a³+a > ∧ 0<=x+1<=N ∧ N-x+1<T
{logica}
<∀a : 0<=a<=x : N>a³+a > ∧ 0<=x+1<=N ∧ True
{hipotesis N>x³+x ∧ 0<=x<=N}
{como todas las x entre 0 y N cumplen eso
las a entre 0 y x tmb lo cumplen}
True ∧ 0<=x+1<=N 
{por HI tenemos que N>x³+x por lo que podemos definir que N>x}
{como N>x ∧ 0<=x<=N => 0<=x<N }
True




Planteo el programa entero

{0<=N}
x:=0
{I: <∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N }
do(N>x³+x)->
    {<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N>x³+x ∧ N-x=T} 
    x = x+1; 
    {<∀a : 0<=a<x : N>a³+a > ∧ 0<=x<=N ∧ N-x<T} 
od
{N<=x³+x ∧ <∀a : 0<=a<x : N>a³+a >}



```

#### b)

```haskell

Derivar un programa que calcule 
el mayor entero x que satisface x3 + x ≤N

- para empezar a plantear necesito un P y Q q aseguren esto
{0<=N}
S1
{x³+x<=N ∧ <∀a : x<a<=N : a³+a>N >}
- necesitaremos un ciclo para ir probando cada x
- de nuestra Q separamos lo que utilizaremos para encontrar nuestra I y B planteo un invariante
{I: <∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N}
- como P ! => Q necesito inicializar las variables
{0<=N}
x:=E
{I: <∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N}
- tomo P como hipotesis y laburo con la WP de la asignacion
wp.{<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N}(x:=E)
{asignacion}
<∀a : E<a<=N : a³+a>N > ∧ 0<=E<=N
{planteo E=N}
<∀a : N<a<=N : a³+a>N > ∧ 0<=N<=N
{por rango vacio y HI }
True
- ahora a base de nuestr Q planteo una B tal que I ∧ ¬B => Q
{¬B ∧ <∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N} => {x³+x<=N ∧ <∀a : x<a<=N : a³+a>N >}
- planteo ¬B = x³+x<=N
- por lo que B = x³+x>N
- con esto aseguramos que I ∧ ¬B => Q
- ahora como sabemos que x decrecera hasta encontrar el valor necesario y por invariante siempre es mayor igual q 0
- encuentro la cota t = x 
I ∧ B ⇒ t ≥ 0
<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N ∧ x³+x>N => x>=0
{por HI 0<=x<=N por lo que x>=0 es True}
{devilitamiento}
True
- como mi cota es valida, dedusco que x tiene que ir decreciendo por lo que planteo una asignacion que cumpla con esto y derivo la terna
{<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N ∧ x³+x>N ∧ x=T}
    x:=x-1
{<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N ∧ x<T}
- tomo lo primero como hipotesis y laburo en la wp de la asignacion
wp.{<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N ∧ x<T}(x:=x-1)
{asigno}
<∀a : x-1<a<=N : a³+a>N > ∧ 0<=x-1<=N ∧ x-1<T
{definicion de x=T}
<∀a : x-1<a<=N : a³+a>N > ∧ 1<=x<N ∧ True
{por HI 0<=x<=N por lo que 1<=x<N es True}
<∀a : x-1<a<=N : a³+a>N > ∧ True ∧ True
<∀a : x<=a<=N : a³+a>N > ∧ True ∧ True
{   por HI 0<=x<=N ∧ x³+x>N
    con esto savemos que todas las x entre 0 y N cumplen x³+x>N
    por lo que le planteamiento de que todas las a entre x<=a<=N tambien lo cumplen
}
True
- con esto comprobamos que la cota disminuye y que el cuerpo del ciclo es valido

- planteo lo obtenido
{0<=N}
x:=N
{I: <∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N}
do (x³+x>N) ->
    {<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N ∧ x³+x>N ∧ x=T}
    x:=x-1
    {<∀a : x<a<=N : a³+a>N > ∧ 0<=x<=N ∧ x<T}
od
{x³+x<=N ∧ <∀a : x<a<=N : a³+a>N >}

```

## EJ2

(Suma de los elementos de un arreglo) 
Dado un arreglo de enteros, especificar y derivar un
programa que calcule la suma de todos los elementos del arreglo

```haskell

Sum.xs = <Σi : 0<=i<#xs :  >

```


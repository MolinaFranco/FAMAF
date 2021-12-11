## 1)

Var x,r,y : Int;
r,y ≔ 0,1;
do y < x →
  r,y≔r+1,y*2
od;
y≔y-x

σ₀ = (x→20,r→21,y→22).
σ1 = (x→20,r→0,y→1).
σ2 = (x→20,r→1,y→2).
σ3 = (x→20,r→2,y→4).
σ4 = (x→20,r→3,y→8).
σ5 = (x→20,r→4,y→16).
σ6 = (x→20,r→5,y→32).
σ7 = (x→20,r→5,y→12).

## 2)

```haskell

Const N: Int, A: array [0,N) of Num;
Var sum: Num ;
{True}
   S
{ sum = 〈 Σ i : 0 ≤ i < N  : A.i 〉 }

```

¿Cómo modificarías la poscondiciòn para indicar que 

en la variable sum esté la sumatoria de los elementos que ocurran en posiciones pares

en el arreglo? (Elegí todas las respuestas correctas aunque te resulten redundantes)

## 3)
```haskell

sum.A.p.q = 〈 Σ i : p≤i<q : A.i 〉 

satisface la propiedad 

sum.A.(p-1).q = sum.A.p.q+A.(p-1) si 0<p<q

Const N: Int, A: Array[0,N) of Int;
Var r,u,n : Int;

{ N>0 }
r, u, n ≔ 0,0,N;
{ INV : r = 〈 N p : n ≤ p < N : sum.A.p.q = 2 〉 ∧ 0≤n≤N ∧ u = sum.A.n.N }
do n≠0 →
    u ≔ u+A.(n-1);
    { R1 }
    if u=2 →
        r ≔ r+1
    [] u≠2 →
       skip
    fi ;
    { R2 }
    n ≔ n-1
od
{ r = 〈 N p : 0 ≤ p < N : sum.A.p.N = 2 〉 }

```

#### a)
```haskell
{ INV ∧ B } u ≔ u+A.(n-1) { u = sum.A.n.N }

{ r = 〈 N p : n ≤ p < N : sum.A.p.q.N = 2 〉 ∧ 0≤n≤N ∧ u = sum.A.n.N ∧ n≠0 }
u ≔ u+A.(n-1)
{ u = sum.A.n.N }

{ r = 〈 N p : n ≤ p < N : sum.A.p.q.N = 2 〉 ∧ 0≤n≤N ∧ u = sum.A.n.N ∧ n≠0 }
=>

sum.A.(n-1).N = sum.A.n.N+A.(n-1) si 0<n<N

{ sum.A.n.N+A.(n-1) = sum.A.n.N }

```

#### d)
```haskell

{ INV ∧ B } u ≔ u+A.(n-1) { u = sum.A.(n-1).N }

{r = 〈 N p : n ≤ p < N : sum.A.p.q = 2 〉 ∧ 0≤n≤N ∧ u = sum.A.n.N ∧ n≠0}
u ≔ u+A.(n-1)
{ u = sum.A.(n-1).N }

{ u+A.(n-1) = sum.A.(n-1).N }

{ sum.A.n.N+A.(n-1) = sum.A.(n-1).N }

[[sum.A.(p-1).q = sum.A.p.q+A.(p-1) si 0<p<q  0<n<N]]

{ sum.A.(n-1).N = sum.A.n.N+A.(n-1)  }

```

## 5)

```haskell

Considerá la función f que calcula el k-ésimo ítem de la n-ésima fila del triángulo de Pascal:

f.n.0=1
f.n.(k+1) = (f.n.k * (n - k)) / (k+1)

Se quiere construir un programa que calcule en r el K-ésimo ítem de la N-ésima fila:

Const N,K : Int;
Var r : Int;
{ N > 0 ∧ 0 ≤ K ≤ N }
S
{ r = f.N.K }

- tengo una funcion recursiva en f por lo que planteo un ciclo.
- uso la formula dada para plantear el invariante y ademas lo fortalezco para poder usar el reemplazo de constante.
- ademas planteo la guarda con el caso base de la funcion dada

I === {r = (f.n.k * (N - k)) / (k+1) ∧ 0<=k<=N}

B === (k!=0)

- De esta manera queda garantizado INV ∧ ¬ B ⇒ Q.

{r = (f.n.k * (N - k)) / (k+1) ∧ 0<=k<=N} ∧ k=0 => { r = f.N.K }
{r = (f.n.0 * (N - k)) / (k+1) ∧ 0<=0<=N} => { r = f.N.K }
{r = ( (N - k)) / (k+1) ∧ 0<=N} => { r = f.N.K }

- El programa me queda algo como:

Const N,K : Int;
Var r : Int;
{ N > 0 ∧ 0 ≤ K ≤ N }
  S0 ;
{ INV }
    do (k<0) →  
        { INV ∧ B } 
        S1
        { INV }
    od
{ r = f.N.K }

```

## 6)

```haskell

Considerando que 2^i no es una expresión del lenguaje de programación, derivá el programa y respondé:

Const N: Int, A: Array[0,N) of Int;
Var r : Bool;
{ N ≥ 0 }
S
{ r = 〈 ∀ i : 0 ≤ i < N : A.(N - (i + 1)) ≤ 2^i 〉 }

- como tengo que recorrer el array planteo un ciclo
- Usamos la técnica de reemplazo de constante por variable para plantear el siguiente invariante
- 

    I ≡ {r = 〈 ∀i : 0≤i<n : A.(n-i-1) ≤ 2^i 〉 ∧ 0<=n<=N}
	B ≡ n!=N

- De esta manera queda garantizado INV ∧ ¬ B ⇒ Q. 
- El programa será de la siguiente forma

{ N ≥ 0 }
 n:=E ;
{ INV }
  do ( n!=N ) →  
    { INV ∧ B } 
    S1;
    { INV }
  od
{ r = 〈 ∀ i : 0 ≤ i < N : A.(N - (i + 1)) ≤ 2^i 〉 }

- Cuerpo del ciclo

- Planteo una cota donde sabemos que n va a crecer dentro del programa y t>=0

 cota = N-n

- Vamos a probar con una asignación para S1: r, n := E, n+1. Supongamos la hip. INV ∧ B ∧ t=N-n, y veamos la wp:

    wp.(r, n := E, n+1).INV
    === { def. wp }
    E = 〈 ∀i : 0≤i<n+1 : A.((n+1)-i) ≤ 2^i 〉 ∧ 0<=n+1<=N ∧ t<N-n+1
    === { definicion de t en hipo; 0≤n+1 ya que 0≤n; y  n+1≤N ya que n≤N y n≠N}
    E = 〈 ∀i : 0≤i<n+1 : A.(n-i) ≤ 2^i 〉 ∧ t<t+1
    === { t<t+1 por logica es true}
    E = 〈 ∀i : 0≤i<n+1 : A.(n-i) ≤ 2^i 〉
    === { partición de rango y rango unitario }
    E = 〈 ∀i : 0≤i<n : A.(n-i) ≤ 2^i 〉 ∧ A.(0) ≤ 2^n

- Acá me trabo porque la potencia no es parte de mis expresiones válidas. 
- Para esto hago fortalecimiento:

	INV’ ≡  INV  ∧  pot = 2^n

- INV’ ∧ ¬ B ⇒ Q sigue valiendo ya que INV’ ∧ ¬ B ⇒ INV ∧ ¬ B    y     INV ∧ ¬ B ⇒ Q.

- Cuerpo del ciclo de nuevo: 
- S1 ahora va a ser de la forma: r, pot, n := E, P, n + 1.
- Hipótesis: INV’ ∧ B. Vemos wp:

    wp.(r, pot, n := E, P, n+1).INV
    === { def. wp para := }
    E = 〈 ∀i : 0≤i<n+1 : A.((n+1)-i) ≤ 2^i 〉 ∧  pot = 2^(n+1) ∧ 0<=n+1<=N ∧ t<N-n+1
    === {trabajo los mismo pasos que antes}
    E = 〈 ∀i : 0≤i<n : A.(n-i) ≤ 2^i 〉 ∧ A.(0) ≤ 2^n ∧ pot = 2^(n+1)
    === { hipo nueva y prop de potenciacion}
    E = (〈 ∀i : 0≤i<n : A.(n-i) ≤ pot 〉 ∧ A.(0) ≤ pot) ∧ (pot = 2^(n) * 2)
    === {elijo E y pot}



- Inicializacion
- S0 va a ser de la forma “r, pot, n := E, P, 0”. 
- Suponemos la hip. P, y veamos la wp:
  
    wp.(r, fac, n := E, P, 0).INV’
    === { def. wp para := }
    E = 〈 ∀i : 0≤i<0 : A.(0-i-1) ≤ 2^i 〉 ∧ 0<=N ∧ P = 2^0
    === {rango vacío, elijo E = True,  y más pasos elijo P = 1}
    True



    



```









```

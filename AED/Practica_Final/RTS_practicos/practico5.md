## EJ1

```haskell

Escriba dos programas distintos que calculen la sumatoria desde 1 hasta N , donde N>0 es una constante de tipo Int. Uno de ellos debe usar un ciclo y el otro debe basarse en la expresion

〈∑i : 1<=i<=n : i 〉= n ∗(n + 1)/2

Var N,r : Int;
{N > 0}
r := 0 ;
do N!=0 →
    r,N = r+N , N-1
od
{True}

Var N : Int;
{N > 0}
r := N ∗ (N + 1)/2;
{True}

Para N = 3, escriba las tablas de estados de la ejecuci ́on de cada programa.

lıneas  | nombre del estado | estado/guardas    | aclaracion       
        | σ0                |  N->3             | inicio
 l1     | σ1                |  N->3  r->0       | inicializacion
 l2     |                   |  (3!=0)=True      | evaluo guarda de ciclo
 l3     | σ2                |  N->2  r->3       | asignacion
 l2     |                   |  (2!=0)=True      | evaluo guarda de ciclo
 l3     | σ3                |  N->1  r->5       | asignacion
 l2     |                   |  (1!=0)=True      | evaluo guarda de ciclo
 l3     | σ4                |  N->0  r->6       | asignacion
 l2     |                   |  (0!=0)=False     | evaluo guarda de ciclo
        | σ4                |  N->0  r->6       | estado final


¿El valor final de las variables depende de su valor inicial?

El vaor de N esta destinado a ser 0 y el valor de r depende de el estado inicial de N

```

el 2 es igual al 1 

el 4,5 lo haces mentalmente

2 y 6 no hacen falta ponele


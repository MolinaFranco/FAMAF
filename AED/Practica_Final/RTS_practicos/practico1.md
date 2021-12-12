## Ejercicio 1

####
<details>
<summary>A,B,C,D</summary>

```haskell

Considera la siguiente listacasosCba = listC = [133,147,137,144,162,150,205] de nuevos casos de Covid enla provincia de Cordoba para la semana del 3/8/2020 al 9/8/2020.

a.¿Hubo algun dia que hubo menos de 144 casos?
< ∃i : 0<=i<#listC : listC!!i<144 >

b.¿Cada dıa tuvo mas casos que el dıa anterior?
< ∀i : 0<=i<(#listC-1) ∧ j=i+1 : listC!!i < listC!!j >

c.¿Hay dos dıas que hubo menos de 135 casos?
< ∃i,j : 0<=i<#listC ∧ 0<=j<#listC ∧ i!=j : listC!!i<135 ∧ listC!!j<135 >

c. como el hijo de mil puta de pagano
< ∃i,j : 0<=i<#listC ∧ 0<=j<#listC ∧ i!=j  : listC!!i<135 ∧ listC!!j<135 ∧ <∀k : 0<=k<#listC ∧ i!=j!=k : listC!!k>135  >  >


d.Considerando que Santa Fe tuvo el siguiente registrocasosSfe = regSF = [63,101,101,141,134,137,87]. 
¿Es el maximo para Santa Fe menor a todos los registros de Cordoba?
< ∀i : 0<i<=#listC :  (<Max j : 0<j<=#regSF : listC!!j>) < (listC!!i) >

```

## Ejercicio 2

####
<details>
<summary> A,B,C,D </summary>

```haskell
a.<∀i : 0≤i<#xs : xs!i>140>
todo elemento de xs es mayor a 140

b.<∃i : 0≤i<#xs : xs!i=x>
Existe un elemento de xs con valor igual a su posicion

c.<∀i : 0≤i<#xs : <∃j:0≤j<#ys:xs!i=ys!j> >
Para todo elemento de xs existe un elemento de ys con el mismo valor

d.<∀i : 0≤i<#xs−1 : xs!i≤xs! (i+ 1)>
Todo elemento de xs es es seguido por un elemento mayor o igual

```
</details>

## Ejercicio 3

####
<details>
<summary> B </summary>

```haskell
Evalua las formulas anteriores con xs= [141,134,137,87] y xs= [133,147,137,144]. 
Para los incisos b. y c., considera x= 134 e ys= [137,141,87], respectivamente.

<∃i : 0≤i<#xs : xs!i=x>
{x= 134 ∧ xs= [141,134,137,87]}
<∃i : 0≤i<#[141,134,137,87] : [141,134,137,87]!i=134>
{calculo #[141,134,137,87]}
<∃i : 0≤i<4 : [141,134,137,87]!i=134>
{evaluo los posibles i}
<∃i : ie{0,1,2,3} : [141,134,137,87]!i=134>
{evaluo las indexiones}
141=134 ∨ 134=134 ∨ 137=134 ∨ 87=134 
{logica}
False ∨ True ∨ False ∨ False
{elemento neutro del ∨} 
True 

```
</details>

## Ejercicio 6

Decidı el tipo de cada variable y de cada una de las expresiones en lenguaje natural. Luego escribı una expresion formal para cada una de ellas.

####
<details>
<summary> A-F </summary>

```haskell

Decidı el tipo de cada variable y de cada una de las expresiones en lenguaje natural. Luego escribı una expresion formal para cada una de ellas.

a.m es la cantidad de mas contagios diarios en el registrocasos.
m = int
registrocasos = [int]
m = <MAX i : 0<=i<#registocasos : i!!registocasos>

b.La posicion de la list xs donde esta su mayor elemento. (Para discutir en clase)

xs = [int]
<Min i : 0<=i<#xs : <∀j : 0<=j<#xs ∧ i!=j : (xs!!i>xs!!j)> >


c.La suma de los elementos de xs entre i e i+ 7.
xs = [int]
i = int

x = <Σj : i<=j<i+7 : j>

d.Los casos del dıa d son mayores al promedio movil (promedio de los siete dıas anteriores a d).


e.La suma de los elementos en posici ́on par de xs.
<Σi : (0<=i<#xs) ∧ (par.i) : xs!!i>

f.nes potencia de 2.

```
</details>




 
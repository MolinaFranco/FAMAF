# 1.
```haskell
ham.xs.ys = <Ni: 0 <= i < #xs min #ys : xs!i != ys!i>
```

## a)
```haskell
ham :: String -> String -> Int
```

## b)
    para derivar ham, primero derivaria el caso base con ys=[] luego con xs=[], luego plantearia la hipotesis inductiva que es la especificacion dada y por ultimo derivaria un caso inductivo con xs = x:xs y ys = y:ys

## c)
```haskell
ham."come"."toma" = <Ni: 0 <= 4 min 4 : xs!i != ys!i>
ham."come"."toma" = 2
```

## d)
Caso -> ys = []
```haskell
CB: ham.xs.[]
    {esp}	
    <Ni: 0 <= i < #xs min #[] : xs!i != []!i>
    {caso base de # y !}
    <Ni: 0 <= i < #xs min 0 : xs!i != []>
    {caso base de min}
    <Ni: 0 <= i < 0 : xs!i != []>
    {algebra}
    <Ni: False : xs!i != []>
    {rango vacio}
    0
```
Caso -> xs = []
```haskell
CB: ham.[].ys
    {esp}	
    <Ni: 0 <= i < #[] min #ys : []!i != ys!i>
    {caso base de # y !}
    <Ni: 0 <= i < 0 min #ys : [] != ys!i>
    {caso base de min}
    <Ni: 0 <= i < 0 : [] != ys!i>
    {algebra}
    <Ni: False : [] != ys!i>
    {rango vacio}
    0
```

## e)

```haskell
HI: ham.xs.ys = <Ni: 0 <= #xs min #ys : xs!i != ys!i>

CI: ham.(x:xs).(y:ys)
    {esp}
    <Ni: 0 <= #(x:xs) min #(y:ys) : (x:xs)!i != (y:ys)!i>
    {def. de #}
    <Ni: 0 <= #xs+1 min #ys+1 : (x:xs)!i != (y:ys)!i>
    {distributividad del min}
    <Ni: 0 <= 1+(#xs min #ys) : (x:xs)!i != (y:ys)!i>
    {logica}
    <Ni: i=0 ∨ (1<=i< (1+ (#xs min #ys))) : (x:xs)!i != (y:ys)!i>
    {algebra}
    <Ni: i=0 ∨ (0<=i-1< (#xs min #ys)) : (x:xs)!i != (y:ys)!i>
    {particion de rango}
    <Ni: i=0 : (x:xs)!i != (y:ys)!i> + <Ni: (0<=i-1< (#xs min #ys)) : (x:xs)!i != (y:ys)!i>
    {rango unitario y remplazo variable j = i-1}
    (x:xs)!0 != (y:ys)!0 + <Nj: (0<=j< (#xs min #ys)) : (x:xs)!j+1 != (y:ys)!j+1>
    {caso base de ! y caso induc. de !}
    (x != y -> 1
    ¬x != y -> 0) + <Nj: 0<=j< (#xs min #ys) : (xs)!j != (ys)!j>
    {HI}
    (x != y -> 1
    ¬x != y -> 0) + ham.xs.ys
    {distributividad}
    (x != y -> 1 + ham.xs.ys
    ¬x != y -> ham.xs.ys) 
```

## f)

```haskell
ham."toma"."come" 
ham.(t:oma).(c:ome) 
1+ ham.(o:ma).(o:me)
1 + ham.(m:a).(m:e)
1 + ham.(a:[]).(e:[])
1 + 1+ ham.([]).([])
1 + 1 + 0
2 
```

# 2.
```haskell
pj.xs= <∃as,bs : xs=as++bs : sum.as=sum.bs>
```

## a)
    No por que sum es parte del lenguaje

## b)
    ns = [1,2]

```haskell
pj. [1,2]
<∃ as,bs : [1,2]=[1]++[2] : sum.[1]=sum.[2]>
<∃ as,bs : [1,2]=[1]++[2] : False>
False
```

## c)
    ms = [2,2,2,2]
    ms satisfase la segunda condicion ya que se puede partir de forma que as=[2,2] y bs=[2,2]
    donde la sumatoria de los dos dan el mismo resultado

## d)
```haskell
HI: pj.xs= <∃as,bs : xs=as++bs : sum.as=sum.bs>

CI: pj.(x:xs)
    {esp}
    <∃as,bs : (x:xs)=as++bs : sum.as=sum.bs>
    {particion de rango as=[] ∨ as!=[]}
    <∃as,bs : as=[] ∧ (x:xs)=as++bs : sum.as=sum.bs> ∨ <∃as,bs : as!=[] ∧ (x:xs)=as++bs : sum.as=sum.bs>
    {logica y eliminacion de variable}
    <∃as,bs : (x:xs)=[]++bs : sum.[]=sum.bs> ∨ <∃as,bs : (x:xs)=(a:as)++bs : sum.(a:as)=sum.bs>
    {caso base de ++ y logica y caso base de sum}
    <∃as,bs : (x:xs)=bs : 0 = sum.bs> ∨ <∃as,bs : (x:xs)=(a:as)++bs : sum.(a:as)=sum.bs>
    {rango unitario y caso induc de ++}
    0 = sum.(x:xs) ∨ <∃as,bs : (x:xs)= a:(as++bs) : sum.(a:as)=sum.bs>
    {logica y caso iduc de sum}
    0 = sum.(x:xs) ∨ <∃as,bs : (x=a) ∧ (xs=(as++bs)) : a + sum.as=sum.bs>
    {eliminacion de variable}
    0 = sum.(x:xs) ∨ <∃as,bs : (xs=as++bs) : x + sum.as=sum.bs>
    {generalizacion}

HI: pj.xs.k= <∃as,bs : xs=as++bs : k + sum.as=sum.bs>

CB: pj.[].k
    {esp}
    <∃as,bs : []=as++bs : k + sum.as=sum.bs>
    {propiedad de ++}
    <∃as,bs : []=as ∧ []=bs : k + sum.as=sum.bs>
    {rango unitario}
    k + sum.[] =sum.[]
    {caso base de sum}
    k + 0 = 0
    {aritmetica}
    k = 0

CI: pj.(x:xs).k
    {esp}
    <∃as,bs : (x:xs)=as++bs : k + sum.as=sum.bs>
    {particion de rango as=[] ∨ as!=[]}
    <∃as,bs : as=[] ∧ (x:xs)=as++bs : k + sum.as=sum.bs> ∨ <∃as,bs : as!=[] ∧ (x:xs)=as++bs : k + sum.as=sum.bs>
    {logica y eliminacion de variable}
    <∃as,bs : (x:xs)=[]++bs : k + sum.[]=sum.bs> ∨ <∃as,bs : (x:xs)=(a:as)++bs : sum.(a:as)=sum.bs>
    {caso base de ++ y logica y caso base de sum}
    <∃as,bs : (x:xs)=bs : k + 0 = sum.bs> ∨ <∃as,bs : (x:xs)=(a:as)++bs : k + sum.(a:as)=sum.bs>
    {rango unitario y caso induc de ++}
    k = sum.(x:xs) ∨ <∃as,bs : (x:xs)= a:(as++bs) : k + sum.(a:as)=sum.bs>
    {logica y caso iduc de sum}
    k = sum.(x:xs) ∨ <∃as,bs : (x=a) ∧ (xs=(as++bs)) : k + a + sum.as=sum.bs>
    {eliminacion de variable}
    k = sum.(x:xs) ∨ <∃as,bs : (xs=as++bs) : k + x + sum.as=sum.bs>
    {HI}
    k = sum.(x:xs) ∨ pj.xs.(k+x)
```

# 3.

## 1)

```haskell

creciente.xs = <∀a,b,cs : xs=a:b:cs : a<b > 
creciente.xs = <Ai : 0<= i < #xs-1 : xs!i < xs!(i+1)>

credecre.es = <E as, bs : es=as++bs : creciente.as ∧ decreciente.bs>
```

## 2)

```haskell
nin.xs.p = <∀i : 0<=i<#xs : ¬p.(xs!i)>
```

## 3)

```haskell
sumPrim. 
```

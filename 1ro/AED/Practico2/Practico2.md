# 1.

```haskell
sum : [Num]→Num
sum.[ ].= 0
sum.(x:xs).=x+sum.xs
```

- a. suma todos los num de una lista
- b. <Si : 0<=i<#xs : xs!!i>
- c.

```haskell
CB: sum.[] = <Si : 0<=i<=0 : xs!!i>
    sum.[] = <Si : 0 : i>
    sum.[] = 0

HI: sum.xs = <Si : 0<=i<=#xs : xs!!i>

CI: sum.x:xs = <Si : 0<=i<=#x:xs : xs!!i>
    ={Caso recursivo de sum}
    x+sum.xs = <Si : 0<=i<=#x:xs : xs!!i>
    ={HI}
    x + <Si : 0<=i<=#xs : xs!!i> = <Si : 0<=i<=#x:xs : xs!!i>
    ={}
    x + <Si : 0<=i<=#xs : xs!!i> = <Si : 0<=i<=#x:xs : xs!!i>
```

# 2.

### a)

```haskell
sum_cuad xs = <Σi : 0 ≤ i < #xs : xs!!i * xs!!i>
```

### Derivación

```haskell
CB: sum_cuad [] = <Σi : 0 ≤ i < #[] : []!!i * []!!i>
    sum_cuad [] = <Σi : false : []!!i * []!!i>
    sum_cuad [] = 0

HI: sum_cuad ks = <Σi : 0 ≤ i < #ks : ks!!i * ks!!i>

CI: sum_cuad (k:ks) = <Σi : 0 ≤ i < #(k:ks) : (k:ks)!!i * (k:ks)!!i>
    ={Lógica}
    <Σi : i = 0 V 1 ≤ i < #(k:ks) : (k:ks)!!i * (k:ks)!!i>
    ={Partición de rango}
    <Σi : i = 0 : (k:ks)!!i * (k:ks)!!i> + <Σi : 1 ≤ i < #(k:ks) : (k:ks)!!i * (k:ks)!!i>
    ={Rango unitario}
    (k:ks)!!0 * (k:ks)!!0 + <Σi : 1 ≤ i < #(k:ks) : (k:ks)!!i * (k:ks)!!i>
    ={Definición de !!}
    k*k + <Σi : 1 ≤ i < #(k:ks) : (k:ks)!!i * (k:ks)!!i>
    ={Def de cardinal}
    k*k + <Σi : 1 ≤ i < 1 + #(ks) : (k:ks)!!i * (k:ks)!!i>
    ={Cambio de variable}
    k*k + <Σj : 1 ≤ (j+1) < 1 + #(ks) : (k:ks)!!(j+1) * (k:ks)!!(j+1)>
    ={Compatibilidad de la suma y el orden}
    k*k + <Σj : 0 ≤ j < #(ks) : (k:ks)!!(j+1) * (k:ks)!!(j+1)>
    ={Definición de !!}
    k*k + <Σj : 0 ≤ j < #(ks) : ks!!j * :ks!!j>
    ={Hipótesis}
    k*k + sum_cuad ks

```

### b)

```haskell
iga e xs = <Ai : 0 <= i < #xs : xs!!i = e>
```

### Derivación

```haskell
CB: iga e [] = <Ai : 0 <= i < #[] : []!!i = e>
    ={logica}
    <∀i : 0 <= i < 0 : []!!i = e>
    ={tricotomia}
    <∀i : False : []!!i = e>
    ={rango falso}
    True

HI: iga e xs = <∀i : 0 <= i < #xs : xs!!i = e>

CI: iga e (x:xs) = <∀i : 0 <= i < #(x:xs) : (x:xs)!i = e>
    ={logica, definicion de #}
    <∀i : 0=i ∧ 1<=i < 1+#xs : (x:xs)!!i = e>
    ={particion de rango}
    <∀i : 0=i : (x:xs)!!i = e> ∧ <∀i : 1<=i<1+#xs : (x:xs)!!i = e>
    ={rango unitario y inecuacion}
    (x:xs)!!0 = e ∧ <∀i : 0<=i-1<#xs : (x:xs)!!i = e>
    ={definicion de !! y cambio de variable}
    (x = e) ∧ <∀i : 0<=j<#xs : (x:xs)!!j+1 = e>
    ={definicion de !!}
    (x = e) ∧ <∀i : 0<=j<#xs : xs!!j = e>
    ={HI}
    (x = e) ∧ iga e xs
```
 

### c)

```haskell
exp.x.n=x^n
```

### Derivación

```haskell
CB: exp.x.0=x^0
    ={potencia a la 0}
    exp.x.0=1

HI: exp.x.n=xn

CI: exp.x.(n+1)=x^(n+1)
    ={aritmetica}
    x*x^(n)
    ={HI}
    x * exp.x.n
```

### d)

```haskell
sumPar.n = <∑i : 0<=i<=n ∧ par.i : i>

par.i = i mod 2 = 0
```

### Derivación

```haskell
CB: sumPar.0 = <∑i : 0<=i<=0 ∧ par.i : i>
    {logica}
    sumPar.0 = <∑i : (i=0) ∧ par.i : i>
    {logica -> 0 no es par}
    sumPar.0 = <∑i : False : i>
    {Rango vacio}
    0

HI: sumPar.n = <∑i : 0<=i<=n ∧ par.i : i>

CI: sumPar.(n+1) = <∑i : 0<=i<=(n+1) ∧ par.i : i>
    {una sola variable natural}
    = <∑i : (0<=i<=n ∨ i=n+1) ∧ par.i : i>
    {distributiva}
    = <∑i : (0<=i<=n ∧ par.i) ∨ (i=n+1 ∧ par.i) : i>
    {particion de rango}
    = <∑i : (0<=i<=n ∧ par.i) : i>   +   <∑i : (i=n+1 ∧ par.i) : i>
    {HI}
    = sumPar.n + <∑i : i=n+1 ∧ par.i : i>
    {anidado}
    = sumPar.n + <∑i : i=n+1 : <∑i : par.i : i>>
    {Rango unitario}
    = sumPar.n + <∑n+1 : par.n+1 : n+1>
    {logica}
    = sumPar.n + par.n+1
```

### e)

```haskell
cuantos.p.xs = < Ni: 0≤i<#xs : p.(xs!i) >

p.x = (
    p.((x:xs)!0) = 1
    ¬p.((x:xs)!0) = 0
)

```

### Derivación

```haskell
CB: cuantos.p.[]
    {esp}
    < Ni: 0≤i<#[] : p.(xs!i) >
    {caso base de #}
    < Ni: 0≤i<0 : p.(xs!i) >
    {logica}
    < Ni: False : p.(xs!i) >
    {rango vacio}
    0

HI: cuantos.p.xs = < Ni : 0≤i<#xs : p.(xs!i) >

CI: cuantos.p.(x:xs)
    {esp}
    < Ni : 0≤i<#(x:xs) : p.((x:xs)!i) >
    {logica}
    < Ni : 0≤i<#xs+1  : p.((x:xs)!i) >
    {Rangos con una sola variable natural}
    < Ni : i=0 ∨ 1≤i<#xs+1  : p.((x:xs)!i) >
    {particion de rango}
    < Ni : i=0 : p.((x:xs)!i) > + < Ni : 1≤i<#xs+1 : p.((x:xs)!i) >
    {Rango unitario}
    p.x + < Ni : 1≤i<#xs+1 : p.((x:xs)!i) >
    {logica}
    p.x + < Ni : 0≤i-1<#xs : p.(x:xs!i) >
    {cambio de variable j = i-1}
    p.x + < Nj : 0≤j<#xs : p.(x:xs!j+1) >
    {logica}
    p.x + < Nj : 0≤j<#xs : p.(xs!j) >
    {HI}
    p.x + cuantos.p.xs

```

### f)

```haskell
busca.e.xs= < Min i : 0≤i <#xs∧xs!i=e : i >

aux = ( (x:xs)!0=e -> 0
     ¬(x:xs)!0=e -> ∞
     )

```

### Derivación

```haskell
CB: busca.e.[] 
    {esp}
    < Min i : 0≤i<#[] ∧ []!i=e : i >
    {caso base de #}
    < Min i : 0≤i<0 ∧ []!i=e : i >
    {logica}
    < Min i : False ∧ []!i=e : i >
    {absorbente de la conjuncion}
    < Min i : False : i >
    {rango vacio}
    ∞

HI: busca.e.xs= < Min i : 0≤i <#xs∧xs!i=e : i >

CI: busca.e.(x:xs)
    {esp}
    < Min i : 0≤i<#(x:xs) ∧ (x:xs)!i=e : i >
    {logica}
    < Min i : 0≤i<#xs+1 ∧ (x:xs)!i=e : i >
    { Rangos con una sola variable natural }
    < Min i : (i=0 ∨ 1≤i<#xs+1) ∧ (x:xs)!i=e : i >
    {inecuacion}
    < Min i : (i=0 ∨ 0≤i-1<#xs) ∧ (x:xs)!i=e : i >
    {distributiva}
    < Min i : (i=0 ∧ (x:xs)!i=e) ∨ (0≤i-1<#xs ∧ (x:xs)!i=e) : i >
    {particion de rango}
    < Min i : i=0 ∧ (x:xs)!i=e : i > min < Min i : 0≤i-1<#xs ∧ (x:xs)!i=e : i >
    {rango unitario y condicion}
    p.x min < Min i : 0≤i-1<#xs ∧ (x:xs)!i=e : i >
    {cambio de variable j = i-1}
    p.x min < Min i : 0≤j<#xs ∧ (x:xs)!j+1=e : i >
    {logica}
    p.x min < Min i : 0≤j<#xs ∧ (xs)!j=e : i >
    {HI}
    p.x min busca.e.xs

```



### Practica Parcial

La lista xs de numeros enteros tiene la misma cantidad de elementos pares e impares (bal.xs)


```haskell

bal.xs = <Ni : 0<i<=#xs : par.(xs!i) > == <Nj : 0<j<=#xs : ¬par.(xs!j) >


bal :: [int] -> Bool

CB: bal.[]
    {esp}
    < N i : 0 ≤ i < #[] : par.([]!i) > == < N j : 0 ≤ j < #[] : ¬par.([]!j) >
    {caso base de #}
    < N i : 0 ≤ i < 0 : par.([]!i) > == < N j : False : ¬par.([]!j) >
    {aritmetica}
    < N i : False : par.([]!i) > == < N j : False : ¬par.([]!j) >
    {Rango vacio}
    0 == 0
    {reflex del igual}
    True

HI: bal.xs = <Ni : 0<i<=#xs : par.(xs!i) > == <Nj : 0<j<=#xs : ¬par.(xs!j) >

CI: bal.(x:xs)
    (esp)
    <Ni : 0<i<=#(x:xs) : par.((x:xs)!i) > == <Nj : 0<j<=#(x:xs) : ¬par.((x:xs)!j) >
    {logica}
    <Ni : 0<i<=#xs+1 : par.((x:xs)!i) > == <Nj : 0<j<=#xs+1 : ¬par.((x:xs)!j) >
    {Rangos con una sola variable natural}
    <Ni : 0=i ∨ 1<i<=#xs+1 : par.((x:xs)!i) > == <Nj : 0=1 ∨ 1<j<=#xs+1 : ¬par.((x:xs)!j) >
    <particion de rango>
    <Ni : 0=i : par.((x:xs)!i) > + <Ni : 1<i<=#xs+1 : par.((x:xs)!i) > == <Nj : 1<j<=#xs+1 : ¬par.((x:xs)!j) > + <Nj : 0=1 : ¬par.((x:xs)!j) >
    (rango unitario)
    par.((x:xs)!0) + <Ni : 1<i<=#xs+1 : par.((x:xs)!i) > == <Nj : 1<j<=#xs+1 : ¬par.((x:xs)!j) > + ¬par.((x:xs)!0)
    {aritmetica}
    par.((x:xs)!0) + <Ni : 0<i-1<=#xs : par.((x:xs)!i) > == <Nj : 0<j-1<=#xs : ¬par.((x:xs)!j) > + ¬par.((x:xs)!0)
    {cambio de variable}
    par.((x:xs)!0) + <Ni : 0<k<=#xs : par.((x:xs)!k+1) > == <Nj : 0<n<=#xs : ¬par.((x:xs)!n+1) > + ¬par.((x:xs)!0)
    {logica}
    par.((x:xs)!0) + <Ni : 0<k<=#xs : par.((xs)!k) > == <Nj : 0<n<=#xs : ¬par.((xs)!n) > + ¬par.((x:xs)!0)
    {HI}
    par.((x:xs)!0) + bal.xs + ¬par.((x:xs)!0)

```


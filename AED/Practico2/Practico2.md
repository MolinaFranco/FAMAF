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

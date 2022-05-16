ecoGen :: Eq a => [a] -> [a] -> Bool
ecoGen [] ys = False
ecoGen (x:xs) ys | xs == ys++[x] = True
                 | otherwise = ecoGen xs (ys ++ [x])

-- p.xs = 〈 Π i : 0 ≤ i < #xs ∧ primo.(xs!i) : xs!i 〉

〈 Σ i : 0 ≤ i < 51 ∧ impar.(i+1)  : (5) * i 〉 

2,4,6,8

el cambio de variable f.j≐j*2

〈 ∀ i, j : 5 ≤ i < j ≤ 2 : (i + j) mod 2 = 0  〉 

y considerando N = 2 y M = 5,

quant : Nat → Nat especificada como

quant.n = 〈Ni : 0≤i≤n : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉
quant.n = 〈Ni : 0≤i≤n : px.i 〉

quant.(n+1) 
{esp}
〈Ni : 0≤i≤(n+1) : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉
{div}
〈Ni : i=0 ∨ 1≤i≤(n+1) : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉

〈Ni : i=0 ∨ 0≤i-1≤n : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉

〈Ni : j+1=0 ∨ 0≤j≤n : ¬〈∃x,y : 2≤x≤j+1  ∧  2≤y≤j+1 : x*y=j+1 〉 〉

〈Ni : j+1=0 ∨ 0≤j≤n : px.j+1〉

〈Ni : j+1=0 : px.j+1〉 + 〈Ni : 0≤j≤n : px.j+1〉

px.0 + 〈Nj : 0≤j≤n : ¬〈∃x,y : 1≤x-1≤j  ∧  1≤y-1≤j : x*y=j+1 〉〉


quant.0 
{esp}
〈Ni : 0≤i≤0 : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉

〈Ni : i=0 : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉

〈Ni : i=0 : ¬〈∃x,y : 2≤x≤i  ∧  2≤y≤i : x*y=i 〉 〉


unoAlMedio.xs = < ∃ as,bs : xs=as++[1]++bs : #as = #bs >

unoAlMedio.(x:[]) = < ∃ as,bs : (x)=as++[1]++bs : #as = #bs >
                    < ∃ as,bs : (x)=[1] : #as = #bs >
                    x=1

unoAlMedio.(x‣(y‣ys)) = < ∃ as,bs : xs=as++[1]++bs : #as = #bs >

unoAlMedio.(x:xs) = < ∃ as,bs : (x:xs)=as++[1]++bs : #as = #bs >

< ∃ as,bs : (x:xs)=as++[1]++bs : #as = #bs >
{as = [] }















unoAlMedioGen.xs.cs = 〈 ∃ as, bs : xs=as++cs++bs : #as = #bs 〉















hGen.xs.n.m = 〈N as, bs : xs = as ++ bs : n + sum.as = 2 * (#as + m)  〉


hGen.(x:xs).n.m =〈N as, bs : xs = as ++ bs : n + sum.(x:as) = 2 * (#(x:as) + m) 〉
{def de sum y #}
hGen.(x:xs).n.m =〈N as, bs : xs = as ++ bs : n + x + sum.(as) = 2 * (1 + #(as) + m) 〉

hGen.(x:xs).n.m =〈N as, bs : xs = as ++ bs : (n+x) + sum.(as) = 2 * (#(as) + (m+1)) 〉

hGen.(x:xs).n.m = hGen.xs.(n+x).(m+1)

〈 Σ i : 0 ≤ i < 51 ∧ impar.(i+1)  : (2+3) * i 〉
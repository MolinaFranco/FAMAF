-- Molina Franco 44192153

-- 1)  Programa las siguientes funciones:

-- a. 
esCero :: Int -> Bool
esCero x    | x==0 = True
            | otherwise = False

-- b.
esPositivo :: Int -> Bool
esPositivo x = x>=0

-- c.
esVocal :: Char -> Bool
esVocal x = elem x ['a','e','i','o','u']

-- 2) Programa las siguientes funciones usando recursion o composicion:

-- a.
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) | x==True = paratodo xs
                | otherwise = False

-- b.
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- c.
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- d.
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial x-1

-- e.
promedio :: [Int] -> Int
promedio [] = 0
promedio xs = div (sumatoria xs ) (length xs)

-- 3) Programa la funcionpertenece

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece y (x:xs)  | y == x = True
                    | otherwise = pertenece y xs

-- 4) Programa las siguientes funciones que implementan los cuantificadores generales. Nota queel segundo parametro de cada funcion, es otra funcion!

-- a.
paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] f = True
paraTodo' (x:xs) f = f x && paraTodo' xs f

-- b.
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] f = False
existe' (x:xs) f    | f x = True
                    | otherwise = existe' xs f
                
-- c.
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f = (f x) + sumatoria' xs f

-- d.
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] f = 1
productoria' (x:xs) f = (f x) * productoria' xs f

-- 5) Definı nuevamente la funcionparatodo, pero esta vez usando la funcionparatodo(sinrecursion ni analisis por casos!)

paraTodo2 :: [Bool] -> Bool
paraTodo2 (xs) = paraTodo' xs (==True)

-- 6) Utilizando las funciones del ejercicio 4, programa las siguientes funciones por composicion, sin usar recursion ni analisis por casos.

-- a.
todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs (\x -> (mod x 2) ==0) 

-- b.
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo y xs = existe' xs (\x -> (mod x y) ==0)

-- c.
sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0..x] (^2)

-- d.
factorial' :: Int -> Int
factorial' x = productoria [0..x]

-- e. 
multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria (filter even xs) 

-- 7) Indaga sobre las funcionesmap y filter

-- a.
-- filter :: (a -> Bool) -> [a] -> [a]
-- filtra una lista de elementos basado en una condicion. 
-- ej: filter (<=10) [1,10,20,30] = [1,10]

-- map :: (a -> b) -> [a] -> [b]
-- aplica una funcion a cada elemento de una lista. 
-- ej: map (+2) [1,2,3] = [3,4,5]

-- b. 
-- map (+1) [1,-4,6,2,-8]

-- c.
-- filter (>=0) [1,-4,6,2,-8]

-- 8) Programa una funcion que dada una lista de n ́umerosxs, devuelve la lista que resulta deduplicar cada valor de xs.

-- a.
duplicar :: [Int] -> [Int]
duplicar (x:xs) = (x*2) : duplicar xs

-- b.
duplicar' :: [Int] -> [Int]
duplicar' xs = map (*2) xs


-- 9) Program ́a una funci ́on que dada una lista de n ́umerosxs, calcula una lista que tiene comoelementos aquellos n ́umeros de xs que son pares

-- a.
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs)    | mod x 2 == 0 = x : pares xs
                | otherwise = pares xs

-- b. 
pares2 :: [Int] -> [Int]
pares2 xs = filter even xs

-- c.
-- ya lo hice con filter 

multiplicaPares' :: [Int] -> Int
multiplicaPares' xs = productoria (pares xs)

-- 10) 

-- a.
primIgualesA :: Int -> [Int] -> [Int]
primIgualesA _ [] = []
primIgualesA y (x:xs)   | y == x = x: primIgualesA y xs
                        | otherwise = []

-- b.
primIgualesA' :: Int -> [Int] -> [Int]
primIgualesA' _ [] = []
primIgualesA' y xs = takeWhile (==y) xs

-- 11)

-- a.
primIguales :: [Int] -> [Int]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:xs)  | x==(head(xs)) = x: primIguales xs
                    | otherwise = [x]

-- b.
primIguales' :: [Int] -> [Int]
primIguales' [] = []
primIguales' xs = primIgualesA (head(xs)) xs

-- 12)

{-

a)  f :: (a, b) -> ...
    f x = ...

    Esta bien tipado
    (a, b) es una tupla
    cubre con todos los casos de definición

b)  f :: (a, b) -> ...
    f (x , y) = ...

    Esta bien tipado
    (a, b) es una tupla 
    cubre con todos los casos de definición

c)  f :: [(a, b)] -> ...
    f (a , b) = ...

    Esta mal tipado por que recibe una lista de tuplas [(a, b)] 
    y el caso es para una tupla (a , b)

d)  f :: [(a, b)] -> ...
    f (x:xs) = ...

    Esta bien tipado
    [(a, b)] es una lista de tuplas
    x es una tupla
    xs es una lista de tuplas
    No cubre con el caso vacio _ 

e)  f :: [(a, b)] -> ...
    f ((x, y) : ((a, b) : xs)) = ...

    Esta bien tipado
    [(a, b)] es una lista de tuplas
    (x, y) y (a, b) son tuplas
    ((x, y) : ((a, b) : xs)) es una lista de tuplas con al menos dos elementos
    xs es una lista de tuplas
    No cubre cuando la lista de tumplas tiene un solo elemento
        ni cubre con el caso de la lista vacia

f)  f :: [(Int, a)] -> ...
    f [(0, a)] = ...

    Esta bien tipado
    [(Int, a)] es una lista de tuplas de tipo (Int, a)
    (Int, a) es una tupla con el primer elem. de tipo Int 
    [(0, a)] es una lista de tuplas donde el primer elemento es 0
    No cubre con los casos donde el primer elemento de la tupla es distinto a 0   
        ni con el caso vacio

g)  f :: [(Int, a)] -> ...
    f ((x, 1) : xs) = ...

    Esta bien tipado
    [(Int, a)] es una lista de tuplas de tipo (Int, a)
    (Int, a) es una tupla donde el primer elem. es Int
    (x, 1) es una tuplas donde el segundo elemento es 1
    xs es una lista de tuplas
    No cubre con el caso donde el segundo elemento de la primera tupla la lista es distnito a 1
        ni con el caso vacio

h)  f :: [(Int, a)] -> ...
    f ((1, x) : xs) = ...

    Esta bien tipado
    [(Int, a)] es una lista de tuplas de tipo (Int, a)
    (Int, a) es una tupla donde el primer elem. es Int 
    (1, x) es una tuplas donde el primer elemento es 1
    xs es una lista de tuplas
    No cubre el caso donde el primer elemento de la tupla no sea 1
        ni con el caso vacio
    

i)  f :: (Int -> Int) -> Int -> ...
    f a b = ...

    Esta bien tipado
    a es una funcion de tipo (Int -> Int)
    b es un entero
    Cubre todos los casos


j)  f :: (Int -> Int) -> Int -> ...
    f a 3 = ...

    Esta bien tipado 
    a es una funcion de tipo (Int -> Int)
    3 es un entero
    No cubre el caso donde el segundo elemento no sea 3
        ni donde el segundo elemento es vacio

k)  f :: (Int -> Int) -> Int -> ...
    f 0 1 2 = ...

    Esta mal tipado
    Recibe una funcion y se hace pattern matching con 0 en su lugar
    Ademas recibe una funcion y un Int y en el pattern matching pone el caso de recibir 3 numeros

l)  f :: a -> (a -> a) -> ...
    f a g = ...

    Esta bien tipado
    a es una variable de tipo a
    g es una funcion de tipo (a -> a)
    Cumple todos los casos

-}

-- 13)

{-

a)  f :: (a, b) -> b
    f (x,y) = y

b)  f :: (a, b) -> c

    No se puede ya que para retornar un tipo distinto a (a, b) tenemos que tener mas informacion o alguna funcion

c)  f :: a -> b

    No se puede ya que para retornar un tipo distinto a "a" tenemos que tener mas informacion o alguna funcion

d)  f :: (a -> b) -> a -> b
    f x y = (x y)   

e)  f :: (a -> b) -> [a] -> [b]
    f x y = [(x y)] 

f)  f :: (a -> b) -> a -> c
    f x y = z 

g)  f :: (a -> b) -> (b -> c) -> a -> c
    f x y z = y (x z)

-}

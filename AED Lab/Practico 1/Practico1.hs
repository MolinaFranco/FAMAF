-- Eje 1 

esCero :: Int -> Bool
esCero x    | x==0 = True
            | otherwise = False

esPositivo :: Int -> Bool
esPositivo x = x>=0

esVocal :: Char -> Bool
esVocal x = elem x ['a','e','i','o','u']

-- Eje 2

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) | x==True = paratodo xs
                | otherwise = False

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 0
productoria (x:xs) = x * productoria xs

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial x-1

promedio :: [Int] -> Int
promedio [] = 0
promedio xs = div (sumatoria xs ) (length xs)

-- Eje 3

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece y (x:xs)  | y == x = True
                    | otherwise = pertenece y xs

-- Eje 4

paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] f = True
paraTodo' (x:xs) f = f x && paraTodo' xs f

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] f = False
existe' (x:xs) f    | f x = True
                    | otherwise = existe' xs f
                





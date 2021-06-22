concat :: [[a]] -> [a]
concat  [] = []
concat (xs:xss) = xs ++ concat xss

++ :: [a] -> [a] -> [a]
++ [] ys = ys
++ (x:xs) ys = x:(xs ++ ys)

HIPÓTESIS INDUCTIVA:    
concat (xss ++ yss) = (concat xss) ++ (concat yss)
 
CASO BASE:
concat ( [] ++ []) = (concat []) ++ (concat [])
concat [] = [] ++ []
[] = []

CASO INDUCTIVO:
concat (xs:xss ++ yss) = (concat xs:xss) ++ (concat yss)
concat (xs:(xss ++ yss)) = xs ++ (concat xss) ++ (concat yss)
concat (xs:(xss ++ yss)) = xs ++ concat (xss ++ yss)
xs ++ concat (xss ++ yss) = xs ++ concat (xss ++ yss)


-- -------------------------------------------------------------------------------


sumar1 :: [Int] -> [Int]
sumar1 [] = []                      (1)
sumar1 (x:xs) = x+1: sumar1 xs      (2)

sum1 :: [Int] -> Int
sum1 [] = 0                         (3)
sum1 (x:xs) = x + sum1 xs           (4)

length :: [a] -> Int
length [] = 0                       (5)
length (x:xs) = 1 + length xs       (6)

HIPOTESIS INDUCTIVA
sum1 (sumar1 xs) = sum1 (xs) + length (xs)

CASO BASE
sum1 (sumar1 []) = sum1 [] + length []
sum1 [] = 0 + 0  -- 1, 3, 5
0 = 0 -- reflectividad del igual

CASO INDUCTIVO

sum1 (sumar1 x:xs) = sum1 (x:xs) + length (x:xs)
sum1 ((x+1):sumar1 xs) = x + sum1 xs + 1 + lenght xs
sum1 ((x+1):sumar1 xs) = x + 1 + sum1 xs + lenght xs        -- HIPOTESIS INDUCTIVA 
(x + 1) + sum1 (sumar1 xs) = (x + 1) + sum1 (sumar1 xs) 


-- -------------------------------------------------------------------------------

duplica :: [Int] -> [Int]
duplica [] = []                     (1)
duplica (x:xs) = (x*2):(duplica xs) (2)

sum1 :: [Int] -> Int
sum1 [] = 0                         (3)
sum1 (x:xs) = x + sum1 xs           (4)

HIPOTESIS INDUCTIVA
sum1(duplica xs) = 2 * sum1 xs

CASO BASE
sum1(duplica []) = 2 * sum1 []
sum1([]) = 2 * 0
0 = 0

CASO INDUCTIVO
sum1(duplica x:xs) = 2 * sum1 x:xs
sum1( x*2 : (duplica xs)) =  2 * x + sum1 xs
x*2 + sum1(duplica xs) = 2 * x + sum1 xs        --  HIPOTESIS INDUCTIVA
x*2 + sum1 xs = x*2 + sum1 xs

-- -------------------------------------------------------------------------------


duplica :: [Int] -> [Int]
duplica [] = []                         (1)
duplica (x:xs) = (x*2):(duplica xs)     (2)

cardinal :: [a] -> Int                  
cardinal [] = 0                         (3)
cardinal (x:xs) = 1 + (cardinal xs)     (4)

HIPOTESIS INDUCTIVA 
cardinal ( duplica xs ) = cardinal xs

CASO BASE 
cardinal ( duplica [] ) = cardinal []
cardinal ( [] ) = 0
0=0

CASO INDUCTIVO
cardinal ( duplica x:xs ) = cardinal x:xs
cardinal (x*2 :duplica xs) = 1 + cardinal xs
cardinal (x*2 :duplica xs) = 1 + cardinal (duplica xs)
cardinal (x*2 :duplica xs) = 1 + cardinal (duplica xs)
1 + cardinal (duplica xs) = 1 + cardinal (duplica xs)   -- HIPOTESIS INDUCTIVA


-- -------------------------------------------------------------------------------



quitar0s :: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs)
    | x == 0 = quitar0s xs
    | not(x==0) = x:(quitar0s xs)

sum1 :: [Int] -> Int
sum1 [] = 0                         
sum1 (x:xs) = x + sum1 xs           


HIPOTESIS INDUCTIVA
sum(quitar0s xs) = sum xs

CASO BASE 
sum (quitar0s []) = sum []
sum [] = sum []
0 = 0

CASO INDUCTIVO


X = 0
sum(quitar0s x:xs) = sum x:xs
sum (quitar0s xs) = 0 + sum xs
sum (quitar0s xs) = sum xs
sum xs = sum xs

X != 0
sum(quitar0s x:xs) = sum x:xs
sum(x:(quitar0s xs)) = x + sum xs
x + sum(quitar0s xs) = x + sum xs
x + sum xs = x + sum xs


-------------------------------------------------------------------------------


repetir :: Int -> Int -> [Int]
repetir 0 x = []
repetir y x = x:(repetir y-1 x)

cardinal :: [a] -> Int                  
cardinal [] = 0     
cardinal (x:xs) = 1 + (cardinal xs)

HIPOTESIS INDUCTIVA
cardinal (repetir y x) = y

CASO BASE
cardinal (repetir 0 x) = 0
cardinal [] = 0
0=0

CASO INDUCTIVO
cardinal (repetir (y + 1) x) = y + 1
cardinal (x: (repetir y x)) = y + 1
1+ cardinal (repetir y x) = y + 1
y + 1 = y + 1

-- -----------------------------------------------------------------------------


f :: Int -> Int
f 0 = 0
f (n + 1) = 2 + f n


HIPOTESIS INDUCTIVA
f (n) = 2* n

CASO BASE
f 0 = 2* 0
0 = 0

CASO INDUCTIVO

f (n+1) = 2* n+1
2 + f (n) = 2* (n+1)  -- HI
2*n +2  = 2*n +2 

-- -----------------------------------------------------------------------------

g :: Int -> Int
g 0 = 0
g (n+1) = 1 + g (n)

HIPOTESIS INDUCTIVA
g (n) = n

CASO BASE
g 0 = 0
0 = 0

HIPOTESIS INDUCTIVO
g (n+1) = n+1
1+ g(n) = n+1       -- HI
1 + n = 1 + n


-- -----------------------------------------------------------------------------

FORMULAS

f :: Int -> Int
f n = n*(n+1)/2                     (1)

g :: Int -> Int
g 0 = 0                         
g n+1 = (n + 1) + g(n)              (2)

HIPOTESIS INDUCTIVA
f(n) = g(n)

CASO BASE
f(0) = g (0)
0 * {algo} = 0
0 = 0 

HIPOTESIS INDUCTIVO

f(n + 1) = g(n + 1)
f(n + 1) = (n+1) + g (n)                    -- 2
f(n + 1) = (n+1) + f (n)                    -- HI
(n+1) * ((n+1)+1) /2  = (n+1) + f (n)
(n+1) * (n+2) /2  = (n+1) + f (n)           -- 1
(n+1) * (n+2) /2  = (n+1) + n * (n+1) / 2   -- aritmetica
(n*n + 3n +2) / 2 = (n*n + 3n +2) / 2       -- reflex igual



  
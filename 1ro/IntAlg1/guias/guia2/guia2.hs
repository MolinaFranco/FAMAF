
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * (factorial (x-1))

cardinal :: [a] -> Int
cardinal [] = 0                    
cardinal (x:xs) = 1 + (cardinal xs)

soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs)    | ((mod x 2) == 0) = x:soloPares xs        
                    | otherwise = soloPares xs

mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs) | (x>10) = x:mayoresQue10 xs
                    | otherwise = mayoresQue10 xs

mayoresQue :: Int -> [Int] -> [Int]
mayoresQue y [] = []
mayoresQue y (x:xs) | (x>y) = x:(mayoresQue y xs)
                    | otherwise = (mayoresQue y xs)

sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = (x+1):(sumar1 xs)

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x*2):(duplica xs)

multiplica :: Int -> [Int] -> [Int]
multiplica a [] = []
multiplica y (x:xs) = (x*y):(multiplica y xs)

todosMenoresQue10 :: [Int] -> Bool
todosMenoresQue10 [] = True
todosMenoresQue10 (x:xs) 
    | x < 10 = todosMenoresQue10 xs
    | otherwise = False

hay0 :: [Int] -> Bool
hay0 [] = False
hay0 (x:xs)  
    | (x == 0) = True
    | otherwise = hay0 xs

miSum :: [Int] -> Int
miSum [] = 0
miSum (x:xs) = x + miSum xs 

repartir :: [String] -> [String] -> [(String, String)]
repartir [] x = []
repartir x [] = []
repartir (x:xs) (y:ys) = (x, y):(repartir xs ys)

apellidos :: [(String, String, Int)] -> [String]
apellidos [] = []
apellidos ((a,b,c):xs) = a:(apellidos xs)

miDrop :: Int -> [a] -> [a]
miDrop 0 x = x
miDrop x [] = []
miDrop i (x:xs) 
    | i < 0 = x:xs
    | i >= 0 = miDrop (i-1) xs

inverso :: [a] -> [a]
inverso [] = []
inverso x = (last x):
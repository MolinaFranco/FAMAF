estaEnDNI :: Int -> Bool
estaEnDNI 4 = True
estaEnDNI 1 = True
estaEnDNI 9 = True
estaEnDNI 2 = True
estaEnDNI 5 = True
estaEnDNI 3 = True
estaEnDNI _ = False

sumaDNI :: [Int] -> Int
sumaDNI [] = 0
sumaDNI (x:xs)  | (estaEnDNI x) = x + sumaDNI xs
                | otherwise = sumaDNI xs

sumatoria' :: [Int] -> (Int -> Bool) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f | (f x) = x + sumatoria' xs f
                    | otherwise = sumatoria' xs f

sumaDNI' :: [Int] -> Int
sumaDNI' x = sumatoria' x (estaEnDNI)

reducir :: [a] -> (a -> a -> a) -> a
reducir (x:[]) _ = x
reducir (x:y:xs) op = op x (reducir (y:xs) op)

-- tema B

separar :: [a] -> (a -> Bool) -> ([a],[a])
separar [] _ = ([],[])
separar xs f = separar' [] [] xs f
                
separar' :: [a] -> [a] -> [a] -> (a -> Bool) -> ([a], [a])
separar' a b []  _ = (a, b) 
separar' a b (x:xs) f   | f x = separar' (x:a) b xs  f
                        | otherwise = separar' a (x:b) xs f

separar'' :: [a] -> (a -> Bool) -> ([a],[a])
separar'' [] _ = ([],[])
separar'' xs f =  (filter f xs , filter (not . f) xs)

-- tema D

aplicaSegun :: [Int] -> Int -> (Int -> a) -> (Int -> a) -> [a]
aplicaSegun [] _ _ _ = []
aplicaSegun (x:xs) n f g    | x >= n = (f x): aplicaSegun xs n f g
                            | otherwise = (g x): aplicaSegun xs n f g

--tema E

alterna :: [a] -> (a->b) -> (a->b) -> [b]
alterna [] _ _ = []
alterna (x:xs) f g = (f x) : (alterna xs g f) 


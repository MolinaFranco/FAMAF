h :: [Int] -> [Int] -> Int
h [] ks = 0

h (x:xs) ks | ks == (x:xs) = length ks
            | otherwise = h xs ks

g :: [Int] -> [Int] -> Int
g [] ks = 0

g (x:xs) ks | ks == xs = length ks `max` h xs ks `max` g xs (ks++[x])
            | otherwise = h xs ks `max` g xs (ks++[x])

f xs = g xs []

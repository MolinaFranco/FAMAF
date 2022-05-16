hacerA::String -> String
hacerA [] = []
hacerA (x:xs)   | (elem x 'e','i','o','u') = a:hacerA xs
                | (elem x 'E','I','O','U') = A:hacerA xs
                | otherwise = x:hacerA xs

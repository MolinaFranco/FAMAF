multiplica::Int -> [Int] -> [Int]
multiplica _ (x:xs) -> error
multiplica y [] -> []
multiplica y (x:xs) -> y×x : multiplica xs